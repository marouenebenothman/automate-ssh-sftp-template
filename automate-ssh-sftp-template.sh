
#!/bin/bash
#set -xv
menu()
{
       echo "                                  "
       echo "          MENU Marouene Ben Othman            "
       echo "          =============           "
       echo "                                  "
       echo "A)     ..........    "
       echo "                                  "
       echo "B)     .......   "
       echo "                                  "
       echo "C)   .......              "
       echo "                                  "
	   echo "D)    ..........             "
       echo "                                                "
       echo "Q) Quitter                        "
       echo "                                  "
       echo "                                  "
}

clear
menu
USERNAME=$2
echo "Select your choice : "
read choix

       case $choix in
               a|A)
                       echo "What is your variable number ? ? "
                       read variable
					   ServerLine="`grep $variable servers.conf`"
					   ServerToCheckSERVERDISTINCT="$(cut -d'~' -f2 <<<$ServerLine)"
					   Server="$(cut -d'\' -f1 <<<$ServerToCheckSERVERDISTINCT)"
					   SERVERDISTINCT="$(cut -d'\' -f2 <<<$ServerToCheckSERVERDISTINCT)"
					   echo  "Server of $variable $Server and  has $SERVERDISTINCT"
					   read -p "Are you sure? Y/y to Continue   " -n 1 -r
					   echo    
					   if [[ $REPLY =~ ^[Yy]$ ]]
						then
							if [ "$SERVERDISTINCT" == 'SERVERDISTINCT' ]
							   then
							   echo "Generate export_lien_mag.csv"
								ssh -p 22 -tt "$USERNAME"@serverxxx "sshclient root@$Server -a 'command && command' "
								read -p "Do you want to access to remote file (WinScp Installation is required for this action) ? Y/y to Continue   " -n 1 -r
					            echo    
					            if [[ $REPLY =~ ^[Yy]$ ]]
						         then
								 winscp.exe sftp://username:password@username@$Server/home/path/to/file
								fi
							   ssh -p 22 -tt "$USERNAME"@serverxxx "sshclient root@command1 && command2 && command3' "
							   read -p "Do you want to access to remote file (WinScp Installation is required for this action) ? Y/y to Continue   " -n 1 -r
					            echo    
					            if [[ $REPLY =~ ^[Yy]$ ]]
						         then
								 winscp.exe sftp://username:password@username@$Server/path/to/file
								 
								fi	
							fi
							if [ "$SERVERDISTINCT" == 'NOSERVERDISTINCT' ]
							   then
			ssh -p 22 -tt "$USERNAME"@serverxxx "sshclient root@$Server -a 'command1 && command2' "

							fi   		
						else
                            echo "Verify your conf file"
                       exit
						fi
				   
			   ;;
            
               b|B)    echo "What is your variable id ? "
                       read variable
					   
					   echo "----Launch first script--------"
					   ssh -p 22 -tt "$USERNAME"@serverxxx "sshclient root@xxx${variable}.xxx -a 'command1 && command2 && command3 && command4 ' "
					   echo "----Launch second script--------"
					   ssh -p 22 -tt "$USERNAME"@serverxxx "sshclient root@xxx${variable}.xxx -a 'command1 && command2 && command3 && command4' "

					   ;;

               c|C)    echo "What is your variable id ? "
                       read variable
					   
					   echo "----Launch Script of Switch KS--------"
					   ssh -p 22 -tt "$USERNAME"@serverxxx "sshclient root@xxx${variable}.xxx -a 'command1 && command2 ' "
					   ;;
			   d|D)      
					   echo "What is your variable number ? ? "
                       read variable
					   ServerLine="`grep $variable servers.conf`"
					   ServerToCheckSERVERDISTINCT="$(cut -d'~' -f2 <<<$ServerLine)"
					   Server="$(cut -d'\' -f1 <<<$ServerToCheckSERVERDISTINCT)"
					   SERVERDISTINCT="$(cut -d'\' -f2 <<<$ServerToCheckSERVERDISTINCT)"
					   echo  "Server of $variable $Server and  has $SERVERDISTINCT"
					   read -p "Do you want to access to this server $Server  (WinScp Installation is required for this action) ? Y/y to Continue   " -n 1 -r
					            echo    
					            if [[ $REPLY =~ ^[Yy]$ ]]
						         then
								 winscp.exe sftp://username:password@username@$Server/Path/to/file
								fi
					   
					   ;;	
               q|Q)    banner "Bye"
                       exit
                       ;;
               *)      echo "See you soon"
                       exit
                       ;;
       esac
exit