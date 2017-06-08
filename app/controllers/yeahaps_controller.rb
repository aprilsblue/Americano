class YeahapsController < ApplicationController
  before_action :authenticate_any!, except: [:create, :exportBookmark, :userCheck]
  before_action :cors_allow_all, only: [:create, :exportBookmark, :userCheck]
  skip_before_filter :verify_authenticity_token, only: [:create, :exportBookmark, :userCheck]

  def cors_allow_all
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def index
    if admin_signed_in?
    else
      @yeahapbox = Yeahapbox.where(user_id: current_user.id).all
      @yeahaps = Yeahap.where(user_id: current_user.id).all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render xml: @yeahps }
      end
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
      render json: {result: "fail"}
    end
  end

  def create_helper(bookmark, directories)
    data = bookmark.split("|&D&|")
    box_title = directories[data[2].to_s]
    box_id = Yeahapbox.where(user_id: current_user.id, title: box_title).first.id

    page = Page.where(url: data[0]).take
    if page.nil?
      page = Page.new(url: data[0])
      page.save
    end
    yeahap = current_user.yeahaps.where(page_id: page.id).take
    if yeahap.nil?
      yeahap = Yeahap.new(yeahapbox_id: box_id, content: data[1], user_id: current_user.id, page_id: page.id)
      yeahap.save
    end
  end

  def exportBookmark
    if user_signed_in?
      render json: {result: "succees"}
      bookmarks = JSON.parse(params[:bookmarks])
      directories = JSON.parse(params[:directory])

      #make yeahapbox
      directories.each do |key, value|
        Yeahapbox.create(user_id: current_user.id, title: value)
      end

      bookmarks.each do |bookmark|
        create_helper(bookmark, directories)
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


  def sort
    box_id = params[:box_id].to_i
    yeahap_target_id = params[:target_yeahap].to_i
    yeahaps_count = Yeahapbox.find(box_id).yeahaps.count
    yeahaps_order = []
    params[:yeahaps].split("&").each do |y|
      yeahaps_order << y.split("=")[1]
    end

    @box_id = box_id
    @yeahaps_count = yeahaps_count

    if yeahaps_count < yeahaps_order.count
      Yeahap.find(yeahap_target_id).update( {yeahapbox_id: box_id} )
      @yeahaps_count += 1
    else
      if yeahaps_count == yeahaps_order.count
      else
        @yeahaps_count -= 1
        yeahaps_order = yeahaps_order.drop(yeahap_target_id)
      end
    end

    yeahaps_order.each_with_index do |id, index|
      Yeahap.find(id).update( {position: index + 1} )
    end

    render "yeahaps/update_count.js.erb", format: :js
  end


  private
  def yeahap_params
    params.require(:yeahap).permit(:content)
  end

end

