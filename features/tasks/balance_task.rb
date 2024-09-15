# frozen_string_literal: true

class BalanceTask
  def initialize(page)
    @page = page
  end

  def perform
    @page.wait_until_loaded
  end
end