class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def new
    @model_class_name = ModelClassName.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @ass_name = Model }
    end
  end
end
