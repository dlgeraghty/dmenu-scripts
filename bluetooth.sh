#very simple bluetooth helper with dmenu!(I just realized that for the moment it doesnt use dmenu at all xD)

# I dont like to have my bluetooth enabled at startup so I start it:
# the sudo here should have the -A option which trigress the SUDO_ASKPASS and asks for the password in dmenu but i am having security issues right now so I cant do that.

sudo systemctl start bluetooth.service;


# I just need to power it on, because the devices I want to connect are already paired and trusted:
# In the future, more functionality will be added.

echo "power on" | bluetoothctl

