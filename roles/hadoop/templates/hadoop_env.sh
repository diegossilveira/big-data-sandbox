#
# Hadoop Service - HDFS
#

# The user owning the HDFS services. For example, hdfs.
HDFS_USER="{{ hdfs_user }}"

# Space separated list of directories where NameNode will store file system image. For example, /grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn
DFS_NAME_DIR="{{ dfs_name_dirs | join(" ") }}";

# Space separated list of directories where DataNodes will store the blocks. For example, /grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn
DFS_DATA_DIR="{{ dfs_data_dirs | join(" ") }}";

# Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, /grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn
FS_CHECKPOINT_DIR="{{ fs_checkpoint_dirs | join(" ") }}";

# Directory to store the HDFS logs.
HDFS_LOG_DIR="{{ hdfs_log_dir }}";

# Directory to store the HDFS process ID.
HDFS_PID_DIR="{{ hdfs_pid_dir }}";

# Directory to store the Hadoop configuration files.
HADOOP_CONF_DIR="{{ hadoop_conf_dir }}";

#
# Hadoop Service - YARN 
#

# The user owning the YARN services. For example, yarn.
YARN_USER="{{ yarn_user }}";

# Space separated list of directories where YARN will store temporary data. For example, /grid/hadoop/yarn/local /grid1/hadoop/yarn/local /grid2/hadoop/yarn/local
YARN_LOCAL_DIR="{{ yarn_local_dirs | join(" ") }}";

# Directory to store the YARN logs.
YARN_LOG_DIR="{{ yarn_log_dir }}"; 

# Space separated list of directories where YARN will store container log data. For example, /grid/hadoop/yarn/logs /grid1/hadoop/yarn/logs /grid2/hadoop/yarn/logs
YARN_LOCAL_LOG_DIR="{{ yarn_local_log_dirs | join(" ") }}";

# Directory to store the YARN process ID.
YARN_PID_DIR="{{ yarn_pid_dir }}";

#
# Hadoop Service - MAPREDUCE
#

# The user owning the MAPRED services. For example, mapred.
MAPRED_USER="{{ mapred_user }}";

# Directory to store the MapReduce daemon logs.
MAPRED_LOG_DIR="{{ mapred_log_dir }}";

# Directory to store the mapreduce jobhistory process ID.
MAPRED_PID_DIR="{{ mapred_pid_dir }}";

