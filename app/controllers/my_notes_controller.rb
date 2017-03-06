class MyNotesController < ApplicationController
  def index
    @my_post = current_user.like_posts
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def destroy
    post_id = params[:id].to_i
    @like = Like.where(post_id: post_id, user_id: current_user.id)
    @like.take.destroy
    @my_post = current_user.like_posts
  end
end
