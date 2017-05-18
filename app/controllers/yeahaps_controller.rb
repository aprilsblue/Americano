class YeahapsController < ApplicationController
  before_action :authenticate_user!
  before_action :cors_allow_all, only: [:yeahap]
  skip_before_filter :verify_authenticity_token, only: [:create, :check, :userCheck]

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

  def userCheck
    if user_signed_in?
      render json: {result: "success", user: current_user.email}
    else
      render json: {result: "fail"}
    end
  end

  def check
    if user_signed_in?
      url = JSON.parse(params[:check_url])
      @check = []
      url.each do |u|
        if current_user.pages.where(url: u).present?
          @check << u
        end
      end
      render json: {result: @check}
    end
  end

  def create
    if user_signed_in?
      page = Page.where(url: params[:url]).take
      if page.nil?
        page = Page.new(url: params[:url])
        page.save
      end

      yeahap = Yeahap.where(page_id: page.id).take
      if yeahap.nil?
        yeahap = Yeahap.new(content: params[:content], user_id: current_user.id, page_id: page.id)
        yeahap.save
        render json: {result: "succees"}
      else
        render json: {result: "exist"}
      end
    else
      render json: {result: "fail"}
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
