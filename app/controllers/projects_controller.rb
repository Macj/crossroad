class ProjectsController < ApplicationController
  protect_from_forgery

   def index
    @projects = Project.all
  end

  def show
    @projects = Projec.find(params[:id])
  end
end
