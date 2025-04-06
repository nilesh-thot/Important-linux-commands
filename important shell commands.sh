echo $PATH # For viewing the path

##### ls commands
ls -r# For reverse order listing 
ls -d# For directory listing
ls -lt#Listing by last modification
ls -u#Last acess time listing

### Remove and move
rm -r dirname # For nonempty directory removal 
mv filepath final_directory_path # For moving files

### Grep commands
grep -i # Case insensitive
grep -v # Non matching lines
grep -c # Counts No of occurences
grep -n #Line number 


### Compression 
tar -czvf myFiles.tar.gz myFiles # Compression
tar -xzvf myFiles.tar.gz # UnCompression

### Changing file permissions
chmod u+x,go-r date.sh # change permissions at a time for two types of users
chmod g=x date.sh #Absolute assignment
chmod -R # For recursive directory walk

### Changing groups and owners
chgrp #Changing group
chown #Changing owner


### Metacharacters like *?
ls chap? # matches only single letter after it
ls chap0[1-4] # matches chap01 chap02 chap03 chap04
ls chap[x-z] # matches chapx chapy chapz
ls chap[a-zA-Z]* # matches all filenames beginning with a letter, irrespective of case.
ls chap.[!c] # Shows all except .c files

### Word count `wc`

wc -c # Count bytes
wc -m # Count Characters
wc -w # Count words
wc -l # Count lines


### usage of " , ' and `
echo "Date today $date"  
echo 'Date today $date'  
echo "date today `date`"


### Defining environment and global and shell variable
export foo=bar # Environment variable declaration
foo=bar # Shell variable declaration

### String concatenation
ext=.avi # This line assigns the string .avi to the variable ext
moviename=holmes # This line assigns the string holmes to the variable moviename.
filename=$moviename$ext # This line demonstrates string concatenation.



### Special Shell variables
# $1, $2...   |  Positional parameters representing command-line arguments
# $#          |  Number of arguments specified in command line
# $0          |  Name of executed command
# $*          |  Complete set of positional parameters as a single string
# “$@”        |  Each quoted string treated as a separate argument (recommended over $*)      
# $?          |  Exit status of last command


### expr command
#**Note**: Make sure you leave the gap bw operation
expr 5 + 3 # 8
expr substr "your_string" start_position length # Substring 
expr index "your_string" "character_to_find" # Index of character
expr length "your_string" # Length of string
expr "your_string" : 'regular_expression'  # Regular expression


#**Note**: Make sure you dont leave the gap bw = aasignment
str="hello"
echo ${#str} # Length of string

if [ $a == $b ];then # Using the arithemetic ==
    echo "a and b are equal"
else 
    echo "a and b are not equal"
fi

### Operations like == with string
[ $a = $b ] # For string it's just = not ==
[ $a != $b ] # For not equal to
[ -n $a ] # For not empty
[ -z $a ] # For empty
[ $a ] # you can use simply this
[ $a ] && [ $a = "Hi" ] #  and operation i.e.. if a is not empty then check if it's equal to "Hi"

### adding two values 
a=$((a + b)) 

### Commands for existence , read , write and execute
[ -e /path/to/file ] # Check if file exists
[ -r /path/to/file ] # Check if file is readable
[ -w /path/to/file ] # Check if file is writable
[ -x /path/to/file ] # Check if file is executable
[ -f /path/to/file ] # Check if file is a regular file
## For directories
[ -d /path/to/directory ] # Check if directory exists


## Example:
if [ -e /path/to/file ];then
    echo "File exists"
else
    echo "File does not exist"
fi

### Conditional operators
[ $a -eq $b ] # Equal to
[ $a -ne $b ] # Not equal to
[ $a -gt $b ] # Greater than
[ $a -ge $b ] # Greater than or equal to
[ $a -lt $b ] # Less than
[ $a -le $b ] # Less than or equal to

### if statement syntax
a=5
if [ $a -ge 5 ]; then
   echo "a is greater than or equal to 5"
else
   echo "a is less than 5"
fi


#### Lecture 5

pr filename # Shows the file in best manner to include headers footers and much more

cmp file1 file2
diff file1 file2 # Compare two files line by line
# -q option for quiet output, showing only whether files differ
diff -q file1 file2

comm file1 file2 # Compare two sorted files line by line
# -1 option to suppress lines unique to file1
# -2 option to suppress lines unique to file2
# -3 option to suppress lines common to both files

### Cut and paste commands 
cut -c 1-10 a.txt # Extract first 10 characters of each line from a.txt
# options:
cut -d',' -f1-3 file.csv # Extract by deleimeter and fields from cols 1,2,3
cut -d',' -f1,3 file.csv # Extract by deleimeter and fields from cols 1,3

paste -s -d "::\n" 3.txt # Run this command in /workspaces/Important-linux-commands/assignments/lab4 directory

### Sort command
sort -t : -n -k3 #-n is for numerical
sort -k n # sorts on the nth field
sort -k m.n # sorts on the mth field nth column
sort -r # sorts in reverse order
-f # Case insensitive
sort -m file1 file2 # When sorting two files which are sorted merge sort works fast so it use mergesort for faster if the files are large

## Uniq command syntax:
uniq 1.txt # Make sure the file is sorted

### grep commands
grep -i # Case insensitive
grep -v # Invert the match
grep -e pattern1 -e pattern2 # Search for multiple patterns

### sed commands
sed 's/old/new/' input.txt # here s refers to substitute
sed '1,3d' input.txt # delete lines 1 to 3 make sure you understood
sed '/pattern/d' input.txt # delete lines containing pattern
sed '/pattern/i\insert this line' input.txt # Inserts the text before the line containing pattern
sed '/pattern/a\insert this line after' # Inserts the text after r=the line containing pattern
sed '5,$d' input.txt # delete line 5 to end
sed '^#/d' input.txt # delete lines starting with # here ^ represents the start
sed -n 's/pattern/replacement/p' # Shows only the lines containing the pattern

### awk command
awk '/error/ {print}' input.txt # prints lines containing error
awk -F, '$2>10 {print $1,$3}' input.csv # prints first and third delimeter where the second field is greater than 10 in csv file
# NR - Current record number
# NF - Number of fields in the current record 
#$0 - The entire current record
awk '{print NR\tNF ,$0}' input.txt


#### Chapter 6

### Links
##Hard Link:It's like additional name for the same file .It links to same inode number.
## Cannot links across different filesystems
ln original.txt hardlink_for_original.txt
## Soft Link:Shortcut that points to same file .Have different inode number.Can link to different file systems
ln -s file.txt soft_link_for_file.txt




