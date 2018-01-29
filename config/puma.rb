directory '/var/app/current'
bind 'unix:///var/run/puma/my_app.sock'

app do |env|
  body = 'Hello, World!'

  [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
end
