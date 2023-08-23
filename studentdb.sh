clear
while [ 1 ]
do
	echo 1.Create 2.Display 3.Insert 4.Search 5.Modify 6.EXIT
	echo "Enter choice=\c"
	read ch
	case $ch in
		1)
			echo -n "Enter file name :"
			read fname
			if [ -e $fname ]
			then
				echo "File already exists"
			else
				>> $fname
				echo "File Created Succesfully"
			fi
			;;
		2)
			echo -n "Enter file name:"
			read fname
			if [ -e $fname ]
			then
				echo "The content of file : "
				sort -n $fname
			else
				echo "File does not exist"
			fi
			;;
		3)
			echo -n "Enter the file name:"
			read fname
			if [ -e $fname ]
			then 
				echo -n "Enter the roll number:"
				read roll 
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then
					echo "Record already exist"
				else
					echo -n "Enter name:"
					read name
					echo $roll $name >> $fname
					echo "Record inserted successfully"
				fi
			else
				echo "File Does notr Exist"
			fi
			;;
		4)
			echo -n "Enter the file name : " 
			read fname 
			if [ -e $fname ] 
			then
			        echo -n "Enter the roll number : "
				read roll
				grep -w "$roll" $fname
			       ans=$?
			       if [ $ans -eq 0 ]	
			       then
			       	       echo "Record found "
			       else
			       	       echo "Record not found"
		       	       fi
	       	       else
			       echo " File dne " 
	       	       fi
	       	       ;;
	       5)
		       echo -n "Enter the file name:" 
		       read fname
		       if [ -e $fname ]
		       then
			 echo -n "Enter the roll number": 
			 read roll
		         grep -w "$roll" $fname 
	                 ans=$?
		         if [ $ans -eq 0 ] 
			 then	
				echo -n "Enter NewRoll and NewName"       l
			         read nroll nname
				 grep -w  "$nroll" $fname 
				 ans=$?
				 if [ $ans -eq 0 ]
				 then 
					 echo "Record already exists"
				 else
					 grep -v "$roll" $fname >> temp
					 echo "$nroll $nname" >> temp 
					 rm $fname 
					 cp temp $fname 
					 rm temp 
					 echo "Record successfully modified"
				 fi
			 else echo "Record not present" 
			 fi
		 else
		    echo "File DNE"
		 fi
;;
               6)
	       echo -n  "Enter the file name :"
	       read fname 
	       if [ -e $fname ] 
	       then 
		       echo -n "Enter the roll number"
		       read roll 
		       grep -w "$roll" $fname
		       ans=$?
		       if [ $ans -eq 0 ] 
		       then 
			    grep -v "$roll" $fname >> temp 
			    rm $fname 
			    cp temp $fname 
			    rm temp 
			    echo "Record successfully deleted" 
		    else
			  "Roll number doesnt exist"
		  fi
	  else
		"File DNE" 
	fi
	;;	
	       7)exit
			;;

		*)echo "Wrong option"
			;;
	esac
done

