# frozen_string_literal: true
require 'rack'

module DelayedRedirect
  class Middleware
    @redirect_status = nil
    @redirect_location = nil

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      unless redirect_location.nil?
        status = redirect_status
        headers['Location'] = redirect_location
        clear_redirect
      end

      [status, headers, response]
    end

    class << self
      attr_accessor :redirect_location, :redirect_status

      def delayed_redirect_to(location, options)
        return unless @redirect_location.nil?
        @redirect_location = location
        @redirect_status = options[:status] || '302'
      end
    end

    private

    def redirect_status
      self.class.redirect_status
    end

    def redirect_location
      self.class.redirect_location
    end

    def clear_redirect
      self.class.redirect_status = nil
      self.class.redirect_location = nil
    end
  end
end
