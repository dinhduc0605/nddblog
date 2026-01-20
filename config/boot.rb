# frozen_string_literal: true

# Fix for Ruby 2.7.8 + Rails 6.0.6.1 Logger issue
require 'logger'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
