## Problem Statement: 
### Need to schedule yum update command to run weekly on linux 

#### Method 01:

a. open ssh console  
b. run crontab -l ( List the crontab)  
c. run crontab -e (Edit the crontab)  
d. add below line   
>1 0 * * */6 yum update   #This will run Weekly at 01 AM  

e. escape   
f. wq and enter   


#### Method 02:  

a. Create Directory and open file in editor  
>sudo mkdir -p /opt/scripts/yum/ && sudo vim /opt/scripts/yum/yum_update.sh   
 
b. paste below line and save with wq!  
```
#!/bin/bash  
echo "###### Starting Yum Update at `date` ######"  >> /var/log/yum_update_log.txt  
yum update >> /var/log/yum_update_log.txt  
echo "###### Ending Yum Update at `date` ######"  >> /var/log/yum_update_log.txt  
```
c. execute crontab -l ( List the crontab)  
d. add cron using crontab -e   
d. add below line   
>1 0 * * */6 sh -x /opt/scripts/yum/yum_update.sh   #This will run Weekly at 01 AM  

You may need to update the permissions also.  
you can use chmod 755 your_username:your_groupname /opt/scripts/yum/yum_update.sh  
