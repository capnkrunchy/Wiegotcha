cd
sudo apt-get update
sudo apt-get install p7zip git ca-certificates build-essential libreadline5 libreadline-dev libusb-0.1-4 libusb-dev perl pkg-config wget libncurses5-dev gcc-arm-none-eabi libstdc++-arm-none-eabi-newlib libqt4-dev
git clone https://github.com/RfidResearchGroup/proxmark3.git
sudo apt remove modemmanager
cd proxmark3
make accessrights
cp Makefile.platform.sample Makefile.platform
echo "PLATFORM_EXTRAS=BTADDON">> Makefile.platform
make clean; make -j8

#find proxmark
echo "[+] Setup Proxmark3 RDV4 Bluetooth."
echo -e "\e[0;31m[+] We will now setup your Proxmark3 RDV4 for Bluetooth.\e[0m."
echo -e "\e[0;31m[+] Please turn on your Proxmark3 and turn on Bluetooth.\e[0m"
echo -n -e "\e[0;31m[+] When you're ready, press Enter to continue: \e[0m"
read -e NULL
raspi-config
macadd=$(hcitool scan | grep PM3_RDV4.0 | grep -o "[[:xdigit:]:]\{11,17\}")
echo ""
echo -e "\e[0;31m[+] the mac address of your proxmark is $macadd\e[0m"
sleep 3

echo "rfcomm bind rfcomm0 $macadd" /etc/rc.local #bind rfcomm0 to mac address

apt-get install expect
chmod +x proxmarkbluetooth.exp
expect /root/Wiegotcha/proxmarkbluetooth.exp $macadd
