# frozen_string_literal: true

require 'json'

app = proc do |env|
  body = JSON.dump(env)
  header = {
    'Content-Type' => 'application/json',
    'Content-Length' => body.length.to_s,
  }
  [200, header, [body]]
end

run app
