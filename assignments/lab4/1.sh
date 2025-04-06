# 1. Write a shell script that performs the following tasks: 
# a. Accept three strings from the user (str1, str2, str3).
# b. Perform the following operations using all the string operators:
# - Check if all three strings are non-empty using -n and display a message (e.g., All
# strings are not non-empty).
# - Check if str1 and str2 are equal using =. If they are equal, check if str3 is empty
# using -z. Display appropriate messages based on the conditions.
# - If str1 and str2 are not equal, use != to display their inequality and concatenate str2
# and str3.
# c. Display the length of the concatenated string using expr

# echo "Enter string 1";read str1
# echo "Enter string 2";read str2
# echo "Enter string 3";read str3

# if [ -n $str1 ] && [ -n $str2 ] && [ -n $str3 ];then 
#     echo "All strings are not empty"
# else
#     echo "All strings are not empty"

# if [ str1 = str2 ];then 
#     if [ -z str3 ];then 
#         echo "str1 and str2 are equal and str3 is empty"
#     else
#         echo "str1 and str2 are equal and str3 is not empty"
#     fi
# else
#     echo 'str1!=str2'
#     concat=$str2$str3
#     length=`expr length $concat`
#     echo "Length of the concatenated string is $length"
# fi


# 2. Write a shell script to print the following patterns based on user input: 
# a. Take the number of rows (n) as input.
# b. Print a right-angled triangle pattern of *.
# c. Print an inverted right-angled triangle pattern of *.
# Sample Input/Output:
# Enter the number of rows: 4
# Pattern 1:
# *
# **
# ***
# ****
# Pattern 2:
# ****
# ***
# **
# *

# echo -n "Enter the no of rows:";read n
# i=1
# echo "Pattern 1:"
# while [ $i -le $n ] ; do
#     j=$i
#     while [ $j -gt 0 ];do
#         echo -n "*"
#         j=$((j - 1))
#     done
#     echo 
#     i=$((i + 1))
# done
# echo "-----------------------------------------------------------------"
# echo "Pattern 2:"
# # echo -n "Enter the no of rows:";read n
# i=$n
# while [ $i -ge 1 ] ; do
#     j=$i
#     while [ $j -gt 0 ];do
#         echo -n "*"
#         j=$((j - 1))
#     done
#     echo 
#     i=$((i - 1))
# done

# Write a shell script that prompts the user to input the principal amount (P), rate of interest (R),
# time period (T), and mode (M). The script should then check if all values are positive; if so, it
# should calculate the simple interest using the following formulas, 25
# M=1: Simple Interest=(P×R×T)/100
# M=2: Simple Interest=(P×1.5xR×T)/100
# M=3: Simple Interest=(P×3xR×T)/100
# Finally, it should display the result. If any of the values are zero or negative, the script should
# display an error message saying "Invalid input. Please enter positive values." If
# user enters any other mode, it should print “Please enter valid mode”. You are required to
# determine if all inputs are valid and to either proceed with the calculation or display the error
# message based on the validity of the inputs. This process will continue until the user gives M=-1
# as input. Implement this using case.
# while true;do
#     echo -n "Enter the value of M:";read M
#     if [ $M -eq -1 ];then 
#         break
#     fi
#     echo -n "Enter the value of P:";read P
#     echo -n "Enter the value of R:";read R
#     echo -n "Enter the value of T:";read T
#     # echo -n "Enter the value of M:";read M

#     if [ $P -gt 0 ] && [ $T -gt 0 ] && [ $R -gt 0 ];then
#         case $M in
#             1)
#             interest=$((P*T*R/100))
#             echo "Interest is $interest"
#             ;;
#             2)
#             interest=$((P*T*R*3/200))
#             echo "Interest is $interest"
#             ;;
#             3)
#             interest=$((P*T*R*3/200))
#             echo "Interest is $interest";;
#             *)echo "Please enter the valid value for m"
#             ;;
#         esac
#     else 
#         echo "Please enter the valid P , T and R"
#     fi
#     echo
# done

# 4. Write a shell code to print the following pattern. It will take number of rows as input from user 25
# 1
# 2 3
# 4 5 6
# 7 8 9 10
# 11 12 13 14 15
# 16 17 18 19 20 21

# echo -n "Enter the no of rows:";read n
# i=1
# j=1
# while [ $j -le $n ];do
#         k=$j
#         while [ $k -gt 0 ];do
#             echo -n "$i "
#             i=$((i+1))
#             k=$((k-1))
#         done
#         echo 
#         j=$((j+1))
# done


# 5. Using shell programming check the permission of a file for current user; provide the
# permission which is not available. 

# echo -n "Enter the file name:";read file
# if [ -f $file ];then
#     echo "File is regular file.Performing checks"
#     if [ ! -r $file ];then
#         echo "Read permission doesn't exist giving it"
#         chmod u+r $file
#         sleep 2
#         echo "Read permission Given sucess fully"

#     else
#         echo "Read permission exists"
#     fi
#     if [ ! -w $file ];then
#         echo "Write permission doesn't exist giving it"
#         chmod u+w $file
#         sleep 2
#         echo "Write permission Given sucess fully"
#     else
#         echo "Write permission exists"
#     fi
#     if [ ! -x $file ];then
#         echo "Execute permission doesn't exist giving it"
#         chmod u+x $file
#         sleep 2
#         echo "Execute permission Given sucess fully"
#     else
#         echo "Execute permission exists"
#     fi
    
# else 
#     echo "File is not regular file"
# fi

# ## Final check
# ls -l $file

# 6. Write a Bash script that prompts the user to provide a filename and a word to search for.
# The script should first check if the file exists and then count the number of lines in the
# file. If the file contains more than n lines, it should search for the word in the file and
# display the line numbers where the word appears. If the file contains n or fewer lines, the
# script should display a message indicating that the search will not be performed.

# echo -n "Enter the filename: ";read filename
# echo -n "Enter the word to search: ";read word
# echo -n "Enter the no of lines: ";read n
# if [ -e $filename ]; then
#     echo "File exists starting searching for word"
#     no_of_lines=`cat $filename | wc -l`
#     echo "No of lines in the file are $no_of_lines"
#     if [ $no_of_lines -gt $n ];then
#         echo "No of lines are greater than $n.Performing search for word"
#         grep -n $word $filename
#     else 
#         echo "No of lines are less so not performing the search"
#     fi
# else
#     echo "File doesn't exist"
# fi

# 7. Write script for print the ‘.txt’ files having least and maximum word counts. 
# echo -n "Enter the directory path: ";read directory_path


# 8. Write a script that accepts a string and a character as input. Find the position of the first
# occurrence of the character in the string using `expr`. If the character is not found,
# display an appropriate message.
# echo -n "Enter the string: ";read string
# echo -n "Enter the character: ";read char
# pos=`expr index $string $char`

# if [ $pos -gt 0 ];then 
#     echo "Character found at position $pos"
# else
#     echo "Character not found"
# fi


# 9. Write a script that takes a string as input and counts how many numeric characters (0-9)
# are present in the string. Then, calculate the sum of all those numeric characters.
# Implement it using until loop.

# echo -n "Enter the string to be checked:";read string
# count=0
# sum=0
# i=0
# echo ${string:1:1}
# while [ $i -lt ${#string} ];do
#     char=${string:$i:1}
#     if [[ $char =~ [0-9]  ]];then
#         count=$((count+1))
#         echo "Count become $count"
#         sum=$((char+sum))
#     fi
#     i=$((i+1))
# done
# echo "Count is $count"
# echo "Sum is $sum"

# 10. Write a script that takes a string as input and performs the following operations: (i) Count
# the number of uppercase and lowercase letters, (ii) toggle the uppercase and lowercase
# letters and print the final string.

echo -n "Enter the string to be checked:";read string
lower=0
upper=0
i=0
while [ $i -lt ${#string} ];do
    char=${string:$i:1}
    if [[ $char =~ [a-z]  ]];then
        lower=$((lower+1))
        # echo "Count become $lower"
    fi
    if [[ $char =~ [A-Z]  ]];then
        upper=$((upper+1))
        # echo "Count become $lower"
    fi
    i=$((i+1))
done
echo "lower is $lower"
echo "upper is $upper"

