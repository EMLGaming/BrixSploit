# **BrixSploit**
By EMLGaming and M00SE

**DESCRIPTION**
===

This is a script that utilizes an exploit in the Brickcom cameras that reveal the admin username and password.
We automated it to harvest IPs from shodan and get all the usernames and passwords automaticly.

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

If you want to harvest a file with ip cameras from shodan we added a script for that aswell.
All you need to do is install the Shodan commandline tool. Then run BrickscamHarvester.sh.

Install shodan commandline tool:

Install python-setuptools: (on debain (kali) and ubuntu type this)
```
sudo apt-get install python-setuptools
```

Install shodan:
```
sudo easy_install shodan
```

Run BrickscamHarvester.sh:
```
./BrickscamHarvester.sh
```

Have fun!

**ARGUMENTS:**
===
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
