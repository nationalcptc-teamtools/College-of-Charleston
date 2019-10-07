#!/bin/bash
if [[ -d /data/logs ]]; then
   echo -e "${RED}[!] Logging directory already exists${RESET}"
else
   mkdir -p /data/logs
fi
if [[ -d /data/logs/script ]]; then
   echo -e "${RED}[!] Script directory already exists${RESET}"
else
   mkdir -p /data/logs/script
fi
echo '#### Custom Bash export configuration'  >> /root/.bashrc
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> /root/.bashrc
echo 'source /root/.bash_prompt.sh' >> /root/.bashrc
echo 'lsof -tac script "$(tty)" || {' >> /root/.bashrc
echo '    script -q -a -f /data/logs/script/Script-$(date -d "today"
+"%Y%m%d").log' >> /root/.bashrc
echo '}' >>  /root/.bashrc
