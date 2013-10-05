class ProjectsController < ApplicationController
  protect_from_forgery

   def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    puts params.inspect
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project)
    else
      flash[:error] =  @project.errors.to_s
      redirect_to :action => :edit
    end
  end  

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to project_path(@project)
    else
      flash[:error] =  @project.errors.to_s
      redirect_to :action => :new
    end    
  end
end
