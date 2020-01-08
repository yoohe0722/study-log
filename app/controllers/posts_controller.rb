class PostsController < ApplicationController
  def index
    @posts = Post.order("id DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Post.create(post_params)
  end

  private
    def post_params
      params.permit(:name, :image, :text)
    end
end
