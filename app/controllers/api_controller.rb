class ApiController < ApplicationController
  protect_from_forgery
  before_filter :parse_params
  before_filter :set_section, :only => :points
  
  # TODO USE CONTENT MODEL
  def content
    @content = Data.get_content(@filters)
    render "/#{@filters['section_type'].pluralize}/_content", :formats=>[:html], :handlers=>[:haml], :layout => nil, :status => 200, :locals => {:content => @content}
  end

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
    category_id = params['category_id']
    section = params['section']
    type_name = params['type_name']
    @type = Type.new(:category_id => category_id, :section_type => section, :name => type_name)
    if @type.save
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @type}
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: {:error => @type.errors.to_json}}
      end
    end
  end

  # map behavior 
  # TODO USE CONTENT MODEL
  def points
    @content = Data.get_content(@filters)
    info = set_gon_points(@content_class)
    respond_to do |format|
      format.html 
      format.json { render json: info }
    end
  end

  private
    def parse_params
      @filters = ActiveSupport::JSON.decode(params['filters']) if params['filters']
    end

    def set_section
      @section = SECTIONS.select{|k,v| k == @filters['section_type']}.first
      @content_class = eval(@section[0].humanize)
    end
end
