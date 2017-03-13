class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    if session['staff'].nil?
      redirect_to login_path, notice: 'Unauthorized attempt, must login'
    end
  end

  def not_admin
    if session['staff'] != 1 || session['staff'].nil?
      redirect_to orders_path, notice: 'Unauthorized attempt'
    end
  end

end
