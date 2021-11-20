class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @submissions = @user.submissions
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'Delete Complete'
      redirect_to homes_top_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :icon_image, :email, :password, :introduction)
  end
end
