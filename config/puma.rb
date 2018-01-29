directory './'
threads 8, 32
workers %x(grep -c processor /proc/cpuinfo)
bind 'tcp://0.0.0.0:3000'
pidfile './run/puma.pid'
stdout_redirect './run/puma_stdout.log', './run/puma_stderr.log', false
daemonize false
