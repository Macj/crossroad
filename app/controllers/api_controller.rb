class ApiController < ApplicationController
  protect_from_forgery
  before_filter :parse_params

  def content
    content_class = nil
    @content = nil
    if @filters['section_type']
      content_class = eval(@filters['section_type'].humanize)
    end
    if content_class
      @content = content_class.where('id IS NOT NULL')
      if @filters['category_id']
        @content = @content.where(:category_id => @filters['category_id'])
      end
      if @filters['type_id'] && @filters['type_id'] != ""
        @content = @content.where(:type_id => @filters['type_id'])
      end
      if @filters['date_from'] and content_class.has_column?('date_from')
        @content = @content.where(:date_from => @filters['date_from'])
      end
      if @filters['date_to'] and content_class.has_column?('date_to')
        @content = @content.where(:date_to => @filters['date_to'])
      end
    end
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

# map behavior
  def points
    places = Place.where(:category_id => @filters['category_id'])
    info = []
    places.each do |elem|
      item = elem.get_map_info
      info << item
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: info }
    end
  end

  private
    def parse_params
      @filters = ActiveSupport::JSON.decode(params['filters']) if params['filters']
    end
end
