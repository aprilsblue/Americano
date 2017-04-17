class MyNotesController < ApplicationController
  def index
    @my_notes = current_user.my_notes.all.reverse
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
    @my_posts = @my_note.posts.all

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
    post_id = params[:id].to_i
    @like = Like.where(post_id: post_id, user_id: current_user.id)
    @like.take.destroy
    @my_post = current_user.like_posts
  end

  private
  def my_note_params
    params.require(:my_note).permit(:title, :user_id)
  end
end
