# frozen_string_literal: true

class LoginTask
  def initialize(login_page)
    @login_page = login_page
  end

  def perform_as(actor)
    @login_page.load
  end

  def perform(username, password)
    @login_page.input_username.set(username)
    @login_page.input_password.set(password)
    @login_page.button_login.click
  end
end