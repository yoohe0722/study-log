class PostsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.order("id DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Post.create(name: post_params[:name], image: post_params[:image], text: post_params[:text], user_id: current_user.id)
  end

  private
    def post_params
      params.permit(:name, :image, :text)
    end

    def move_to_index
      rredirect_to action: :index unless user_signed_in?
    end
end
