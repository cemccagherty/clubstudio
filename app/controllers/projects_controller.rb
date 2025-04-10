class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @posts = Post.where(project: @project)
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
