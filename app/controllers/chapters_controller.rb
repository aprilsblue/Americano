class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    if params[:book].nil?
      @book = Book.find(params[:id])
    else
      @book = Book.find(params[:book])
    end
    @chapters = @book.chapters

    if params[:chapter].nil?
      @chapter = @chapters.first
    else
      @chapter = Chapter.find(params[:chapter])
    end

    @exercises = @chapter.exercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @chapters }
    end
  end

  def new
    @exercise = Exercise.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @exercise }
    end
  end

  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        flash[:notice] = 'Exercise was successfully created.'
        format.html { redirect_to(@exercise) }
        format.xml  { render xml: @exercise, status: :created, location: @exercise }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update(exercise_params)
        flash[:notice] = 'Exercise was successfully updated.'
        format.html { redirect_to(@exercise) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to(exercises_url) }
      format.xml  { head :ok }
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:number, :content, :prize, :chapter_id, :user_id)
  end


end
