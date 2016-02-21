server_pid = File.exist?('tmp/pids/server.pid')
if server_pid
  pid = File.read('tmp/pids/server.pid')
end
unless pid.nil?
  begin
    Process.kill("HUP", pid.to_i)
  rescue => e
    p e
  end
end
