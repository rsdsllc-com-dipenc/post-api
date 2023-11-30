class Api::V1::PostsController < ApplicationController
  # @route GET /api/v1/posts (api_v1_posts)
  def index
    @posts = Post.all
    render json: @posts
  end

  # @route POST /api/v1/posts (api_v1_posts)
  def create
    @post = Post.create post_params

    if @post.valid?
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # @route DELETE /api/v1/posts/:id (api_v1_post)
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    render status: :no_content
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
