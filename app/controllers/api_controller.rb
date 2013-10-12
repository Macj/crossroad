class ApiController < ApplicationController
  protect_from_forgery

  def type_list
    category_id = params[:category_id]
    section = params[:section]
    @type_list = Type.where(:category_id => category_id, :section_type => section)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type_list}
    end
  end
end
