### If statements
echo -n "Enter a number: "
read a
if [ $a -ge 5 ]; then
   echo "a is greater than or equal to 5"
else
   echo "a is less than 5"
fi

### Case statements
case $a in 
    1)echo "a is 1";;
    2)echo "a is 2";;
    3)echo "a is 3";;
    *) echo "a is not 1, 2 or 3";;
esac


### for loops
for i in *.txt;do
    echo  "details of $i are"
    ls -l "$i"
done

### while loops
while [ $a -gt 0 ];do
    echo "a is $a"
    a=$((a - 1))
done

# while [ ! -e target.txt ];do
#     echo "Creating target.txt"
#     touch target.txt
#     sleep 2
# done

# echo "target.txt has been created"
echo -n "Enter a number: "
read -r a

if [ "$a" -ge 5 ]; then
   echo "a is greater than or equal to 5"
else
   echo "a is less than 5"
fi

case "$a" in 
    1) echo "a is 1";;
    2) echo "a is 2";;
    3) echo "a is 3";;
    *) echo "a is not 1, 2 or 3";;
esac

for i in *.txt; do
    echo "details of $i are"
    ls -l "$i"
done

while [ "$a" -gt 0 ]; do
    echo "a is $a"
    a=$((a - 1))
done

while [ ! -e target.txt ]; do
    echo "Creating target.txt"
    touch target.txt
    sleep 2
done

echo "target.txt has been created"
