sudo apt update 

sudo apt upgrade 

sudo apt install hostapd 

sudo systemctl unmask hostapd 

sudo systemctl enable hostapd 

sudo apt install dnsmasq 

sudo DEBIAN_FRONTEND=noninteractive apt install -y netfilter-persistent iptables-persistent 

sudo nano /etc/dhcpcd.conf 

interface wlan0 

static ip_address=192.168.4.1/24 

nohook wpa_supplicant 

sudo nano /etc/sysctl.d/routed-ap.conf 

net.ipv4.ip_forward=1 



sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 

sudo netfilter-persistent save
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.old 

sudo nano /etc/dnsmasq.conf 

interface=wlan0 

dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h 

domain=wlan 



sudo rfkill unblock wlan 

sudo nano /etc/hostapd/hostapd.conf 



#Access​ point with password (WPA2): 

country_code=GB 

interface=wlan0 

ssid=YourNetworkName 

hw_mode=g 

channel=7 

macaddr_acl=0 

auth_algs=1 

ignore_broadcast_ssid=0 

wpa=2 

wpa_passphrase=YourPassword 

wpa_key_mgmt=WPA-PSK 

wpa_pairwise=TKIP 

rsn_pairwise=CCMP 



Check your country code: localectl status
 

If you want your access point to be open(no password):
interface=wlan0 

driver=nl80211 

ssid=Test. 

hw_mode=g 

channel=6 

sudo reboot 
