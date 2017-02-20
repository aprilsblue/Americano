class RepliesController < ApplicationController
  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @repliess }
    end
  end

  def new
    @reply = Reply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @reply }
    end
  end

  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        flash[:notice] = 'Reply was successfully created.'
        format.html { redirect_to(@reply) }
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
  end

  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update(reply_params)
        flash[:notice] = 'Reply was successfully updated.'
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
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to(replys_url) }
      format.xml  { head :ok }
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :post_id)
  end
end
