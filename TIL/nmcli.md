# Use VPN connection only for internal addresses
For Network Manager, I got the following to work.
In Settings -> Network -> VPN click the gear icon beside the VPN connection and tick "Use this connection only for resources on its network' for both the IPv4 and IPv6 tabs.
Then from the command line enter the command nmcli con modify pfSense-<Fill in your connection name here> ipv4.dns-search <domain>.gdn,sat,<domain>.internal,pfsense.<domain>,<domain>.engineering,<domain>.lan
I think that the nmcli command is a one-time thing. It survives across up/down - I haven't tested if it survives across a reboot yet.
Once you've done that I verified that could access wiki.<domain>.lan and traceroute www.yahoo.com showed me that the packets were going out to my ISP and not through 10.x.x.x.
