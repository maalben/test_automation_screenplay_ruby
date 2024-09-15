# frozen_string_literal: true

class WaitUntilVisible
  def initialize(element)
    @element = element
  end

  def perform
    @element.wait_until_visible
  end
end