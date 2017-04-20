class MyPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @followers = current_user.followers.all
    @followees = current_user.followees.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @my_pages }
    end
  end

  def friend
    user = User.find_by(email: params[:email])
    user.present? ? @is_present = true : @is_present = false

    if @is_present
      if UserFriend.find_by(follower_id: current_user.id, followee_id: user.id).present? || UserFriend.find_by(followee_id: current_user.id, follower_id: user.id).present?
        @message = "Already exists"
      else
        newFriend = UserFriend.new(follower_id: current_user.id, followee_id: user.id, status: "request")
        if newFriend.save
          @message = "Request is sent"
        else
          puts newFriend.errors.full_messages
        end
      end
    else
      @message = "That is not exist"
    end

    @followers = current_user.followers.all
    @followees = current_user.followees.all

    respond_to do |format|
      format.js   #friend.js.erb
      format.xml  { render xml: @my_pages }
    end
  end

  def accept
    @friendship = UserFriend.where(follower_id: params[:follower].to_i, followee_id: current_user.id).take
    @friendship.update(status: "friend")

    respond_to do |format|
      format.html { redirect_to my_pages_path }
      format.xml  { render xml: @my_pages }
    end
  end
end
