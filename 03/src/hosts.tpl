%{if length(web) > 0}
[webservers]
%{ for i in web }
${i.name} ansible_host=${i.network_interface.0.nat_ip_address} fqdn=${i.name}
%{ endfor }
%{ endif }

%{if length(database) > 0}
[databases]
%{ for i in database }
${i.value.name} ansible_host=${i.value.network_interface.0.nat_ip_address} fqdn=${i.value.name}
%{ endfor }
%{ endif }

%{if length(storage) > 0}
[storage]
%{ for i in storage }
${i.name} ansible_host=${i.network_interface.0.nat_ip_address} fqdn=${i.name}
%{ endfor }
%{ endif }
