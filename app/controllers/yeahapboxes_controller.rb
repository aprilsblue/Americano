class YeahapboxesController < ApplicationController
  def new
    @yeahapbox = Yeahapbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @yeahapbox }
      format.js # new.js.erb
    end
  end

  def create
    @yeahapbox = Yeahapbox.new(yeahapbox_params)
    @yeahapbox.user_id = current_user.id

    respond_to do |format|
      if @yeahapbox.save
        flash[:notice] = 'Yeahap Box was successfully created.'
        format.html { redirect_to root_path }
      else
        flash[:notice] = 'Something is wrong, we cannot make your box.'
        format.html { redirect_to root_path }
        puts @yeahapbox.errors.full_messages
      end
    end
  end

  def destroy
    @box = Yeahapbox.find(params[:id])
    @box = Yeahapbox.destroy

    respond_to do |format|
      flash[:notice] = 'Yeahap Box was successfully deleted.'
      format.html { redirect_to root_path }
    end
  end

  def update
    @box = Yeahapbox.find(params[:box_id]).update(title: params[:box_title])
    render nothing: true
  end

  def sort
    params[:yeahapbox].each_with_index do |id, index|
      Yeahapbox.find(id).update( {position: index + 1} )
    end
  end

  private
  def yeahapbox_params
    params.require(:yeahapbox).permit(:user_id, :title)
  end
end
