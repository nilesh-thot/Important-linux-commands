# # 1. Given the files: test1x.dat, test2y.log, test3z.txt, sample4a.doc, trial5b.log,
# # data6c.cfg
# # a. Write the command to list files where the last character before the extension is in the range x-z
# # and the name starts with test.
# # b. Extend the previous command to include only files that have exactly six characters in their name,
# # excluding the extension.
# # c. Modify the command further to list only files with a .log extension that match the conditions from
# # the previous steps.

# # Q-a)
# ls *[x-z].*
# # Q-b)
# ls test*[x-z].*
# # Q-c)
# ls test?[x-z].*
# # Q-d)
# ls test?[x-z].log

# # 2. Given the files: file_1.txt, file_2.csv, file_a.log, test_3.log, test4.csv, test5.txt
# # a. Write the command to list all files that start with file_ and end with .txt.
# # b. Write the command to list all files that either start with file_ and have .txt, .csv, or .log
# # extensions, or start with test and end with .txt.
# # c. Write the command to list all files that contain exactly one character between file and .log
# # Q-a)
# ls file_*.txt
# # Q-b)
# ls file_*.{txt,csv,log} test*.txt
# # Q-c)
# ls file?.log

# 3.
# a. Display the message "Hello, Linux!" and redirect the output to a file called output.txt.
# b. Verify the content of the file output.txt.
# c. List the files in the current directory and redirect the output to dir_list.txt, then display the
# content of dir_list.txt.
# Q-a)
echo "Hello, Linux!" | tee output.
# Q-b)
cat output.txt
# Q-c)
ls | tee dir_list.txt;cat dir_list.txt


# 4.
# a. Write the command to redirect the standard output of the ls command (listing files in the current
# directory) to a file named output1.txt.
# b. Write the command to append the output of the ls -l command to the existing file named
# output1.txt.
# c. Write the command to redirect the standard output of the echo command (printing "Hello
# World") to a file named greeting.txt.

ls | tee output.txt
ls -l | tee output.txt
echo "Hello Everyone!">greeting.txt

# 5.
# a. Write the command to list all the files in the /usr/bin directory and count the number of files
# without creating intermediate files.
# b. Write the command to list all the files in the /usr/bin directory and count the number of files,
# redirecting the output to a file named file_count.txt.
# c. Write the command to display the number of files in the /usr/bin directory and save it to the
# file file_count.txt while also displaying the result on the terminal. (Hint: Use tee command)
ls -l /usr/bin | wc -l
ls -l /usr/bin | wc -l > file_count.txt
ls -l /usr/bin | wc -l | tee file_count.txt

# 6.
# a. Write the command to display the list of users currently logged in and save the output into a file
# named logged_in_users.txt using the tee command.
# b. Write the command to display the list of users currently logged in and save the output into a file
# named logged_in_users.txt, then count and display the number of logged-in users.
# c. Write the command to display the list of users currently logged in and save the output into a file
# named logged_in_users.txt, while also redirecting the output to the terminal.

who | tee logged_in_users.txt
who | tee logged_in_users.txt | wc -l 
who | tee logged_in_users.txt

# 7.
# a. Write the command to list all files in the /etc directory and display the output on the terminal
# while also saving it in the file etc_files.txt using the tee command.
# b. Write the command to list all files in the /etc directory, filter files containing conf in their name,
# and display the filtered result on the terminal while saving it to etc_files_filtered.txt.
# c. Write the command to list all files in the /etc directory, filter files containing conf in their name,
# then count the number of matching files and save the count to a file named
# filtered_count.txt while also displaying the count on the terminal.

ls /etc | tee etc_files.txt
ls /etc | grep conf | tee etc_files_filtered.txt
ls /etc | grep conf | wc -l | tee filtered_count.txt


# 8.
# a. Write the command to list all files in the /home directory that have a .txt extension and display
# the output on the terminal while also saving it in the file home_txt_files.txt using the tee
# command.
# b. Write the command to list all files in the /home directory that have a .txt extension, filter files
# containing backup in their name, and display the filtered result on the terminal while saving it to
# home_backup_txt_files.txt.
# c. Write the command to list all files in the /home directory that have a .txt extension, filter files
# containing backup in their name, then count the number of matching files and save the count to a
# file named backup_txt_count.txt while also displaying the count on the terminal.

ls /home/*.txt | tee home_txt_files.txt
ls /home/*.txt | grep backup | tee home_backup_txt_files.txt
ls /home/*.txt | grep backup | wc -l | tee backup_txt_count.txt

# 9.
# a. Write the command to list all files in the /var/log directory and redirect the output to a file
# named var_log_list.txt. At the same time, use the tee command to display the list on the
# terminal.
# b. Write the command to list all files in the /var/log directory, filter files that contain error in their
# name, then sort the filtered result. Redirect the sorted output to a file named
# error_log_sorted.txt and use the tee command to display the result on the terminal.

ls /var/log | tee var_log_list.txt
ls /var/log | grep error |sort | tee error_log_sorted.txt

10. Given the following files in the directory: file_a.txt, file_b.csv, file_c.txt, data_a.csv,
data_b.txt, report_a.log, test3_a.csv, test4_a.txt, summary1_a.log, data3_a.log,
report2_a.log
a. Write a command that lists all .txt files, changes the current directory to /tmp/, and lists all
.csv files. Ensure the output is redirected to file_output_1.txt. The directory change should
not affect the parent shell.
b. Write a command that lists all .log files, changes the current directory to /tmp/, and lists all
.csv files. Ensure the output is redirected to file_output1.txt. The directory change should
affect the parent shell.
c. Write a command that lists all files starting with file_, changes the directory to /tmp/, and lists
all .txt files. The output should be redirected to file_output1.txt, and make sure that the
current directory in the parent shell remains unchanged.

(ls *.txt ; cd /tmp; ls *.csv) > file_output_1.txt
{ls *.log ; cd /tmp; ls *.csv} > file_output_1.txt
(ls file_  ; cd /tmp; ls *.txt) > file_output_1.txt


