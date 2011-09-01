module RequestMacros
  def login_user(user)
    post user_session_path, :email => user.email, :password => "password"
  end
end
