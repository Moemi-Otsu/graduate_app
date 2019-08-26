class UsersController < ApplicationController
  def index
    if current_user.role == 'admin'
      @users = User.all
    else
      redirect_to root_path, notice: "管理者ユーザー以外アクセスできません。"
    end
  end
end
