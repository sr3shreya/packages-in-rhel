#!/bin/bash

echo " enter choice what you want to see "
echo " 1. show memory space "
echo " 2. show cpu utilization "
echo " 3. show swap space "
echo " 4. install packages "
echo " 5. upgrade package "
echo " 6. remove package "
read x
        case $x in
        1)
                free -h
                ;;
        2)
                iostat
                ;;
        3)
                echo "devices that are marked as swap are"
                a=swapon --all
                if [ $a -ne 0 ]
                then
                echo "above is the swap space "
                echo " summary of swap space is "
                swapon --summary
                else
                echo " no swap space exists "
                fi
                ;;
        4)
                echo "install packages"
                read -p " install package via 1. yum or 2. rpm" ch
                echo " enter name of [pa package you want ot install" 
                read name
                
                if [[ $(rpm -qa | grep $name) ]]
                then 
                echo "package has aready been installed"

                else 

                if [ $ch -eq 1 ]
                then
                sudo yum install $name
                elif [ $ch -eq 2 ];then
                sudo rpm -ivm $name
                fi

                fi
                ;;
        
        5)
                echo "upgrade  packages"
                read -p " upgrade package via yum or rpm... enter the choice 1 or 2" ch1
                echo " enter name of [pa package you want ot install" 
                echo " enter name of [pa package you want ot update" 
                read name
                
                if [[ $(rpm -qa | grep $name) ]]
                then
                echo "package is  installed let us upgrade "
                if [ $ch1 -eq 1 ]
                then
                sudo yum update $name
                elif [ $ch1 -eq 2 ]
                then
                sudo rpm -uvh $name
                fi
                else 
                echo " package is not eve installed.. first install it "
                echo " installing package "
                sudo yum install $name
                fi
                ;;
        6)
                echo "remove  packages"
                read -p " remove  package via yum or rpm... enter the choice 1 or 2" ch1
                echo " enter name of [pa package you want to remove" 
                read name
                
                if [[ $(rpm -qa | grep $name) ]]
                then
                echo "package is there let us remove it "
                
                if [ $ch1 -eq 1 ]
                then
                sudo yum remove $name
                elif [ $ch1 -eq 2 ]
                then
                sudo rpm -evv $name
                fi
                else
                echo " can't remove no such pkg exists "
                fi
                ;;
        *)
                echo "sorry"
                ;;
        esac
