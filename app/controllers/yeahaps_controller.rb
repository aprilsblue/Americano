class YeahapsController < ApplicationController
  before_action :authenticate_user!

  #index is in mynote#index

  def new
    @page = Page.new
  end

  def create
    page = Page.where(url: page_params.url).take
    if page.nil?
      page = Page.new(page_params)
      page.save
    end

    yeahap = Yeahap.new(user_id: current_user.id, page_id: page.id)
    respond_to do |format|
      if yeahap.save
        flash[:notice] = 'Yeahap! Successfully complete your action!'
        format.html { redirect_to(root_path) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @yeahap = Yeahap.find(params[:id])
  end

  def update
    @yeahap = Yeahap.find(params[:id])

    respond_to do |format|
      if @yeahap.update(yeahap_params)
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(root_path) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @yeahap = Yeahap.find(params[:id])
    @yeahap.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml  { head :ok }
    end
  end

  private
  def page_params
    params.require(:page).permit(:url, :content)
  end

end
