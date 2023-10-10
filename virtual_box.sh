# some virtual box short cuts using an alias
# alias vbox='"/c/Program Files/Oracle/VirtualBox/VBoxManage.exe"'

# list vm's
vbox list vms 

# shutdown vm
vbox controlvm <vm> poweroff

# start vm - completing the circle of life
vbox startvm <VM>  —type (gui, headless)
