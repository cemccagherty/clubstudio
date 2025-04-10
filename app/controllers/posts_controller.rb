class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
    @comment = Comment.new
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

  def destroy
    @post = Post.find(params[:id])
    @project = @post.project
    @post.destroy
    redirect_to project_path(@project), status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
