class SessionsController < ApplicationController
  before_action :require_guest, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email].to_s.strip.downcase)
    if user&.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to root_path, notice: "Zalogowano pomyślnie."
    else
      flash.now[:alert] = "Nieprawidłowy e-mail lub hasło."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Wylogowano."
  end
end
