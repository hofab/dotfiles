# nginx proxy manager

The initial tutorial that i followed can be found here:
[Wolfgang - easy ssl for homelabs](https://notthebe.ee/blog/easy-ssl-in-homelab-dns01/)

## Rebind protection
Some comment's of the video said to turn of `Rebind Protection` or add your sub/domain to your router

## pi-hole
Add subdomain to the whitelist for pi-hole.
Add subdomain to ip in Local DNS on pi-hole.

### NOTE
I can't say which of the setting worked, Let's encrypt stated working once I setup the whitelist.
But I had `Rebind protection` turned off as well - since then I turned it back on and the reverse proxy still seems to work.

