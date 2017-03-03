class LikesController < ApplicationController

  def index
    @likepost = Like.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @likepost }
    end
  end

  def create
    @Like = Like.new(like_params)

    respond_to do |format|
      if @Like = Like.save
        flash[:notice] = 'Like was successfully created.'
        format.html { redirect_to(@Like) }
        format.xml  { render xml: @Like, status: :created, location: @Like}
      end
    end
  end
  def destroy
    @Like = Like.find(like_params)
    @Like = Like.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  private
  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

end
