# Run this script with sudo priviledge

# install dependency
apt install slurmd slurmctld

# setup nv-nsight-cu-cli
# nv-nsight-cu-cli (i.e. ncu) is not located at /usr/local/cuda on Orin
if [ ! -f "$CUDA_INSTALL_PATH/bin/nv-nsight-cu-cli" ]; then
    ln -s /opt/nvidia/nsight-compute/2022.2.1/ncu $CUDA_INSTALL_PATH/bin/nv-nsight-cu-cli
fi

# config slurm
chmod 777 /etc/slurm-llnl

sudo cat << EOF > /etc/slurm-llnl/slurm.conf
ClusterName=cool
ControlMachine=sail3090
#ControlAddr=
#BackupController=
#BackupAddr=
#
MailProg=/usr/bin/s-nail
SlurmUser=root
#SlurmdUser=root
SlurmctldPort=6817

SlurmdPort=6818
AuthType=auth/munge
#JobCredentialPrivateKey=
#JobCredentialPublicCertificate=
StateSaveLocation=/var/spool/slurmctld
SlurmdSpoolDir=/var/spool/slurmd
SwitchType=switch/none
MpiDefault=none
SlurmctldPidFile=/var/run/slurmctld.pid
SlurmdPidFile=/var/run/slurmd.pid
ProctrackType=proctrack/pgid
#PluginDir=
#FirstJobId=
ReturnToService=0
#MaxJobCount=
#PlugStackConfig=
#PropagatePrioProcess=
#PropagateResourceLimits=
#PropagateResourceLimitsExcept=
#Prolog=
#Epilog=
#SrunProlog=
#SrunEpilog=
#TaskProlog=
#TaskEpilog=
#TaskPlugin=
#TrackWCKey=no
#TreeWidth=50
#TmpFS=
#UsePAM=
#
# TIMERS
SlurmctldTimeout=300
SlurmdTimeout=300
InactiveLimit=0
MinJobAge=300
KillWait=30
Waittime=0
#
# SCHEDULING
SchedulerType=sched/backfill
#SchedulerAuth=
SelectType=select/cons_tres
SelectTypeParameters=CR_Core_Memory
#PriorityType=priority/multifactor
#PriorityDecayHalfLife=14-0
#PriorityUsageResetPeriod=14-0
#PriorityWeightFairshare=100000
#PriorityWeightAge=1000
#PriorityWeightPartition=10000
#PriorityWeightJobSize=1000
#PriorityMaxAge=1-0
#
# LOGGING

SlurmctldDebug=info
SlurmctldLogFile=/var/log/slurm-llnl/slurmctld.log
SlurmdDebug=info
SlurmdLogFile=/var/log/slurm-llnl/slurmd.log
JobCompType=jobcomp/none
#JobCompLoc=
#
# ACCOUNTING
#JobAcctGatherType=jobacct_gather/linux
#JobAcctGatherFrequency=30
#
#AccountingStorageType=accounting_storage/slurmdbd
#AccountingStorageHost=
#AccountingStorageLoc=
#AccountingStoragePass=
#AccountingStorageUser=
#
# COMPUTE NODES

PartitionName=sail3090 Nodes=sail3090 Default=NO MaxTime=INFINITE State=UP
#NodeName=sail3090 State=UNKNOWN
NodeName=sail3090 Sockets=2 CoresPerSocket=32 ThreadsPerCore=2 RealMemory=251000 State=UNKNOWN
EOF

chmod 755 /etc/slurm-llnl/
systemctl start slurmctld
systemctl start slurmd
scontrol update nodename=sail3090 state=idle
