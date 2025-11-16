# zapret_easywrt
KickStarter for install zapret daemon to EasyWRT routers simply

1. Update firmware first
2. connect to router by ssh using you login and password
      ##### For example     
    ssh -oHostKeyAlgorithms=+ssh-rsa admin@192.168.1.1

3. Download the script using curl to /tmp directory
     ##### For example
    curl -L -O [link_to_file]
     
5. Take execute flag to downloaded file
     chmod +x [filename]
6. Start the script ./[filename]
7. follow the installer's questions and instructions
     All questions of "Y/N" except answer NFQWS method must be default.
8. At the end of the installation, a health check will be launched on the video segment from youtube.
9. Install is done 
