#!/bin/bash
# 1. Write a shell script that:
# a. Display the available free space on all mounted file systems with human-readable sizes.
# b. Report inode usage for the root (/) file system.
# c. Save the command output for part (a) to a file named disk_free_report.txt.
# d. Print the contents of disk_free_report.txt to the terminal.

# df -h 
# df -ih / | head -n 2
# df -h > disk_free_report.txt
# cat disk_free_report.txt

# 2. Write a shell script that:
# a. Calculate the total disk usage of the /var/log directory.
# b. List the disk usage of all files in the /var/log directory in human-readable sizes.
# c. Identify and report the size of the largest file in the /var/log directory. (Hint: sort and head)

# du  /var/log
# du -ah /var/log
# du -a /var/log|sort -r -n|head  -n 1

# 3. Write a shell script that:
# a. Finds all files in the /home directory larger than 2 MB.
# b. Lists files in /home that have not been accessed in over a year.
# c. Locates all .log files in /var/log and counts how many such files exist.
# d. Finds all directories in /home/user and outputs their names.


# find /home -size +2M 
# find /home -atime +365
# find /var/log | grep  '\.log$' | wc -l
# find /home/user -type d


# 4. Write a shell script that:
# a. Find all files in the /var/apache directory larger than 5 MB using the find command and list
# their names.
# b. Calculate the total disk space occupied by these files.
# c. Output the result in a human-readable format.
# d. Save the list of these file names to a file named large_files_report.txt.
# sudo find /var/apche -size +5M 
# sudo find /var/apche -size +5M -exec du -ch {} + |tail -n 1
# sudo find /var/apche -size +5M -exec du -ch {} + |tail -n 1
# sudo find /var/apche -size +5M  > large_files_report.txt


# 5. Write a shell script that:
# a. Creates a directory named /mnt/test_mount to use as a mount point.
# b. Displays the current list of mounted file systems using the mount command.
# c. Unmounts the /mnt/test_mount directory (if it is already mounted).

# sudo mkdir -p /mnt/test_mount
# mount 
# id mountpoint -q /mnt/test_mount;then
#     sudo  umount /mnt/test_mount
# fi


# 6. Write a shell script that:
# a. Reads and displays the content of the /etc/fstab file.
# b. Creates a directory named /mnt/sample_mount.
# c. Mounts the /dev/loop0 device to /mnt/sample_mount.
# d. Displays the updated list of mounted file systems to verify the mount operation.

# cat /etc/fstab
# sudo mkdir -p /mnt/sample_mount
# sudo mount /dev/loop0 /mnt/sample_mount
# mount

# 7. Execute commands to:
# a. Install a package with root privileges (eg. git).
# b.Switch to the root user.
# c. Safely edit the sudoers file.
# d. Check the currently logged-in user.
# e. Display the groups a user belongs to
# sudo apt -get install git
# sudo -
# sudo visudo
# whoami
# groups

# 8. Perform the following user and group management tasks:
# a. Create a new user.
# b. Set or change the password for a user.
# c. Add a user to the sudo group.
# d. Change file permissions for a script.
# e. Change the owner and group of a file
# sudo useadd newuser
# sudo passwd newuser
# sudo usermod -aG sudo newuser
# chmod u+rwx script
# chown  newuser:newgroup file


# 10. Execute commands to:
# a. List all active services.
# b. Reboot the system using a command.
# c. Shut down the system immediately

# systemctl list-units --type=service
# sudo systemctl reboot
# sudo shutdown -h now
