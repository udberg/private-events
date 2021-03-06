module SessionsHelper
  def sign_in(user)
    cookies.permanent[:auth_token] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: cookies[:auth_token]) if cookies[:auth_token]
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_out_user
    cookies.delete(:auth_token) if user_signed_in?
  end
end
