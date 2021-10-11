class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def confirm
    @user = current_user
  end

  #退会処理（物理削除
  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
