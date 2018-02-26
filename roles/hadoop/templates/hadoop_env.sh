#
# Hadoop Service - HDFS
#

# Space separated list of directories where NameNode will store file system image. For example, /grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn
DFS_NAME_DIR="{{ dfs_name_dir }}";

# Space separated list of directories where DataNodes will store the blocks. For example, /grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn
DFS_DATA_DIR="{{ dfs_data_dir }}";

# Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, /grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn
FS_CHECKPOINT_DIR="{{ fs_checkpoint_dir }}";



# Directory to store the HDFS logs.
HDFS_LOG_DIR="{{ hdfs_log_dir }}";

# Directory to store the HDFS process ID.
HDFS_PID_DIR="{{ hdfs_pid_dir }}";

# Directory to store the Hadoop configuration files.
HADOOP_CONF_DIR="{{ hadoop_conf_dir }}";