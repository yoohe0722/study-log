class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @count_all = @posts.sum(:study_time)
    @count_all_hour = @count_all/60.round(1)
    @count_month =@posts.by_month(field: :date).sum(:study_time)
    @count_month_hour = @count_month/60.round(1)
    @count_week =@posts.by_week(field: :date, startday: :monday).sum(:study_time)
    @count_week_hour = @count_week/60.round(1)
  end
end
