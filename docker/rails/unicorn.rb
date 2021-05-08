worker_processes 8

pid "/var/run/unicorn.pid"
listen "/var/tmp/unicorn.sock"

# stdout_path "./log/unicorn.stdout.log"
# stderr_path "./log/unicorn.stderr.log"
stdout_path = $stdout
stderr_path = $stderr

timeout 999999999999