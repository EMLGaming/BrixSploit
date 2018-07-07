BrixSploit
------------
By EMLGaming and M00SE


# Description
This is a script that utilizes an exploit in the Brickcom cameras that reveal the admin username and password. We automated it to harvest IPs from shodan and get all the usernames and passwords. We have a GUI for the skids and a commandline tool for linux lovers.

![Screenshot of GUI](https://raw.githubusercontent.com/EMLGaming/BrixSploit/master/gui.png)


# Installation
Clone the source code:
```
git clone https://github.com/EMLGaming/Brixsploit
```

Change directory into Brixsploit:
```
cd Brixsploit
```

Run install script (Ubuntu/Debian):
```
chmod +x installscript.sh && ./installscript.sh
```

Run the tools (GUI):
```
./BrickscamHarvesterGUI.sh
./BrixSploitGUI.sh
```

Run the tools (CLI):
```
./BrickscamHarvester.sh
./BrixSploit.sh
```

Have fun!


# Usage
## Parameters
```
-h, --help                   Prints a help page.
-o <file>, --output <file>   Saves results in a file. Disables interactive mode.
-r <file>, --read <file>     Reads ip addresses from a file.
```

## Example
```
./BrixSploit2.sh -r iplist.txt -o results.txt
```

In some cases the username and password are blank that means that the camera is not able to connect to your computer or not vulnerable.

# Preventing the exploit
The easiest way to get around this particular exploit is to change **ALL** the default credentials including the viewer.

# How it works
Brickom Cameras allow a low-privilege user to disclose every configuration
in the NVRAM, including credentials in clear text, remotely by making a
simple requests. This vulnerability, coupled with the fact that there are
two default users with known passwords which are rarely modified, allows an
attacker to disclose the admin password and latter every config.
Thanks to [Emiliano Ipar](https://twitter.com/maninoipar) for finding and exposing this vulnerability! https://www.exploit-db.com/exploits/42588/

# Disclaimer
**WE DO NOT TAKE RESPONSIBILITY FOR WHAT TO DO WITH THE SCRIPT AND DO NOT CONDONE ANY ILLEGAL PRACTISES WITH IT. ONLY USE ON CAMERAS THAT YOU OWN OR HAVE PERMISSION TO TEST IT ON. FOR EDUCATIONAL PURPOSES ONLY.**
