class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @questionss }
    end
  end

  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @question }
    end
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(@question) }
        format.xml  { render xml: @question, status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @question }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update(question_params)
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(@question) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :prize, :page, :chapter_id, :book_id, :user_id)
  end

end
