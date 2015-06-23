Gem::Specification.new do |s|
  s.name = 'sinatra-pretty-flash'
  s.version = '0.0.2'

  s.summary     = "Simple decent looking flash messages"
  s.description = "A Sinatra extension that adds simple decent looking flash messages"

  s.authors = ["Kevin Hughes"]
  s.email = "kevin.hughes@shopify.com"
  s.homepage = "https://github.com/pickle27/sinatra-pretty-flash/"
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")

  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'rack-flash3'
end
