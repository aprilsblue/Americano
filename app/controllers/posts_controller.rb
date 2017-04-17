class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  #index is in Book#show

  def new
    @book = Book.find(params[:book_id])
    if params[:page].to_i == 0
      @page = 1
    else
      @page = params[:page]
    end
    @post = Post.new(page: @page)

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
        format.html { redirect_to(book_path(@post.book, page: @post.page)) }
        format.xml  { render xml: @post, status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @book = params[:book]
    @page = params[:page]
    @post = Post.find(params[:post])
  end

  def append
    @post = Post.new(post_params)
    @post.book_id = params[:book].to_i
    @post.user_id = current_user.id
    @post.is_child = true
    @parent = params[:parent].to_i


    respond_to do |format|
      if @post.save
        if Post.find(@parent).parents.present?
          PostPost.create(parent_id: Post.find(@parent).parents.take.id, child_id: @post.id)
        else
          PostPost.create(parent_id: @parent, child_id: @post.id)
        end
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(book_path(@post.book, page: @post.page)) }
        format.xml  { render xml: @post, status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @post = Post.find(params[:id])
    @user_note = MyNote.where(user_id: current_user).map { |m| [m.title, m.id] }

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
    @book = @post.book
    @page = params[:page]
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

  def like
    @user_id = current_user.id
    @post_id = params[:id].to_i

    isnil = Like.where(post_id: @post_id, user_id: @user_id)
    if isnil.empty?
      likeit = Like.new(post_id: @post_id, user_id: @user_id)
      if params[:val] == "dislike"
        likeit.evaluate = -1
      end
      likeit.save
    else
      isnil.take.destroy
    end
    respond_to do |format|
      format.html { redirect_to post_path(@post_id) }
      format.js
    end
  end

  def scarp_new

  end

  def scrap


  end
  private
  def post_params
    params.require(:post).permit(:content, :page, :user_id, :book_id)
  end
end


