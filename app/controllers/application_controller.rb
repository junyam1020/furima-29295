class ApplicationController < ActionController::Base
  #未ログインの場合ログイン画面に遷移
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #nameカラムの保存を
  def configure_permitted_parameters #メソッド名は慣習
    #deviseのUserモデルに関わるリクエストからパラメーターを取得して保存する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
