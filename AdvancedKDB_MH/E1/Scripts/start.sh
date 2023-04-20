#! /bin/bash

### ~~~ CONFIGURABLE PARAMETERS ~~~ ###


LOG_DIR=$HOME/E1/logdir/
mkdir -p $LOG_DIR
TICK_LOG=$LOG_DIR/TICK.log
RDB1_LOG=$LOG_DIR/RDB1.log
RDB2_LOG=$LOG_DIR/RDB2.log
CEP_LOG=$LOG_DIR/CEP.log
FH_LOG=$LOG_DIR/FH.log

PORT_TICK="5020"
PORT_RDB1="5021"
PORT_RDB2="5022"
PORT_CEP="5023"
PORT_FH="5024"

#logfile initialisation
logfile_init()
{
if [[ -f $1 ]]; then
    newfile=$(echo "$1" | cut -f 1 -d '.')
    timestamp=$(date "+%Y%m%d%H%M%S")
    mv $1 $newfile.$timestamp.log
    echo "---- initialising new log file ----" > $1
else
    echo "---- initialising new log file ----" > $1
fi
}

#process specific function
startTICK()
{
logfile_init $TICK_LOG
nohup q $HOME/E1/tick.q sym $HOME/E1/tplog/ -p ${PORT_TICK} -name "TICK" >> $TICK_LOG 2>&1 &
}
startRDB1()
{
logfile_init $RDB1_LOG
nohup q $HOME/E1/tick/r.q :${PORT_TICK} -p ${PORT_RDB1} -name "RDB1" >> $RDB1_LOG 2>&1 &
}
startRDB2()
{
logfile_init $RDB2_LOG
nohup q $HOME/E1/tick/r2.q :${PORT_TICK} -p ${PORT_RDB2} -name "RDB2" >> $RDB2_LOG 2>&1  &
}
startCEP()
{
logfile_init $CEP_LOG
nohup q $HOME/E1/tick/cep.q :${PORT_TICK} -p ${PORT_CEP} -name "CEP" >> $CEP_LOG 2>&1  &
}
startFH()
{
logfile_init $FH_LOG
nohup q $HOME/E1/tick/fh.q :${PORT_TICK} -p ${PORT_FH} -name "FH" >> $FH_LOG 2>&1  &
}

#function for starting all processes at once
startUp_AllProcesses()
{
echo "Starting all processes"
startTICK
sleep 3
echo "TP started..."
startRDB1
sleep 2
echo "RDB1 started..."
startRDB2
sleep 2
echo "RDB2 started..."
startCEP
echo "CEP started ..."
sleep 3
startFH
echo "FH started..."
}

#function for starting one specified process
startUp_OneProcess()
{
if [[ $1 = "TICK" ]]; then
     echo "Starting TP..."
     startTICK
elif [[ $1 = "RDB1" ]]; then
     echo "Starting RDB1..."
     startRDB1
elif [[ $1 = "RDB2" ]]; then
     echo "Starting RBD2..."
     startRDB2
elif [[ $1 = "FH" ]]; then
     echo "Starting FH..."
     startFH
elif [[ $1 = "CEP" ]]; then
     echo "Starting CEP..."
     startCEP
else
     echo "argument entered not recognised, please choose from list below:"
     echo "ALL"
     echo "TICK"
     echo "RDB1"
     echo "RDB2"
     echo "CEP"
     echo "FH"
     exit 1
fi
}

if [[ $1 = "ALL" ]]; then
     startUp_AllProcesses
else
     startUp_OneProcess $1
fi


