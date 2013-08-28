module WebConsole
  class ApplicationController < ActionController::Base
    before_filter :prevent_unauthorized_requests!

    private

      def prevent_unauthorized_requests!
        unless request.remote_ip.in?(WebConsole.config.whitelisted_ips)
          render nothing: true, status: :unauthorized
        end
      end
  end
end
