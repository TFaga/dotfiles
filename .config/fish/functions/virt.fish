function virt
  set --local host $LIBVIRT_HOST
  set --local args $argv[1..-1]

  ssh $host virsh --connect qemu:///system $args
end
