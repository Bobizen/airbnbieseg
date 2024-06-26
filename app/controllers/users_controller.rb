class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render :profile, status: :unprocessable_entity
    end
  end

  def profile
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:legal_name, :avatar, :address, :description, :emergency_contact_number, :phone_number, :government_id)
  end
end
