# Bitnami mattermost, nginx, and LetsEncrypt Backup Configuration to AWS S3
This is a Bash script that performs a backup of bitnami three configurations (Mattermost, Nginx, and Let's Encrypt) and uploads them to an AWS S3 bucket.

## Prerequisites
- mysqldump command must be installed
- AWS CLI must be installed and configured with valid credentials
- AWS S3 Bucket Access wit IAM  ``ListBucket, PutObject, GetObject and DeleteObject`` has been configured
- Mattermost database credentials must be available
- Mattermost service must be installed and running on the same machine where this script will be executed


<hr>

## Installation
1. Download the scripts file to your local machine, Name the file something like **backup-script.sh**
2. Open the file and set the following variables:

```
S3_BUCKET_NAME="my-mattermost-backup"
S3_BUCKET_PATH="s3://my-mattermost-backup/config"
MM_CONFIG_PATH="/opt/bitnami/mattermost/config"
NGINX_CONFIG_PATH="/opt/bitnami/nginx/conf"
LETSENCRPYT_CONFIG_PATH="/opt/bitnami/letsencrypt"
```
4. Save the file.

5. Open a terminal window and navigate to the directory where you saved the script.

6. Run the script by entering bash backup-script.sh or **./backup-script.sh** if you have made it executable with chmod **+x backup-script.sh**

The script will run, and you will see output in the terminal indicating that the backup is being created and uploaded to S3. Once the backup is complete, you will see a message indicating that it is available at a specific URL that includes the S3 bucket path. You can then verify that the backup was uploaded to your S3 bucket by checking the contents of the specified S3 bucket path.

<hr>

## Automation
1. Open a terminal window and navigate to the directory where you saved the backup-script.sh file.

2. Run the command crontab -e to open the cron job editor.

3. In the editor, add a new line with the following syntax to run the backup script every day at 1am:

```
0 1 * * * /bin/bash /path/to/backup-script.sh >> /path/to/backup-script.log 2>&1
```
Make sure to replace **/path/to/backup-script.sh** with the actual path to your **backup-script.sh** file, and replace **/path/to/backup-script.log** with the actual path to the log file that you want to create. This line tells cron to run the script at 1am every day, and to append the script's output to the specified log file.

4. Save and exit the editor.

The script will now run automatically at the scheduled time each day, and execution logs will be saved to the specified log file. You can view the logs by opening the log file in a text editor or by running the command tail -f **/path/to/backup-script.log** in a terminal window to stream the logs in real-time.

That's it! Now your backup script will run automatically every day at 1am, and you can check the logs to ensure that the backups are being created and uploaded to S3 successfully.

## This scipts has been tested on
```
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

Linux localhost 5.10.0-21-cloud-amd64 #1 SMP Debian 5.10.162-1 (2023-01-21) x86_64 GNU/Linux
```

```
Mattermost Team Edition packaged by Bitnami
Version:        v7.9.0
GitCommit:      56199911e811bb8d96f719049fecc3c64fce9782
GitTreeState:   "clean"
BuildDate:      2023-03-01T08:32:15Z
GoVersion:      go1.18.1
Compiler:       gc
Platform:       linux/amd64
```

# Note
- Make sure that the AWS CLI is properly configured on your server.
- You need to have write permission to the S3 bucket where you want to store the backup files.
- This script assumes that you have installed Mattermost, Nginx, and LetsEncrypt on the same server. If not, you will need to modify the script accordingly.

## License
This project is licensed under the MIT License.

<hr>

## Credit

**This Scripts Created By* [taufiqpsumarna](https://github.com/taufiqpsumarna)