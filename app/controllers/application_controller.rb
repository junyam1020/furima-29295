class ApplicationController < ActionController::Base
  # 未ログインの場合ログイン画面に遷移
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # deviseのUserモデルに関わるリクエストからパラメーターを取得して保存する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_reading])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_reading])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end
end
