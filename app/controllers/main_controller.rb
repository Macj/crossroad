#encoding: utf-8
class MainController < ApplicationController
  #protect_from_forgery
  before_filter :sections_init
  def index
  end

  def search
    @categories = Category.main
  end

  def map
    @filters = {}
    if @section
      @types = Type.where(:section_type => @section[0])
      @filters = {section_type: @section[0]}
      #todo limit
      @content = eval(@section[0].humanize).all
      #set_gon_points
      puts 'points', set_gon_points().inspect
    else
      place_ids = Place.all.map(&:id) + Event.all.map(&:place_id)
      gon.points = Place.get_info_for_all place_ids
      #set_gon_points
      puts 'points', gon.points
    end
    @categories = Category.main

  end

  def section
    @categories = Category.main
    @types = Type.where(:section_type => @section[0])
    @filters = {section_type: @section[0]}
    #todo limit
    @content = @content_class.order(:created_at).page(params[:page]).per(9)
    puts @section[0]

    puts 'points', set_gon_points(@content_class).inspect
  end

  def form
    puts params.inspect 
    if params[:element]
      @error = false
      element = params[:element]
      parameters = {
        :category_id => element[:category_id],
        :type_id     => element[:type_id],
        :name        => element[:name],
        :picture     => element[:picture]
      }
      case element[:section]
      when "article"
        article = element[:article]
        parameters.merge!( {
          :autor   => article[:autor],
          :body    => article[:body],
          :sources => article[:sources]
        })
      when "event"
        event = element[:event]
        parameters.merge!({
          :start_at  => event[:start_at],
          :end_at    => event[:end_at],
          :description => event[:description],
          :web_links   => event[:web_links]
        })
      when "project"
        project = element[:project]
        parameters.merge!({
          :description => project[:description],
          :web_links   => project[:web_links]
        })
      when "place"
        place = element[:place]
        parameters.merge!({
          :description => place[:description],
          :web_links   => place[:web_links]
        })
      else
        flash[:error] = 'Неизвестный тип объекта. Повторите попытку.'
        @error = true
      end
      #creation of the some thing
      # puts @error
      # puts flash.inspect
      unless @error
        class_obj = eval(element[:section].humanize)
        @thing = class_obj.new(parameters)
        if @thing.save
          redirect_to @thing
        else
          flash[:error] = 'Допущена ошибка. повторите попытку1'
        end
      else
        flash[:error] = 'Допущена ошибка. повторите попытку2'
      end
    end
  end

  private
    def sections_init
      @sections = SECTIONS
      @section = SECTIONS.select{|k,v| k == params['section_type']}.first
      if @section
        @content_class = eval(@section[0].humanize)
      end
    end
end

