class LikesController < ApplicationController
  before_action :set_variables

  def create
    Like.create(post_id: params[:post_id], user_id: current_user.id)
  end

  def destroy
    unlike = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    unlike.destroy if unlike.user_id == current_user.id
  end

  def set_variables
    params.permit(:post_id, :user_id)
    @id_name = "#like-link-#{params[:post_id]}"
  end

  def likes_params
    params.permit(:post_id, :user_id)
  end
end
