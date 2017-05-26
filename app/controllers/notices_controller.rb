class NoticesController < ApplicationController
  before_action :authenticate_any!

  def index
    @notices = Notice.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @noticess }
    end
  end

  def new
    @notice = Notice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @notice }
    end
  end

  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        flash[:notice] = 'Notice was successfully created.'
        format.html { redirect_to(@notice) }
        format.xml  { render xml: @notice, status: :created, location: @notice }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @notices = Notice.all.reverse
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @notice }
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])

    respond_to do |format|
      if @notice.update(notice_params)
        flash[:notice] = 'Notice was successfully updated.'
        format.html { redirect_to(@notice) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to(notices_url) }
      format.xml  { head :ok }
    end
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :content, :user_id)
  end
end
