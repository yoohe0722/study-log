class LikesController < ApplicationController

  def create
    Like.create(post_id: params[:post_id], user_id: current_user.id)
  end

  def destroy
    unlike = Like.find(post_id: params[:post_id],user_id: current_user.id )
    unlike.destroy if unlike.user_id == current_user.id
  end
end
