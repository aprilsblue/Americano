class SolutionsController < ApplicationController
  def index
    @book = Book.find(params[:id])
    solutions = Solution.all.order(:chapter)
    @chapters = solutions.where("chapter IS NOT NULL").pluck(:chapter).uniq

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @solutions }
    end
  end

  def new
    @solution = Solution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @solution }
    end
  end

  def create
    @solution = Solution.new(solution_params)

    respond_to do |format|
      if @solution.save
        flash[:notice] = 'Solution was successfully created.'
        format.html { redirect_to(@solution) }
        format.xml  { render xml: @solution, status: :created, location: @solution }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @solution }
    end
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update
    @solution = Solution.find(params[:id])

    respond_to do |format|
      if @solution.update(solution_params)
        flash[:notice] = 'Solution was successfully updated.'
        format.html { redirect_to(@solution) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to(solutions_url) }
      format.xml  { head :ok }
    end
  end
end
