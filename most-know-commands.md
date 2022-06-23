## Gists <--> Must know Linux Commands
    - These here are 20 Linux commands every operations eingineer should know
##

## curl
    - This command transfers a URL (unique path to every web file)
    - Use this command to test an application's endpoint or 
    connectivity to an upstream service endpoint
    - curl can be useful for determining if your 
    application can reach another service, such as 
    a database, or checking if your service is 
    healthy

    ** In a nutshell, we use curl to download webpages or files from a server

    To install curl on ubuntu, do the following
        sudo apt update && sudo apt install curl -y
    For more information about curl
    # https://www.keycdn.com/support/popular-curl-examples
##


## python -m json.tool / jq: 
    - After you issue curl, the output of the 
    API call may be difficult to read. Sometimes, 
    you want to pretty-print the JSON output to find 
    a specific entry. 
    - Python has a built-in JSON 
    library that can help with this. You use python 
    -m json.tool to indent and organize the JSON. To 
    use Python's JSON module, pipe the output of a 
    JSON file into the python -m json.tool command.

    To use the Python library, pipe the output 
    to Python with the -m (module) option.

    # To isntall python on your ubuntu computer
    # use our bash script, read the instructions carefully
    # https://github.com/it-Titops/ops-admin/blob/main/python3-installer.sh
## 

## ls:
    - ls lists files in a directory. 
    - Sysadmins and 
    developers issue this command quite often. In the 
    container space, this command can help determine 
    your container image's directory and files.
    - # ls-l: this will list files in the directory you 
    working on in a manner you see if it has executable 
    rights or not.
    e.g  ls -l myapp
    -rw-r--r--. 1 root root 33 Jul 21 18:36 myapp
##

## tail:
     - displays the last part of a file. 
     - You usually don't need every log line to troubleshoot. Instead, you  want to check what your logs say about the most recent  request to your application. 
     
     For example, you can use tail to check what happens in the logs when you make a request to your Apache HTTP server
     - you can also use tail to see the last 100 lines of the file with the -n option
## 

## cat:
    - the cat command prints the content of a file.
    - You might issue cat to check the contents of your 
    dependencies file or to confirm the version of the 
    application that you have already built locally.
    example: 
    
    - cat most-know-commands.md
##

## grep:
    - grep searches file patterns. 
    - If you are looking for a specific pattern in the output of another command, 
    grep highlights the relevant lines. 
    - Use this command for searching log files, specific processes, and more
    - If you want to see if Apache Tomcat starts up, you might 
    become overwhelmed by the number of lines. 
    - By piping that output to the grep command, you isolate the lines 
    that indicate server startup.
##

## ps:
    - the ps command shows the status of a running 
    process.
    - Use this command to determine a running 
    application or confirm an expected process. 
    
    - For example, if you want to check for a running Tomcat web server, 
    you use ps with its options to obtain the process ID of 
    Tomcat.

## env:
    - env allows you to set or print the environment 
    variables. During troubleshooting, you may find it 
    useful for checking if the wrong environment variable 
    prevents your application from starting. 
## 

## top:
     top displays and updates sorted process 
information. Use this monitoring tool to determine which 
processes are running and how much memory and CPU they 
consume.
##

## netstart:
    - netstat shows the network status. 
    - This command 
    shows network ports in use and their incoming 
    connections. However, netstat does not come 
    out-of-the-box on Linux. If you need to install it, you 
    can find it in the net-tools package. As a developer who 
    experiments locally or pushes an application to a host, 
    you may receive an error that a port is already 
    allocated or an address is already in use. Using netstat 
    with protocol, process and port options demonstrates 
    that Apache HTTP server already uses port 80 on the 
    below host.  
##

11. ip:
    If ip address does not work on your host, it must be 
installed with the iproute2 package. The subcommand 
address (or just ip a for short) shows the interfaces 
and IP addresses of your application's host. You use ip 
address to verify your container or host's IP address. 
For example, when your container is attached to two 
networks, ip address can show which interface connects 
to which network. For a simple check, you can always use 
the ip address command to get the IP address of the 
host. The example below shows that the web tier 
container has an IP address of 172.17.0.2 on interface 
eth0.

12. lsof:
     lsof lists the open files associated with your 
application. On some Linux machine images, you need to 
install lsof with the lsof package. In Linux, almost any 
interaction with the system is treated like a file. As a 
result, if your application writes to a file or opens a 
network connection, lsof will reflect that interaction 
as a file. Similar to netstat, you can use lsof to check 
for listening ports.

 13. df:(df -h) 
     You can use df (display free disk space) to 
troubleshoot disk space issues. When you run your 
application on a container orchestrator, you might 
receive an error message signaling a lack of free space 
on the container host. While disk space should be 
managed and optimized by a sysadmin, you can use df to 
figure out the existing space in a directory and confirm 
if you are indeed out of space.

   The -h option prints out the information in 
human-readable format. By default, as in the example, df 
provides results for everything under the root 
directory, but you can also limit results by providing a 
directory as part of your command (such as df -h /home). 


14. du: 
    To retrieve more detailed information about which files 
use the disk space in a directory, you can use the du 
command. If you wanted to find out which log takes up the 
most space in the /var/log directory, for example, you can 
use du with the -h (human-readable) option and the -s 
option for the total size.
 Example: 
     
     $ du -sh /var/log/*
1.8M  /var/log/anaconda
384K  /var/log/audit
4.0K  /var/log/boot.log
0 /var/log/chrony
4.0K  /var/log/cron
4.0K  /var/log/maillog
64K /var/log/messages

   The example above reveals the largest directory under 
/var/log to be /var/log/audit. You can use du in 
conjunction with df to determine what utilizes the disk 
space on your application's host.


 15. id:
    To check the user running the application, use the id 
command to return the user identity. The example below uses 
Vagrant to test the application and isolate its development 
environment. After you log into the Vagrant box, if you try 
to install Apache HTTP Server (a dependency) the system 
states that you cannot perform the command as root. To 
check your user and group, issue the id command and notice 
that you are running as the "vagrant" user in the "vagrant" 
group.
   e.g 
      $ dnf -y install httpd
Loaded plugins: fastestmirror
You need to be root to perform this command.
$ id
uid=1000(vagrant) gid=1000(vagrant) groups=1000(vagrant) 
context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023

 
 16. chmod:
        When you run your application binary for the first 
time on your host, you may receive the error message 
"permission denied." As seen in the example for ls, you can 
check the permissions of your application binary.

    $ ls -l
total 4
-rw-rw-r--. 1 vagrant vagrant 34 Jul 11 02:17 test.sh

This shows that you don't have execution rights (no "x") to 
run the binary. chmod can correct the permissions to enable 
your user to run the binary.

 e.g 
    $ ls -l
total 4
-rw-rw-r--. 1 vagrant vagrant 34 Jul 11 02:17 test.sh

17. dig/nslookup:
        A domain name server (DNS) helps resolve a URL to a 
set of application servers. However, you may find that a 
URL does not resolve, which causes a connectivity issue for 
your application. For example, say you attempt to access 
your database at the mydatabase URL from your application's 
host. Instead, you receive a "cannot resolve" error. To 
troubleshoot, you try using dig (DNS lookup utility) or 
nslookup (query Internet name servers) to figure out why 
the application can't seem to resolve the database.

18. firewall-cmd:
         Traditionally, firewalls were configured on Linux 
with the iptables command, and while it retains its 
ubiquity it has actually been largely replaced by nftables. 
A friendly front-end for nftables, and the one that ships 
with many distributions by default, is firewall-cmd. This 
command helps you set up rules governing what network 
traffic, both outgoing and incoming, your computer allows. 
These rules can be grouped into zones, so you can quickly 
and easily move from one set of rules to another, depending 
on your requirements.
        $ sudo firewall-cmd --get-active-zones``
corp
  interfaces: ens0
dmz
  interfaces: ens1

In this example, your computer has two network devices, and 
one is assigned to the corp zone, while the other is 
assigned to the dmz zone.

    To see what each zone permits, you can use the 
--list-all option:
   
   $ sudo firewall-cmd --zone corp --list-all
corp
  target: default
  interfaces: ens0
  services: cockpit dhcpv6-client ssh
  ports:
  protocols:
[...]
    
  Adding services is just as easy

     $ sudo firewall-cmd --add-service http --permanent
$ sudo firewall-cmd --reload

Interacting with firewall-cmd is designed to be intuitive, 
and it has an extensive collection of predifined services, 
plus the ability to write nft rules directly. Once you 
start using firewall-cmd, you can download our firewall-cmd 
cheat sheet to help you remember its most important 
options.

19. sestatus:
       You usually find SELinux (a Linux security module) 
enforced on an application host managed by an enterprise. 
SELinux provides least-privilege access to processes 
running on the host, preventing potentially malicious 
processes from accessing important files on the system. In 
some situations, an application needs to access a specific 
file but may throw an error. To check if SELinux blocks the 
application, use tail and grep to look for a "denied" 
message in the /var/log/audit logging. Otherwise, you can 
check to see if the box has SELinux enabled by using 
sestatus.

20. history:
      When you issue so many commands for testing and 
debugging, you may forget the useful ones! Every shell has 
a variant of the history command. It shows the history of 
commands you have issued since the start of the session. 
You can use history to log which commands you used to 
troubleshoot your application. For example, when you issue 
history over the course of this article, it shows the 
various commands you experimented with and learned.

   $ history
    1  clear
    2  df -h
    3  du