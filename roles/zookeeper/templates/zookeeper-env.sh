ZOOKEEPER_HOME={{ zookeeper_home_dir }}
ZOOKEEPER_LOG_DIR={{ zookeeper_log_dir }}
ZOOKEEPER_PID_DIR={{ zookeeper_pid_dir }}
ZOOKEEPER_DATA_DIR={{ zookeeper_data_dir }}
ZOOKEEPER_CONF_DIR={{ zookeeper_conf_dir }}

ZOOCFGDIR=$ZOOKEEPER_CONF_DIR
ZOOCFG=zoo.cfg
PIDFILE=$ZOOKEEPER_PID_DIR
ZOO_LOG_DIR=$ZOOKEEPER_LOG_DIR

SERVER_JVMFLAGS=-Xmx1024m

CLASSPATH=$CLASSPATH:$ZOOKEEPER_HOME/*

export ZOOCFGDIR=$ZOOKEEPER_CONF_DIR
export ZOOCFG={{ zookeeper_zoo_cfg_file | default('zoo.cfg') }}