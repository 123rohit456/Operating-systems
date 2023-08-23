echo Enter a number :  
read a 
i=2
flag=1
while [ $i -lt  $a ]
do
	rem=`expr $a % $i`
#	echo $rem
	if [ $rem -eq 0 ]
	then
		flag=0
	fi
	i=`expr $i + 1`
done
if [ $flag -eq 0 -o $a -eq 1 ]
then 
	echo It is not a prime number 
else
	echo It is a prime number
fi
