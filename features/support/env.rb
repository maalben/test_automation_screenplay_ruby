# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require_relative '../../config/capybara'
require_relative '../tasks/login_task'
require_relative '../interactions/login_interaction'
require_relative '../support/actor'

Capybara.default_max_wait_time = 5
Capybara.default_driver = :selenium