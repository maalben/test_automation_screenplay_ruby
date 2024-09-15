# frozen_string_literal: true

class Actor
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def can_perform(task)
    task.perform_as(self)
  end

  def self.named(name)
    new(name)
  end
end