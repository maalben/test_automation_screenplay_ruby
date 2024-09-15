# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url HOME_HOST

  def transaction_rows
    all('#transactionsTable tbody tr')
  end

  element :title_financial_overview, '.pt-4 > .element-header'
  element :total_balance, '#totalBalance'
  element :credit_available, '#creditAvailable .balance-value'
  elements :positive_values, '.positive-value'
  elements :negative_values, '.negative-value'

  def wait_until_loaded
    wait_until_total_balance_visible
    wait_until_credit_available_visible
  end

  def wait_until_transaction_rows_visible
    transaction_rows.wait_until_visible
  end

  def wait_until_total_balance_visible
    total_balance.wait_until_visible
  end

  def wait_until_credit_available_visible
    credit_available.wait_until_visible
  end
end