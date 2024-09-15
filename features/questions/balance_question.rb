# frozen_string_literal: true

class BalanceQuestion
  def initialize(home_page)
    @home_page = home_page
  end

  def total_balance
    @home_page.total_balance.text.strip
  end

  def credit_available
    @home_page.credit_available.text.strip
  end
end