ENV['BUNDLE_GEMFILE'] = File.expand_path('../../../../Gemfile', __FILE__)

require 'rubygems'
require 'bundler'

Bundler.setup

require "rails/all"

Bundler.require

module Dummy
  class Application < ::Rails::Application
    config.cache_classes = true
    config.active_support.deprecation = :stderr
    config.eager_load = false
    config.action_controller.allow_forgery_protection = false

    # Raise exceptions instead of rendering exception templates
    config.action_dispatch.show_exceptions = false
    # because this belongs here for some reason...??? also in spec_helper
    # thanks rails 5 :/
    config.active_support.test_order = :random

    config.secret_key_base = 
      'http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/5/25/8/anigif_enhanced-buzz-11857-1369483324-0.gif'

    sqlite3 = config.active_record.sqlite3
    sqlite3.represent_boolean_as_integer = true if sqlite3
  end
end

Dummy::Application.initialize!
