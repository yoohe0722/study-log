class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, except: [:index, :new, :create]
  helper_method :monthly_ranking

  def index
    @posts = Post.includes(:user).page(params[:page]).per(5).order("created_at DESC").limit(50)
  end

  def new
  end

  def create
    @new_post = Post.new(date: post_params[:date], study_time: post_params[:study_time], text: post_params[:text], user_id: current_user.id)
    unless @new_post.save
      flash.now[:alert] = '必須項目が入力されていません。'
      render :new
    end
  end

  def destroy
    @post.destroy if @post.user_id == current_user.id
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @post.user_id == current_user.id
      unless @post.update(post_params)
        flash.now[:alert] = '必須項目が入力されていません。'
        render :edit
      end
    end

  end

  def show
    @comments = @post.comments.includes(:user)
  end

  # def monthly_ranking
  #   binding.pry
  #   @monthly_ranking = User.find(Post.group(:user_id).order('sum(:study_time) desc').limit(3))
  # end

  private
    def post_params
      params.permit(:date, :study_time, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
