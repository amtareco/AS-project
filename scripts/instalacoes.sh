yum install net-tools -y

yum install dhcp -y

echo "subnet 192.168.0.0 netmask 255.255.255.0 {
        #Gama de endereços atribuídos dinânicamente pelo servidor de DHCP
        range 192.168.0.100 192.168.0.200;
        #Tempo em segundos que um IP fica atribuído a um dado cliente
        default-lease-time 86400;
        max-lease-time 86400;
        #Indicar a Gateway a ser utilizada pelos clientes
        option routers 192.168.0.254;
        #Indica o endereço de broadcast e a mascara da sub-rede a ser utilizada pelos clientes
        option broadcast-address 192.168.0.255;
        option subnet-mask 255.255.255.0;
        #Indica a lista de DNS a serem utilizados pelos clientes;
        option domain-name-servers 192.168.0.10,192.168.0.11;
        #Indica, aos clientes, qual o sufixo DNS a ser utilizado
        #option domain-name "estig.pt";
}Ddns-update-style none;
" >> /etc/dhcp/dhcpd.conf

#desligar firewalls
systemctl stop firewalld
systemctl disable firewalld

systemctl enable dhcpd
systemctl start dhcpd

yum install bind* -y
systemctl enable named
systemctl start named

yum install httpd -y
systemctl enable httpd
systemctl start httpd

yum install nfs-utils -y
systemctl enable nfs
systemctl start nfs

yum install mdadm -y