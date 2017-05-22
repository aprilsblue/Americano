class YeahapsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :userCheck]
  before_action :cors_allow_all, only: [:create, :userCheck]
  skip_before_filter :verify_authenticity_token, only: [:create, :userCheck]

  def cors_allow_all
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def index
    @yeahapbox = Yeahapbox.where(user_id: current_user.id).all
    @yeahaps = Yeahap.where(user_id: current_user.id).all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @yeahps }
    end
  end

  def userCheck
    if user_signed_in?

      # current_user's pages
      url = []
      current_user.pages.each do |p|
        url << p.url
      end

      # friends' pages
      f_url = []
      current_user.followees.each do |f|
        f.pages.each do |p|
          f_url << p.url
        end
      end

      f_url = f_url.uniq

      if params[:user].nil?
        render json: {result: "success", user: current_user.email, url: url, f_url: f_url}
      else
        if params[:user] == current_user.email
          render json: {result: "match", url: url, f_url: f_url}
        else
          render json: {result: "mismatch", user: current_user.email, url: url, f_url: f_url}
        end
      end
    else
      render json: {result: "fail"}
    end
  end

  def create
    if user_signed_in?
      page = Page.where(url: params[:url]).take
      if page.nil?
        page = Page.new(url: params[:url])
        page.save
      end

      yeahap = current_user.yeahaps.where(page_id: page.id).take
      if yeahap.nil?
        yeahap = Yeahap.new(yeahapbox_id: current_user.pick_basic_box.id, content: params[:content], user_id: current_user.id, page_id: page.id)
        yeahap.save
        render json: {result: "succees"}
      else
        render json: {result: "exist"}
      end
    else
      render json: {result: "fai"}
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
