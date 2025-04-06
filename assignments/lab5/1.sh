# 1. Write a shell script to compare and analyze two files: 20
# You are provided with the following files: file1.txt, file2.txt:
# a. Compare the two files and check if they are identical. Display an appropriate message.
# b. If the files differ, display the unique lines from each file and the common lines between the two.
# c. Save the comparison results to a file named comparison_results.txt.

# diff file1.txt file2.txt 
# comm file1.txt file2.txt 
# diff file1.txt file2.txt > comparison_results.txt

# 2. Write a shell script to sort and process data in a file: 20
# You are provided with the file data.txt:
# a. Sort the file based on the second field (name) and display the output.
# b. Reverse the sorted order and save the output to a new file named sorted_output.txt.
# c. Remove duplicate lines (if any) from the sorted data and save the unique lines to a file named
# unique_sorted.txt.

# sort -t: -k2 data.txt
# sort -t: -k2 -r data.txt > sorted_output.txt
# sort -t: -k2 -r data.txt|uniq >unique_sorted.txt

# 3. Write a shell script to search and manipulate text in a file: 20
# You are provided with the file textfile.txt:
# a. Search for the pattern journey in the file and display all lines containing it.
# b. Count and display the total number of occurrences of the pattern in the file.
# c. Create a new file named filtered_output.txt containing all lines that do not match the pattern.
# d. If the pattern is not found in the file, display a suitable message to the user.

# grep journey textfile.txt
# grep journey textfile.txt|wc -l
# grep -v textfile.txt > filtered_output.txt
# if [ -z `grep journey textfile.txt` ];then
#     echo "Pattern not found in the file"
# fi

# 4. Extract Specific Fields: Print the first and third fields from each line of a file named employees.txt.
# cut -d: -f1,3 employees.txt

# 5. Replace Words with a Pattern: Replace all words starting with 'test' with 'exam' in a file named input.txt
# and print only modified lines. 
 
# sed -n 's/test/exam/p' input.txt

# 6. Filter Records Based on Condition: Print all records from a file named sales.txt where the third field
# (sales amount) is more significant than 10,000

# awk '$3>10000 {print}' sales.txt

