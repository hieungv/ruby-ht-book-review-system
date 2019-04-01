 class Users::RegistrationsController < Devise::RegistrationsController
before_action :sign_up_params, :account_update_params
  private

  def sign_up_params
  params.require(:user).permit( :email, :password,:password_confirmation,
  user_profile_attributes:[:name])
  end
  def account_update_params
    params.require(:user).permit(:email,:password, :password_confirmation, :current_password,
    user_profile_attributes: [:id, :name])
  end
end
