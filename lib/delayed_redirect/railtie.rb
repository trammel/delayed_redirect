# frozen_string_literal: true
module DelayedRedirect
  class Railtie < ::Rails::Railtie
    initializer 'delayed_redirect.add_middleware' do |app|
      app.middleware.use Middleware

      ActiveSupport.on_load :action_controller do
        include EasyAccess
      end
    end
  end

  module EasyAccess
    def delayed_redirect_to(location, options)
      DelayedRedirect::Middleware.delayed_redirect_to location, options
    end
  end
end
