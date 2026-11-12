class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    return if logged_in?

    redirect_to login_path, alert: "Zaloguj się, aby kontynuować."
  end

  def require_guest
    redirect_to root_path, alert: "Ta strona jest dostępna po wylogowaniu." if logged_in?
  end
end
