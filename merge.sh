#!/bin/bash
#Gabe Rodriguez
# This is a script that will take the contents from 2 input files and merge
#them into one file
#Exit status legend
# exit 0 - successful
# exit 1 - file doesnt exist
# exit 2 - file is not writable
# exit 3 - file is not readable
# exit 4 - file is not executable
# exit 5 - string empty

#if log.txt exists touch if not create log.txt
touch log.txt
#If user enters correct number of command line arguments
if [ $# -eq 3 ]; then
        #Check to see if output file exists
        if [ -f $3 ]; then
                echo exists
                #Check to see if output file is readable
                if [ -f $3 ]; then
                        echo readable
                # Check to see if output file is writable
                        if [ -w $3 ]; then
                                echo writable
                        #Check to see if output file is executable
                                if [ -x $3 ]; then
                                        echo executable
                        # Check to see if file1 exists
                                        if [ -f $1 ]; then
                                                echo file 1 exists
                                #check to see if file 1 is readable
                                                if [ -r $1 ]; then
                                                        echo readable
                                        #check to see if file 1 is writable
                                                        if [ -w $1 ]; then
                                                                echo writable
                                                #check to see if file 1 is executable
                                                                if [ -x $1 ]; then
                                                                        echo executable
                                                        #check to see if file 2 exists
                                                                        if [ -f $2 ]; then
                                                                                echo file2 exists
                                                                #Check to see if file 2 is readable
                                                                                if [ -r $2 ]; then
                                                                                        echo readable
                                                                                # check to see if file 2 is writable
                                                                                        if [ -w $2 ]; then
                                                                                                echo writable
                                                                                                # check to see if file 2 is executable
                                                                                                if [ -x $2 ]; then
                                                                                                        cat $1 > $3
                                                                                                        cat $2 >> $3
                                                                                                        echo $1 merged with $2
                                                                                                        echo successful merge between $1 and $2 >> log.txt
                                                                                                        exit 0
												# if file 2 is not executable exit 4
                                                                                                else
                                                                                                        echo $2 is not executable check permissions
                                                                                                        echo Unsuccessful merge $2 not executable >> log.txt
                                                                                                        exit 4
                                                                                                fi
                                                                                        #if file 2 is not writable exit 2
                                                                                        else
                                                                                                echo $2 is not writable check permissions
                                                                                                echo Unsuccesful merge $2 not writable >> log.txt
                                                                                                exit 2
                                                                                        fi
                                                                                #if file 2 is not readable exit 3
                                                                                else
                                                                                        echo $2 is not readable check permissions
                                                                                        echo Unsuccessful merge $2 not readable >> log.txt
                                                                                        exit 3
                                                                                fi
                                                                        # if file 2 does not exist exit 1
                                                                        else
                                                                                echo $2 does not exist
                                                                                echo Unsuccessful merge $2 does not exist >> log.txt
                                                                                exit 1
                                                                        fi
                                                                # if file 1 is not executable exit 4
                                                                else
                                                                        echo $1 is not executable check permissions
                                                                    echo Unsuccessful merge $1 not executable >> log.txt
                                                                        exit 4
                                                                fi
                                                        #if file 1 is not writable exit 2
                                                        else
                                                                echo $1 is not writable check permissions
                                                                echo Unsuccessful merge $1 not writable >> log.txt
                                                                exit 2
                                                        fi
                                                #if file 1 is not readable exit 3
                                                else
                                                        echo $1 is not readable check permissions
                                                        echo Unsuccessful merge $1 not readable >> log.txt
                                                        exit 3
                                                fi
                                        #if file 1 does not exits exit 1
                                        else
                                                echo $1 does not exist
                                                echo Unsuccessful merge $1 does not exist >> log.txt
                                                exit 1
                                        fi
                                # if file 3 is not executable exit 4
                                else
                                        echo $3 is not executable check permissions
                                        echo Unsuccessful merge $3 not executable >> log.txt
                                        exit 4
                                fi
                        # if file 3 is not writable exit 2
                        else
                                echo $3 is not writable check permissions
                                echo Unsuccessful merge $3 not writable >> log.txt
                                exit 2
                        fi
		#if file 3 is not readable exit 3
                else
                        echo $3 is not readable check permissions
                        echo Unsuccessful merge $3 not readable >> log.txt
                        exit 3
                fi
        #if file 3 does not exist exit 1
        else
                echo $3 does not exist
                echo Unsuccessful merge $3 does not exist >> log.txt
                exit 1
        fi
# if there are no command line arguments prompt user for files
elif [ $# -eq 0 ]; then
        echo Enter files to be merged
        read f1 f2 f3
        #checking to see if f1, f2 , f3 are empty
        if [ -z $f1 ] && [ -z $f2 ] && [ -z $f3 ]; then
                echo First file name not supplied
                echo Second file name not supplied
                echo Cannot perform merge
                echo Unsuccessful merge empty file names >> log.txt
                exit 5
        #Checking to see if f2 , f3 are empty
        elif [ -z $f2 ] && [ -z $f3 ]; then
                echo Second file name not supplied
                echo Cannot perform merge
                echo Unsuccessful merge empty file2 and file 3 >> log.txt
                exit 5
        #Checking to see if f3 is empty
        elif [ -z $f3 ]; then
                echo Output file not supplied
                echo Cannot perform merge
                echo Unsuccessful merge empty file 3 >> log.txt
                exit 5
        #If all 3 are entered now check read write exist
        else
#Checking to see if f1 exists
              	if [ -f $f1 ]; then
                        echo f1 exist
                        #checking to see if f1 is readable
                        if [ -r $f1 ]; then
                                echo f1 is readable
                                #checking to see if f1 is writable
                                if [ -w $f1 ]; then
                                        echo writable
                                        #checking to see if f1 is executable
                                        if [ -x $f1 ]; then
                                                echo executable
                                                #checking to see if f2 exists
                                                if [ -f $f2 ]; then
                                                        echo f2 exists
                                                        #checking to see if f2 is readable
                                                        if [ -r $f2 ]; then
                                                                echo f2 is readable
                                                                #checking to see if f2 is writable
                                                                if [ -w $f2 ]; then
                                                                        echo writable
                                                                        # checking to see if f2 is executable
                                                                        if [ -x $f2 ]; then
                                                                                echo executable
                                                                                #checking to see if f3 exists
                                                                                if [ -f $f3 ]; then
                                                                                        echo f3 exists
                                                                                        #checking to see if f3 is readable
                                                                                        if [ -r $f3 ]; then
                                                                                                echo readable
                                                                                                #checking to see if f3 is writable
                                                                                                if [ -w $f3 ]; then
                                                                                                        echo f3 is writable
                                                                                                        #checking to see if f3 is executable
                                                                                                        if [ -x $f3 ]; then
                                                                                                                echo executable
                                                                                                                #now merge files
                                                                                                                cat $f1 > $f3
                                                                                                                cat $f2 >> $f3
                                                                                                                echo $f1 merged with $f2
                                                                                                                echo Successful merge between $f1 and $f2 >> log.txt
                                                                                                                exit 0
													#if f3 not executable exit 4
                                                                                                        else
                                                                                                                echo $f3 is not executable check permissions
                                                                                                                echo Unsuccessful merge $f3 not executable >> log.txt
                                                                                                                exit 4
                                                                                                        fi
                                                                                                #if f3 not writable exit 2
                                                                                                else
                                                                                                        echo $f3 is not writable check permissions
                                                                                                        echo Unsuccessful merge $f3 not writable >> log.txt
                                                                                                        exit 2
                                                                                                fi
                                                                                        #if f3 not readable exit 3
                                                                                        else
                                                                                                echo $f3 is not readable check permissions
                                                                                                echo Unsuccessful merge $f3 not readable >> log.txt
                                                                                                exit 3
                                                                                        fi
                                                                                #if f3 does not exist exit 1
                                                                                else
                                                                                        echo $f3 does not exist
                                                                                        echo Unsuccessful merge $f3 does not exist >> log.txt
                                                                                        exit 1
                                                                                fi
                                                                        #if f2 not executable exit 4
                                                                        else
                                                                                echo $f2 is not executable check permissions
                                                                                echo Unsuccessful merge $f2 not executable >> log.txt
                                                                                exit 4
                                                                        fi
                                                                #if f2 not writable exit 2
                                                                else
                                                                        echo $f2 is not writable check permissions
                                                                        echo Unsuccessful merge $f2 not writable >> log.txt
                                                                        exit 2
                                                                fi
                                                        #if f2 not readable exit 3
                                                        else
                                                                echo $f2 is not readable check permissions
                                                                echo Unsuccessful merge $f2 not readable >> log.txt
                                                                exit 3
                                                        fi
                                                #if f2 does not exist exit 1
                                                else
                                                        echo $f2 does not exist
                                                        echo Unsuccessful merge $f2 does not exist >> log.txt
                                                        exit 1
                                                fi
                                        #if f1 not executable 4
                                        else
                                                echo $f1 is not executable check permissions
                                                echo Unsuccessful merge $f1 not executable >> log.txt
                                                exit 4
                                        fi
                                #if f1 is not writable exit 2
                                else
                                        echo $f1 is not writable check permissions
                                        echo Unsuccessful merge $f1 not writable >> log.txt
                                        exit 2
                                fi
 			#if f1 is not readable exit 3
                        else
                                echo $f1 is not readable check permissions
                                echo Unsuccessful merge $f1 not readable >> log.txt
                                exit 3
                        fi
                #if f1 does not exist exit 1
                else
                        echo $f1 does not exist
                        echo Unsuccessful merge $f1 does not exist >> log.txt
                        exit 1
                fi
        fi

else
        echo usage: ./merge.sh [FILE FILE FILE]
fi
