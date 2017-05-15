class MyNotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_notes = current_user.my_notes.all.reverse
    @my_friends = current_user.followers.where(user_friends: {status: "friend"}).all + current_user.followees.where(user_friends: {status: "friend"}).all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @my_note = MyNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @my_note }
    end
  end

  def create
    @my_note = MyNote.new(my_note_params)
    @my_note.user_id = current_user.id

    respond_to do |format|
      if @my_note.save
        UserNote.create(user_id: current_user.id, my_note_id: @my_note.id, authority: "all")
        flash[:notice] = 'MyNote was successfully created.'
        format.html { redirect_to(@my_note) }
        format.xml  { render xml: @my_note, status: :created, location: @my_note }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @my_note.errors, status: :unprocessable_entity }
        puts(@my_note.errors.full_messages)
      end
    end
  end

  def show
    @my_note = MyNote.find(params[:id])
    @my_posts = @my_note.post_notes.order('number') # number is position
    @authority = params[:authority]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @my_note }
    end
  end

  def edit
    @my_note = MyNote.find(params[:id])
  end

  def update
    @my_note = MyNote.find(params[:id])

    respond_to do |format|
      if @my_note.update(my_note_params)
        flash[:notice] = 'MyNote was successfully updated.'
        format.html { redirect_to(@my_note) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @my_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_note = MyNote.find(params[:id])
    @my_note.destroy

    respond_to do |format|
      format.html { redirect_to(my_notes_url) }
      format.xml  { head :ok }
    end
  end

  def delete_post
    @post_note = PostNote.where(post_id: params[:id], my_note_id: params[:my_note_id]).take
    @post_note.destroy

    @my_note = MyNote.find(params[:my_note_id])
    @my_posts = @my_note.posts.includes(:post_notes).order('post_notes.number')

    respond_to do |format|
      format.js
      format.xml  { head :ok }
    end
  end

  def share
    @my_note = UserNote.new(user_id: params[:friend].to_i, my_note_id: params[:note].to_i, authority: "read")

    respond_to do |format|
      if @my_note.save
        flash[:notice] = 'MyNote was successfully created.'
        format.html { redirect_to my_notes_path }
        format.xml  { render xml: @my_note, status: :created, location: @my_note }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @my_note.errors, status: :unprocessable_entity }
        puts(@my_note.errors.full_messages)
      end
    end
  end

  def sort
    params[:post_note].each_with_index do |id, index|
      PostNote.find(id).update( {number: index + 1} )
    end

    render nothing: true
  end

  private
  def my_note_params
    params.require(:my_note).permit(:title, :user_id, :authority)
  end
end
