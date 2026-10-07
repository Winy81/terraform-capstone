require 'sinatra'

set :bind, '0.0.0.0'
set :port, 80

get '/' do
  hostname = `hostname`.strip

  <<~HTML
    <h1>Terraform Capstone</h1>

    <p>Served by #{hostname}</p>
  HTML
end

get '/health' do
  status 200

  'OK'
end
