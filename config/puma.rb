directory './'
threads 4, 4
workers 2
bind 'tcp://0.0.0.0:3000'
activate_control_app 'tcp://127.0.0.1:9293', { auth_token: '12345' }
pidfile './run/puma.pid'
stdout_redirect './run/puma_stdout.log', './run/puma_stderr.log', false
daemonize true
