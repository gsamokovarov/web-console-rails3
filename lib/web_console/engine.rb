require 'ipaddr'
require 'active_support/core_ext/numeric/time'
require 'rails/engine'

# Those are required for Rails 3 compatibility.
require 'strong_parameters'
require 'active_model'
require 'active_model/model'

module WebConsole
  class Engine < ::Rails::Engine
    isolate_namespace WebConsole

    config.web_console = ActiveSupport::OrderedOptions.new.tap do |c|
      c.automount          = true
      c.command            = nil
      c.default_mount_path = '/console'
      c.timeout            = 0.seconds
      c.term               = 'xterm-color'
      c.whitelisted_ips    = '127.0.0.1'

      c.style = ActiveSupport::OrderedOptions.new.tap do |s|
        s.colors = 'light'
        s.font   = 'large DejaVu Sans Mono, Liberation Mono, monospace'
      end
    end

    initializer 'web_console.add_default_route' do |app|
      # While we don't need the route in the test environment, we define it
      # there as well, so we can easily test it.
      if config.web_console.automount && (Rails.env.development? || Rails.env.test?)
        app.routes.append do
          mount WebConsole::Engine => app.config.web_console.default_mount_path
        end
      end
    end

    initializer 'web_console.process_whitelisted_ips' do
      config.web_console.tap do |c|
        # Ensure that it is an array of IPAddr instances and it is defaulted to
        # 127.0.0.1 if not precent. Only unique entries are left in the end.
        c.whitelisted_ips = Array(c.whitelisted_ips).map do |ip|
          ip.is_a?(IPAddr) ? ip : IPAddr.new(ip.presence || '127.0.0.1')
        end.uniq

        # IPAddr instances can cover whole networks, so simplify the #include?
        # check for the most common case.
        def (c.whitelisted_ips).include?(ip)
          ip.is_a?(IPAddr) ? super : any? { |net| net.include?(ip.to_s) }
        end
      end
    end

    initializer 'web_console.process_command' do
      config.web_console.tap do |c|
        # +Rails.root+ is not available while we set the default values of the
        # other options. Default it during initialization.
        c.command = 'rails console' if c.command.blank?
      end
    end

    initializer 'web_console.process_colors' do
      config.web_console.style.tap do |c|
        case colors = c.colors
        when Symbol, String
          c.colors = Colors[colors] || Colors.default
        else
          c.colors = Colors.new(colors)
        end
      end
    end
  end
end
