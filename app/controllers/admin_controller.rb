class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :checkAuth
  
  def dashboard
    @homeworks = Homework.all.order(created_at: :desc)
  end

  def posts
  end

  def homeworks
  end
  
  def homework_status
    @users = User.all
  end

  def members
  end
  
  private
  
  def checkAuth
    @admin = "active"
    @title = "Supervisor"
    unless current_user.level == 2 then
      redirectBack
    end
  end
  
  def redirectBack
    flash[:error] = "잘못된 접근입니다."
    redirect_to :back
  end
  
end
