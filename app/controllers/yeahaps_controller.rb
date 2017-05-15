class YeahapsController < ApplicationController
  before_action :authenticate_user!
  before_action :cors_allow_all, only: [:yeahap]

  def cors_allow_all
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def index
    @yeahaps = Yeahap.where(user_id: current_user.id).all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @yeahps }
    end
  end
  #create is page#create because nested_attribute

  def yeahap
    if user_signed_in?
      puts session[:session_id]
      render json: {result: "response_succees", user: current_user.email }
    else
      render json: {result: "no", user: "none"}
    end
  end

  def edit
    @yeahap = Yeahap.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @yeahap = Yeahap.find(params[:id])

    respond_to do |format|
      if @yeahap.update(content: yeahap_params[:content])
        flash[:notice] = 'Yeahap was successfully updated.'
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
