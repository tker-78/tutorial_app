require 'sessions_helper'
module CustomHelper
  include SessionsHelper
  def is_logged_in?
    !current_user.nil?
  end

<<<<<<< HEAD
=======
  def log_in_as(user)
    # session[:user_id] = user.id
    post login_path, params: { session: { email: user.email, password: user.password, remember_me: "1"}}
  end

>>>>>>> advanced-login
end