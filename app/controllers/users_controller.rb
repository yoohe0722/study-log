class UsersController < ApplicationController
  before_action :set_user

  def show
    @nickname = @user.nickname
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @count_all = @posts.sum(:study_time)
    @count_all_hour = hour(@count_all)
    @count_month = @posts.by_month(field: :date).sum(:study_time)
    @count_month_hour = hour(@count_month)
    @count_week = @posts.by_week(field: :date, startday: :monday).sum(:study_time)
    @count_week_hour = hour(@count_week)
    if @count_all > 0
      @count_daily_avg = @posts.after(Date.today-7).average(:study_time)
      @count_daily_avg_hour = hour(@count_daily_avg)
    end
  end

  def likes
    @likes = @user.likes.page(params[:page]).per(5).order("created_at DESC")
  end

  def comments
    @comments = @user.comments.page(params[:page]).per(5).order("created_at DESC")
  endp

  def hour(time)
    sprintf("%.1f", time / 60.to_f)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
