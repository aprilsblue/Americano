class PagesController < ApplicationController
  def new
    @page = Page.new
    @yeahaps = @page.yeahaps.build
  end

  def create
    page = Page.where(url: params[:page][:url]).take
    if page.nil?
      page = Page.new(url: params[:page][:url])
      page.save
    end

    yeahap = Yeahap.new(yeahapbox_id: current_user.pick_basic_box.id,
                        content: params[:page][:yeahaps_attributes].values[0][:content],
                        user_id: current_user.id,
                        page_id: page.id)
    respond_to do |format|
      if yeahap.save
        flash[:notice] = 'Yeahap! Successfully complete your action!'
        format.html { redirect_to(root_path) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def page_params
    params.permit(:page).permit(:url, yeahaps_attributes: [:id, :content, :_destroy])
  end
end
