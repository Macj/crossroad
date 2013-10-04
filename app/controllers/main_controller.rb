#encoding: utf-8
class MainController < ApplicationController
  #protect_from_forgery

   def index
   	puts Category.main.inspect
    @categories = Category.main
  end
end

