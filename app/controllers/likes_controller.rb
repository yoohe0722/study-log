class LikesController < ApplicationController
  before_action :set_variables

  def create
    Like.create(post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])  }
      format.json
    end
  end

  def destroy
    unlike = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    unlike.destroy if unlike.user_id == current_user.id
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])  }
      format.json
    end
  end

  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#like-link-#{@post.id}"
  end

  def likes_params
    params.permit(:post_id, :user_id)
  end
end
