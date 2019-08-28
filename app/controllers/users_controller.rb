class UsersController < ApplicationController

  def index
    if current_user.role == 'admin'
      @users = User.all.order(id: "asc")
    else
      redirect_to root_path, notice: "管理者ユーザー以外アクセスできません。"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.role == 'admin'
      if @user.update(user_params)
        redirect_to users_path, notice: "変更しました。"
      else
        redirect_to users_path, notice: "変更できませんでした。"
      end
    else
      redirect_to users_path, notice: "変更できませんでした。"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :encrypted_password, :role)
  end

end
