class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  #index is in Book#show

  def new
    @book = Book.find(params[:book_id])
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @post }
    end
  end

  def create
    @book = Book.find(params[:book_id])
    @post = @book.posts.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(book_path(@post.book)) }
        format.xml  { render xml: @post, status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(book_path(@post.book, page: @post.page)) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    page = @post.page
    book = @post.book
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(book_path(book, page: page)) }
      format.xml  { head :ok }
    end
  end

  def hashtag
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts.where(book_id: params[:book_id].to_i)
    @book = Book.find_by(id: params[:book_id].to_i)
    render "/books/show"
  end

  private

  def post_params
    params.require(:post).permit(:content, :page, :user_id, :book_id)
  end
end
