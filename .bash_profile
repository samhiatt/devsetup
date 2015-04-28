# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/software/home/sam/mongodb-linux-x86_64-2.6.7/bin/:/opt/rh/python27/root/usr/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rh/python27/root/usr/lib64/

export PATH

function node() { if [ "$1" = "" ]; then repl.history; else env node $@; fi; }

alias openTunnelToQcdb="nohup ssh -NL 27018:localhost:27017 qcdb >> /mnt/hardware/data1/mongoStations/sshTunnel.log &"
alias startRapidfirePipe='forever start ~/qc/server_scripts/pipeRapidfireToMongo.js -d "mongodb://localhost:27018/qc" -c stationdata >> /mnt/hardware/data1/mongoStations/rapidfire_to_qcdb.log'
