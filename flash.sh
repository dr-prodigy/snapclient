python3 -m venv venv
. venv/bin/activate
pip install esptool
pip install --upgrade pip
read -p "Press ENTER to continue, then Ctrl+A,Ctrl+K to exit monitor"

esptool.py -p /dev/cu.usbserial-1440 -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size detect --flash_freq 80m 0x1000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 build/snapclient.bin 0x370000 build/storage.bin
screen /dev/cu.usbserial-1440 115200
