class PostsController < ApplicationController
  before_action :move_to_index, except: :index

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

    def move_to_index
      rredirect_to action: :index unless user_signed_in?
    end
end
