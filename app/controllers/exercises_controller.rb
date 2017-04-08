class ExercisesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @book = Book.find(params[:id])
    exercises = Exercise.all.order(:chapter_id)
    @chapters = exercises.where("chapter_id IS NOT NULL").pluck(:chapter_id).uniq
    if params[:chapter].nil?
      @exercises = Exercise.where(chapter_id: @chapters[0]).all.reverse
    else
      @exercises = Exercise.where(unit: params[:chapter]).all.reverse
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @exercisess }
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

  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @exercise }
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
    params.require(:exercise).permit(:number, :content, :prize, :chapter_id, :book_id, :user_id)
  end

end
