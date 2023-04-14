require 'sinatra/base'
require_relative '../lib/sinatra/pretty-flash'

class ExampleApp < Sinatra::Base
  register Sinatra::PrettyFlash

  enable :sessions
  enable :inline_templates

  get '/' do
    flash[:notice] = "Flash Notice!"
    erb :index
  end

end

ExampleApp.run!

__END__

@@ layout
<html>
  <head>
    <%= pretty_flash_css %>
  </head>
  <body>
    <% if flash[:notice] %>
      <p class="flash notice"><%= flash[:notice] %></p>
    <% end %>

    <% if flash[:error] %>
      <p class="flash error"><%= flash[:error] %></p>
    <% end %>

    <%= yield %>
  </body>
  <%= pretty_flash_js %>
</html>

@@ index
<div>
  <p>Hello world</p>
  <a href='/'>refresh</a>
</div>
