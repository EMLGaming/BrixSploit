# **BrixSploit**
By EMLGaming and M00SE

**DESCRIPTION**
===

This is a script that utilizes an exploit in the Brickcom cameras that reveal the admin username and password.
We automated it to harvest IPs from shodan and get all the usernames and passwords automaticly. We have a GUI for the skids and a commandline tool for linux lovers.

![gui](https://raw.githubusercontent.com/EMLGaming/BrixSploit/master/gui.png)


**INSTALLATION**
===
Clone the source code:
```
git clone https://github.com/EMLGaming/Brixsploit
```

Change directory into Brixsploit:
```
cd Brixsploit
```

Run installscript.sh
```
sudo chmod +x installscript.sh & ./installscript.sh
```

Run the tools (GUI)
```
./BrickscamHarvesterGUI.sh
./BrixSploitGUI.sh
```

Run the tools (commandline)
```
./BrickscamHarvester.sh
./BrixSploit.sh
```

Have fun!

**ARGUMENTS:**
===
For the commandline tools:
```
-h for help
-o for output to file (example: ./BrixSploit.sh -o test.txt)
-r for read ip adresses from list (example: ./BrixSploit.sh -r iplist.txt -o output.txt)
```
In some cases the username and password are blank that means that the camera is not able to connect to your computer or not vulnerable.

**FIX**
===
The easiest way to get around this particular exploit is to change **ALL** the default credentials including the viewer.

**DISCLAIMER**
===

Thanks to [Emiliano Ipar](https://twitter.com/maninoipar) for finding and exposing this vulnerability! https://www.exploit-db.com/exploits/42588/

**WE DO NOT TAKE RESPONSIBILITY FOR WHAT TO DO WITH THE SCRIPT AND DO NOT CONDONE ANY ILLEGAL PRACTISES WITH IT. ONLY USE ON CAMERAS THAT YOU OWN OR HAVE PERMISSION TO TEST IT ON. FOR EDUCATIONAL PURPOSES ONLY.**
