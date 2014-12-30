require 'sinatra/base'
require 'sinatra/pretty-flash'

class ExampleApp < Sinatra::Base
  register Sinatra::PrettyFlash

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
    <%= erb pretty_flash_html %>
    <%= yield %>
  </body>
  <%= pretty_flash_js %>
</html>

@@ index
<div>
  <p>Hello world</p>
  <a href='/'>refresh</a>
</div>
