class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @chapters }
    end
  end

  def new
    @chapter = Chapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @chapter }
    end
  end

  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        flash[:notice] = 'Chapter was successfully created.'
        format.html { redirect_to(@chapter) }
        format.xml  { render xml: @chapter, status: :created, location: @chapter }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @chpater = Chapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @chpater }
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update(chapter_params)
        flash[:notice] = 'Chapter was successfully updated.'
        format.html { redirect_to(@chapter) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chpater = Chapter.find(params[:id])
    @chpater.destroy

    respond_to do |format|
      format.html { redirect_to(chpaters_url) }
      format.xml  { head :ok }
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit(:title, :ch_no, :book_id, :user_id)
  end
end
