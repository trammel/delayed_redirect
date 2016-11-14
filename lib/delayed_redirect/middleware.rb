# frozen_string_literal: true
require 'rack'

module DelayedRedirect
  class Middleware
    @@status = nil
    @@location = nil

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      unless @@location.nil?
        status = @@status
        headers['Location'] = @@location
      end

      @@status = nil
      @@location = nil

      [status, headers, response]
    end

    def self.delayed_redirect_to(location, options)
      return unless @@location.nil?
      @@location = location
      @@status = options[:status] || '302'
    end
  end
end
