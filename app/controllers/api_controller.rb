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

  def new_type
    category_id = params[:category_id]
    section = params[:section]
    type_name = params[:type_name]
    @type = Type.new(:category_id => category_id, :section_type => section, :name => type_name)
    @type.save
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type}
    end
  end
end
