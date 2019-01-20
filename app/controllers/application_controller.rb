class ApplicationController < ActionController::Base

  helper_method :logged_in?

  def log_in(user)
    remember_token = User.digest(User.new_token)
    user.update_attribute(:remember_token, remember_token)
    cookies.permanent.signed[:remember_token] = remember_token
    current_user = user
  end

  def log_out
    current_user.update_attribute(:remember_token, nil)
    current_user = nil
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_user.nil?
  end

  # Handling the current user

  def current_user
    if cookies[:remember_token]
      @current_user ||= User.find_by(remember_token: cookies.signed[:remember_token])
    end
  end

  def current_user=(user)
    @current_user = user
  end
end
