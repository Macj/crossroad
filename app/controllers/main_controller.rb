class MainController < ApplicationController
  protect_from_forgery

   def index
    @categories = Category.main
  end
end

