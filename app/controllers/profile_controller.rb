class ProfileController < ApplicationController
  def update
    user_exist
    @user = current_user
  end

  def edit
    user_exist
    @user = current_user
    if params[:user][:password] == params[:user][:password_confirmation] && current_user.update(user_params)
      flash[:notice] = "Profile updated"
      sign_in(current_user, bypass: true)
      redirect_to profile_update_path
    else
      flash[:alert] = "Check the correctness of the entered data"
      render :update
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def user_exist
    if current_user.nil?
      flash[:alert] = "You need to be logged in to edit your profile"
      redirect_to root_path
    end
  end

end
