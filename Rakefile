# frozen_string_literal: true

require_relative 'lib/close_customers_finder'
require 'rspec/core/rake_task'

task :run, :customer_list do |t, args|
  pp CloseCustomersFinder.find_close_customers(args[:customer_list])
end

RSpec::Core::RakeTask.new(:test)
