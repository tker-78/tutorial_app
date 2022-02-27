module CustomFeatureHelper
  def log_in_as(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  def is_logged_in?
    !page.get_rack_session_key('user_id').nil?
  end
end