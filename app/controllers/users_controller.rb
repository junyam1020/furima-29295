class UsersController < ApplicationController
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, :email, :password, :last_name, :first_name, :last_name_reading, :first_name_reading, :birthday
    )
  end
end
