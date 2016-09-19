class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
    end
    redirect_to action: :show
  end

  def user_params
    params.permit(:email, :password, :username, :member, :profile, :work, :image)
  end
end
