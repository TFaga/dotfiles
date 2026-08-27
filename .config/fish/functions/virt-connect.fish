function virt-connect
  set --local host $argv[1]
  set --local port $argv[2]

  ssh -f -L $port:localhost:$port $host sleep 10

  open vnc://XYZ12345:XYZ12345@localhost:$port
end
