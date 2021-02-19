# iUFCExport-iPad
Display and interact with DCS (https://www.digitalcombatsimulator.com/) panels on your iPad

# Configuration
Normally, no configuration is needed. **Do these changes ONLY if iUFCExport is not working for you out of the box.**

However, your local router may be too strict with local network broadcasts and you'll notice that your button pushes on the iPad will not reflect in DCS.

You may also need to change the default ports, because they're already in use by some other service.

That's why there's a "Config" button in the top right of the home screen, where you select your plane.

## Configuring another iUFCExport outbound IP address

*Note that depending on your iPad iOS version, some alternative IP addresses may work and other not. The last one should work in all cases.* 

Click on this "Config" button.
An alert will display with the  generic local network broadcast IP: `255.255.255.255` in the first text field.

### Alternate config #1
Try changing it to the following other IP addresses: `224.0.0.1` This is the generic local network multicast.

If it works for you, fine, you won't need to change it again.

If it still doesn't work, you will have to find your local network subnet. To do so:
1) Open a Windows terminal: use `WINDOWS-R` key combination and enter `cmd.exe`
2) In your terminal, type `ipconfig`. Something like this will show up
![TERMINAL](./doc-resources/ipaddress.png)
In most cases, your subnet mask will be `255.255.255.0`, like in my example. If it's the case, try [alternate config #2](#alternate-config-2), else, unless you know what you're doing, I suggest you to directly go to [alternate config #3](#alternate-config-3).

### Alternate config #2
Your local broadbast IP address will be made of the 1st three numbers of your IPv4 Address to which you add the 4th number `255`. In my example, it would be: `192.168.86.255`.

If it works for you, fine, you won't need to change it again.

### Alternate config #3
Use your PC IPv4 Address. In my example, it would be: `192.168.86.36`

It should work now, but this is the last resort, because you will have to change this setting everytime your PC gets assigned a new IP address.

## Configuring other ports

Click on this "Config" button.
An alert will display with the default base port used by iUFCExport: `7676` in the second text field.

Pick any other base port, as long as it's between 1024 and 65534, and not used by another service on your PC.
Make sure you change the default base port in the lua script to the same value, as explained in this readme (https://github.com/wluc9875/iUFCExport-LuaScript/blob/main/README.md)



