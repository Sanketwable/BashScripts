# BashScripts
*********************************************************************
### 1. Commit

  ***commit is script to git add + git commit + git push***
  
#### Installation steps: *(for mac)*
   ```bash
 $ cd
 
 $ git clone https://github.com/Sanketwable/BashScripts.git
 
 $ cd BashScript
 
 $ chmod +x commit.sh
 
 $ echo 'alias commit=source ~/BashScript/commit.sh' >>~/.bash_profile
 
 $ source ~/.bash_profile
   ```
#### Installation steps: *(for linux)*
   ```bash
 $ cd
 
 $ git clone https://github.com/Sanketwable/BashScripts.git
 
 $ cd BashScript
 
 $ cp commit.sh ~/
 
 $ cd ..
 
 $ chmod +x commit.sh
 
 $ mv commit.sh .commit.sh
 
 $ echo 'alias commit=~/.commit.sh' >>~/.bash_profile
 
 $ source ~/.bash_profile
 
 $ source ~/.bashrc
   ```
#### for help 
  ```bash
  $ commit -h
  or
  $ commit --h
  or
  $ commit -help
  ```
#### use
  ```bash
  Go to repo directory:
  $ commit
  Enter a commit message
  >> "Write commit message here"
  Enter password >> ******
  commit sucessfull :-)
  ```
  ![alt text](https://github.com/Sanketwable/BashScripts/blob/master/img/terminalimage1.png)
###### Default password = 'qwerty'
                        
                      
