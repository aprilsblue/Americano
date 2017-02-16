class QuotesController < ApplicationController
  def index
    @quotes = Quote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @quotess }
    end
  end

  def new
    @quote = Quote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @quote }
    end
  end

  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        flash[:notice] = 'Quote was successfully created.'
        format.html { redirect_to(@quote) }
        format.xml  { render xml: @quote, status: :created, location: @quote }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @quote }
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update(quote_params)
        flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to(@quote) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
  end

  private
  def quote_params
    params.require(:quote).permit(:content, :user_id, :chapter_id)
  end
end
