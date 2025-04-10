class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @post = Post.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    @post.project = @project
    if @post.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
