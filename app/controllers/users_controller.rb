class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @count_all = @posts.sum(:study_time)
    @count_all_hour = sprintf("%.1f",@count_all/60.to_f)
    @count_month =@posts.by_month(field: :date).sum(:study_time)
    @count_month_hour = sprintf("%.1f",@count_month/60.to_f)
    @count_week =@posts.by_week(field: :date, startday: :monday).sum(:study_time)
    @count_week_hour = sprintf("%.1f",@count_week/60.to_f)
    @count_daily_avg = @posts.after(Date.today-7).average(:study_time).round
    @count_daily_avg_hour = sprintf("%.1f",@count_daily_avg/60.to_f)
  end
end
