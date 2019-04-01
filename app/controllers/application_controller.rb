class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def admin?
    redirect_back fallback_location: root_path unless
      current_user && current_user.admin?
  end

  def after_sign_in_path_for _resource
    if current_user.admin?
      admin_root_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, {user_profile_attributes: [:name]}])
  end
end
