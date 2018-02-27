ZOOKEEPER_HOME={{ zookeeper_home_dir }}
ZOOKEEPER_LOG_DIR={{ zookeeper_log_dir }}
ZOOKEEPER_PID_DIR={{ zookeeper_pid_dir }}
ZOOKEEPER_DATA_DIR={{ zookeeper_data_dir }}

SERVER_JVMFLAGS=-Xmx1024m

CLASSPATH=$CLASSPATH:$ZOOKEEPER_HOME/*