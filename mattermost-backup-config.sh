#/bin/bash
S3_BUCKET_NAME="" #example mattermost-backup
S3_BUCKET_PATH="" #example s3://mattermost-backup/config

#S3 Upload config path
S3_MM_CONFIG_PATH="$S3_BUCKET_PATH/MMCONFIG/config/"
S3_NGINX_CONFIG_PATH="S3_BUCKET_PATH/NGINX/conf/"
S3_LETSENCRPYT_CONFIG_PATH="S3_BUCKET_PATH/letsencrypt/"

#Configuration path on mattermost server
MM_CONFIG_PATH="" #example /opt/bitnami/mattermost/config
NGINX_CONFIG_PATH="" #example /opt/bitnami/nginx/conf
LETSENCRPYT_CONFIG_PATH="" #example /opt/bitnami/letsencrypt

echo "Checking AWS S3 Connection..."
aws s3 ls $S3_BUCKET_NAME

echo "Backup Mattermost, nginx, and letsencrypt Config To AWS S3..."
aws s3 sync $MM_CONFIG_PATH $S3_MM_CONFIG_PATH;\
aws s3 sync $NGINX_CONFIG_PATH $S3_NGINX_CONFIG_PATH;\
aws s3 sync $LETSENCRPYT_CONFIG_PATH $S3_LETSENCRPYT_CONFIG_PATH

echo "Backup available at https://s3.amazonaws.com/$S3_BUCKET_PATH"
aws s3 ls $S3_BUCKET_PATH