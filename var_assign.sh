a=`expr 5 + 3`
echo "a=$a"

b=`expr $a + 3`
echo "b=$b"

if [ $a == $b ];then
    echo "a and b are equal"
else 
    echo "a and b are not equal"
fi
    
a="hello"
if [ -z $a ];then 
    echo "a is empty"
else 
    echo "a is not empty"
fi

if [ -n $a ] && [ $a = "Hi" ]; then
   echo "a is Hi"
else
   echo "a is not Hi"
fi

