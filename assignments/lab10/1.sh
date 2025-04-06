# # (1) Write a shell script that: [15]
# # a. Lists all active processes running on the system.
# # b. Filters for processes containing a specific keyword in their names (keyword is passed as an argument
# # to the script).
# # c. Saves the filtered process list to a file named filtered_processes.txt.
# echo "Started file reading"
# ps -e
# # echo "*************************************************"
# ps -e |grep $1
# ps -e |grep $1 > filtered_processes.txt



