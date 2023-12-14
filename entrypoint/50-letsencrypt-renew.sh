#!/bin/sh
set -eu

echo "Running certbot renew on startup..."
certbot --nginx renew

cron_dir=""

[ -d "/etc/periodic/daily/" ] && cron_dir="/etc/periodic/daily";
[ -d "/etc/cron.daily" ] && cron_dir="/etc/cron.daily";
[ ! "$cron_dir" = "" ] || exit 1;

certbot_file="${cron_dir}/certbot"
echo "Installing Let's Encrypt crontab script into $certbot_file"
echo "#!/bin/sh" > "$certbot_file"
echo "certbot -q --nginx renew" >> "$certbot_file"
chmod +x "$certbot_file"
