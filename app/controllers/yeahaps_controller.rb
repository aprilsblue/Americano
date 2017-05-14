class YeahapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @yeahaps = Yeahap.where(user_id: current_user.id).all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @yeahps }
    end
  end
  #create is page#create because nested_attribute

  def edit
    @yeahap = Yeahap.find(params[:id])
  end

  def update
    @yeahap = Yeahap.find(params[:id])

    respond_to do |format|
      if @yeahap.update(content: yeahap_params[:content])
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
    @yeahaps = Yeahap.where(user_id: current_user.id).all

    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml  { head :ok }
    end
  end

  private
  def yeahap_params
    params.require(:yeahap).permit(:content)
  end

end
