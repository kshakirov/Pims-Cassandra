daemonize

#workers    1 # should be same number of your CPU core
threads    0, 16
port 4700
stdout_redirect 'puma.log', 'puma.err', true
 on_restart do
   puts ' Restarting Puma.'
 end
pidfile    "turbo.pid"