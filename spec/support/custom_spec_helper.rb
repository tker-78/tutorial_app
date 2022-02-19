require 'sessions_helper'
module CustomHelper
  include SessionsHelper
  def is_logged_in?
    !current_user.nil?
  end

end