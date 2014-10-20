require 'sinatra'
require 'json'
require_relative 'kenobi/notifier'

notifier = Kenobi::Notifier.setup(ENV)

post '/push' do
  payload = JSON.parse(params['payload'])

  notifier.check(payload)

  if payload['forced']
    "I fear something terrible has happened."
  end
end
