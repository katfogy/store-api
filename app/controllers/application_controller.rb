class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?
    # throw forbidden message to users when trying to access different record
    rescue_from CanCan::AccessDenied do |exception|
        render json: {error: 'Access denied'}, status: :forbidden
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :role])
  end
end
