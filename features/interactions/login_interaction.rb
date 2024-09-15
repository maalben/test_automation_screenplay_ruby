# frozen_string_literal: true

class LoginInteraction
  def initialize(page)
    @page = page
  end

  def enter_credentials(username, password)
    @page.input_username.set(username)
    @page.input_password.set(password)
  end

  def click_login
    @page.button_login.click
  end
end