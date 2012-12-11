require 'sinatra'
require 'slim'
require 'sass'

SASS_DIR = File.expand_path("../stylesheets", __FILE__)

get '/' do
  slim :index
end

get "/stylesheets/:stylesheet.css" do |stylesheet|
  content_type "text/css"
  template = File.read(File.join(SASS_DIR, "#{stylesheet}.sass"))
  Sass::Engine.new(template).render
end
