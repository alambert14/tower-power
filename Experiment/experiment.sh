sudo su
cd ~/MTX/SnmpPoller
node server.js &

cd
cd Experiment
./bwc_parse.py &
./wlan0_parser.sh &
