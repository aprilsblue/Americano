class MyPagesController < ApplicationController
  before_action :authenticate_user!

  def index
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
      if UserFriend.find_by(follower_id: current_user.id, followee_id: user.id).present?
        @message = "Already exists"
      else
        newFriend = UserFriend.new(follower_id: current_user.id, followee_id: user.id)
        if newFriend.save
          @message = "Success!!"
        else
          puts newFriend.errors.full_messages
        end
      end
    else
      @message = "It is not existed"
    end

    @followees = current_user.followees.all
    @count = @followees.count

    respond_to do |format|
      format.js   #friend.js.erb
      format.xml  { render xml: @my_pages }
    end
  end
end
