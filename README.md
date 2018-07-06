# Brixsploit
by EMLGaming and M00SE

This is a script that utilizes an exploit in the Brickcom cameras that reveal the admin username and password.
We automated it to harvest IPs from shodan and get all the usernames and passwords automaticly.

Clone the source code:
`git clone https://github.com/EMLGaming/Brixsploit`

Change directory into Brixsploit:
`cd Brixsploit`

Give permissions to execute the bash files:
`sudo chmod +x *.sh`

Run BrixSploit.sh
`./BrixSploit.sh`

Arguments:
-h for help
-o for output to file (example: ./BrixSploit.sh -o test.txt)
-r for read ip adresses from list (example: ./BrixSploit.sh -r iplist.txt -o output.txt)


If you want to harvest a file with ip cameras from shodan we added a script for that aswell.
All you need to do is install the Shodan commandline tool. Then run BrickscamHarvester.sh.

Install shodan commandline tool:

Install python-setuptools: (on debain (kali) and ubuntu type this)
`sudo apt-get install python-setuptools`

Install shodan:
`sudo easy_install shodan`

Run BrickscamHarvester.sh:
`./BrickscamHarvester.sh`

Have fun!

The easiest way to get around this particular exploit is to change **all** the default credentials including the viewer.

Thanks to Emiliano Ipar [twitter](https://twitter.com/maninoipar) for finding and exposing this vulnerability! https://www.exploit-db.com/exploits/42588/

We do not take responsibility for what to do with the script and do not condone any illegal practises with it. Only use on cameras that you own or have permission to test it on. For educational purposes only.