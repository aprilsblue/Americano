class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:about, :index ]

  def about
    render layout: false
  end

  def index
    if user_signed_in?
      @books = Book.all.paginate(page: params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render xml: @bookss }
      end
    else
      redirect_to  books_about_path
    end
  end

  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @book }
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render xml: @book, status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @all_posts = @book.posts.all.order(:page)
    @reply = Reply.new # for reply new
    @pages = @all_posts.where("page IS NOT NULL").pluck(:page).uniq
    if params[:page].nil?
      @posts = Post.is_parent.where(page: @pages[0]).all.reverse
    else
      @posts = Post.is_parent.where(page: params[:page]).all.reverse
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @book }
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update(book_params)
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :writer, :publisher, :published_at, :user_id, :picture)
  end
end
