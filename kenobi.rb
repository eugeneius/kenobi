require 'sinatra'
require 'json'

post '/push' do
  payload = JSON.parse(params['payload'])

  if payload['forced']
    "I fear something terrible has happened."
  end
end
