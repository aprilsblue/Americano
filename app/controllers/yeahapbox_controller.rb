class YeahapboxController < ApplicationController

  def new
    @box = Yeahapbox.new
    respond_to do |format|
      format.js '/yeahaps/new_yeahapbox.js'
    end
  end

  def create
    @box = Yeahapbox.new(yeahapbox_params)

    respond_to do |format|
      if @box.save
        flash[:notice] = 'Yeahap Box was successfully created.'
        format.html { redirect_to root_path }
      else
        flash[:notice] = 'Something is wrong, we cannot make your box.'
        format.html { redirect_to root_path }
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

  def edit
    @box = Yeahapbox.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @box = Yeahapbox.find(params[:id])

    respond_to do |format|
      if @box.update(title: yeahapbox_params[:title])
        flash[:notice] = 'Yeahapbox was successfully updated.'
        format.html { redirect_to(root_path) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def yeahapbox_params
    params.require(:yeahapbox).permit(:user_id, :title)
  end
end
