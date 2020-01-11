class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @study_time_all = @posts.sum(:study_time)
    @study_time_all_hour = @study_time_all/60.round(1)
    @study_time_month =@posts.by_month(field: :date).sum(:study_time)
    @study_time_month_hour = @study_time_month/60.round(1)
    @study_time_week =@posts.by_week(field: :date, startday: :monday).sum(:study_time)
    @study_time_week_hour = @study_time_week/60.round(1)
  end
end
