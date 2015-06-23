require 'sinatra/base'
require 'rack-flash'

module Sinatra
  module PrettyFlash
    def self.registered(app)
      app.helpers FlashHelper
      app.enable :sessions
      app.use Rack::Flash, :sweep => true
    end
  end

  module FlashHelper
    def pretty_flash_css
      output = ''
      output += '<style>'
      output += '.flash {'
      output += '  position: fixed;'
      output += '  padding: 0;'
      output += '  margin: 0;'
      output += '  bottom: 0;'
      output += '  left: 0;'
      output += '  width: 100%;'
      output += '  height: 60px;'
      output += '  line-height: 60px;'
      output += '  background: rgba(0, 0, 0, 0.85);'
      output += '  color: rgba(255, 255, 255, 1.0);'
      output += '  text-align: center;'
      output += '  font-size: 24px;'
      output += '}'
      output += '</style>'
      output
    end

    def pretty_flash_html
      output = ''
      output += '<% if flash[:notice] %>'
      output += '  <p class="flash notice"><%= flash[:notice] %></p>'
      output += '<% end %>'

      output += '<% if flash[:error] %>'
      output += '  <p class="flash error"><%= flash[:error] %></p>'
      output += '<% end %>'
      output
    end

    def pretty_flash_js
      output = ''
      output += '<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>'
      output += '<script>'
      output += '$(function() {'
      output += '  $(".flash").delay(500).fadeIn("normal", function() {'
      output += '     $(this).delay(1500).fadeOut();'
      output += '   });'
      output += '});'
      output += '</script>'
      output
    end
  end

  register PrettyFlash
end
