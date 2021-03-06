class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_locale
  layout :layout_by_resource
  add_flash_types :success, :primary, :secondary, :danger, :warning, :info,
    :light, :dark

  include Pagy::Backend

  private

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options
    {locale: I18n.locale}
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def after_sign_out_path_for resource_or_scope
    root_path
  end
   
end
