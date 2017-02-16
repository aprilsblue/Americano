class OpinionsController < ApplicationController
  def index
    @opinions = Opinions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @opinionss }
    end
  end

  def new
    @opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @opinion }
    end
  end

  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        flash[:notice] = 'Opinion was successfully created.'
        format.html { redirect_to(@opinion) }
        format.xml  { render xml: @opinion, status: :created, location: @opinion }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @opinion }
    end
  end

  def new
    @opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @opinion }
    end
  end

  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        flash[:notice] = 'Opinion was successfully created.'
        format.html { redirect_to(@opinion) }
        format.xml  { render xml: @opinion, status: :created, location: @opinion }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @opinion }
    end
  end

  def edit
    @opinion = Opinion.find(params[:id])
  end

  def update
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      if @opinion.update(opinion_params)
        flash[:notice] = 'Opinion was successfully updated.'
        format.html { redirect_to(@opinion) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to(opinions_url) }
      format.xml  { head :ok }
    end
  end

  private
  def opinion_params
    params.require(:opinion).permit(:content, :category, :user_id, :quote_id)
  end
end
