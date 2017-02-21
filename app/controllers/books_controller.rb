class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @bookss }
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
    @posts = @book.posts.all.order(:page)
    @reply = Reply.new # for reply new

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
    params.require(:book).permit(:title, :writer, :publisher, :published_at, :user_id)
  end
end
