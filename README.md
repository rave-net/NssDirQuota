# NssDirQuota
simple scripts for setting dir quotas on OES NSS filesystem

can run script with directory and quota arguments, ./set_dir_quotas.sh /media/nss/VOLUME/directory 10GB

BASE_DIR and QUOTA_SIZE can be set as environment variables in scipt such as via a nightly cron job

If no enviroment variables set and no arguments passed, then scripts prompts for BASE_DIR and QUOTA_SIZE
