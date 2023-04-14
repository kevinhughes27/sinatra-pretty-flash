require 'sinatra/base'
require 'sinatra/flash'

module Sinatra
  module PrettyFlash
    def self.registered(app)
      app.register Sinatra::Flash
      app.helpers FlashHelper
    end
  end

  module FlashHelper
    def pretty_flash_css
      output = <<-HTML
        <style>
        .flash {
          position: fixed;
          padding: 0;
          margin: 0;
          bottom: 0;
          left: 0;
          width: 100%;
          height: 60px;
          line-height: 60px;
          background: rgba(0, 0, 0, 0.85);
          color: rgba(255, 255, 255, 1.0);
          text-align: center;
          font-size: 24px;
        }
        </style>
      HTML
      output
    end

    def pretty_flash_js
      output = <<-HTML
        <script>
          window.onload = function() {
            const flash = document.querySelector(".flash");
            if (flash) {
              flash.style.opacity = 0;
              setTimeout(function() {
                flash.style.transition = "opacity 1s";
                flash.style.opacity = 1;
              }, 500);
              setTimeout(function() {
                flash.style.opacity = 0;
              }, 2000);
            }
          };
        </script>
      HTML
      output
    end
  end

  register PrettyFlash
end
