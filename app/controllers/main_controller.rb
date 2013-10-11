#encoding: utf-8
class MainController < ApplicationController
  #protect_from_forgery
  SECTIONS = {
    'article' => 'Статьи',
    'event'   => 'События',
    'place'   => 'Места',
    'project' => 'Проекты',
    'person'  => 'Лица',
  }
  before_filter :sections_init

  def index
    @categories = Category.main
  end

  def section
    @section = SECTIONS.select{|k,v| k == params[:section]}.first
    @categories = Category.main
    @content = eval(@section[0].humanize).all
  end  

  def form
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
      when :article
        article = element[:article]
        parameters += {
          :autor   => article[:autor],
          :body    => article[:body],
          :sources => article[:sources],
        }
      when :event
        event = element[:event]
        parameters += {
          :begin_date  => event[:begin_date],
          :end_date    => event[:end_date],
          :description => event[:description],
          :web_links   => event[:web_links]
        }
      when :project
        project = element[:project]
        parameters += {
          :description => project[:description],
          :web_links   => project[:web_links]
        }
      when :place
        place = element[:place]
        parameters += {
          :description => place[:description],
          :web_links   => place[:web_links]
        }
      else
        flash[:error] = 'Неизвестный тип объекта. Повторите попытку.'
        @error = true
      end
      #creation of the some thing
      unless @error
        class_obj = eval(element[:section])
        @thing = class_obj.new(parameters)
        if @thing.save
          redirect_to @thing
        else
          flash[:error] = 'Допущена ошибка. повторите попытку'
        end
      end
    end
  end

  private
    def sections_init
      @sections = SECTIONS
    end
end

