#!/bin/bash
print_kernel_info ()
{
    echo "Kernel Name: $(uname -s)"
    echo "Kernel Version: $(uname -v)"
}

print_system_architecture ()
{
    echo "System Architecture: $(uname -m)"
}

print_cur_users_info ()
{
    echo "Users currently logged into your machine are:"
    echo "$(w)"
}

print_check_efi ()
{
   if efibootmgr | grep -q "EFI variables are not supported"; then
        echo "Your system is not using EFI"
    else
        echo "Your system is currently using EFI. Find your boot order below:"
        echo "$(efibootmgr)"
    fi
}

print_connected_devices ()
{
    echo "Block devices currently connected to your system are:"
    echo "$(lsblk)"
}

print_first_boot_device ()
{
    echo "$(efibootmgr | grep $(efibootmgr | awk '/BootCurrent/ {print $2}') -m3 | tail -n1)"
}

echo "Use this script if you are too lazy to search for the commands yourself. jk :)"
echo "----------------------------------------------------------------------"
echo "This script can display info about:"

select UTILITY in "System Information" "OS Components" "Exit";
do
    case $UTILITY in

    "Exit")
        echo "Bye bye... :("
        break
        ;;
    
    "System Information")
        select COMMAND in "OS Kernel Name and Version" "System Architecture" "Current Users" "Exit";
        do
            case $COMMAND in
            "OS Kernel Name and Version")
                print_kernel_info
                break
                ;;
            "System Architecture")
                print_system_architecture
                break
                ;;
            "Current Users")
                print_cur_users_info
                break
                ;;
            "Exit")
                break
                ;;
            esac
        done
        break
        ;;

    "OS Components")
        select COMMAND in "EFI Info" "Connected Block Devices" "First Boot Device" "Exit";
        do
            case $COMMAND in
            "EFI Info")
                print_check_efi
                break
                ;;
            "Connected Block Devices")
                print_connected_devices
                break
                ;;
            "First Boot Device")
                print_first_boot_device
                break
                ;;
            "Exit")
                break
                ;;
            esac
        done
        break
        ;;
    esac
done
    
