class RepliesController < ApplicationController
  def index
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    @replies = @post.replies.all

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render xml: @repliess }
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @reply = Reply.new

    respond_to do |format|
      format.js # new.js.erb
      format.html # new.html.erb
      format.xml  { render xml: @reply }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        flash[:notice] = 'Reply was successfully created.'
        format.html { redirect_to post_path(@post, page: @post.page) }
        format.xml  { render xml: @reply, status: :created, location: @reply }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @reply }
    end
  end

  def edit
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.js # edit.js.erb
    end
  end

  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update(reply_params)
        flash[:notice] = 'Reply was successfully updated.'
        format.js # update.js.erb
        format.html { redirect_to(@reply) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    post = @reply.post
    page = post.page
    book = post.book
    @reply.destroy
    @replies = post.replies
    @post_id = post.id

    respond_to do |format|
      format.js   { render 'reload.js.erb' }
      format.html { redirect_to(book_path(book, page: page)) }
      format.xml  { head :ok }
    end
  end

  def back
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.js  { render 'update.js.erb' }
      format.xml { head :ok }
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :user_id, :post_id)
  end
end
