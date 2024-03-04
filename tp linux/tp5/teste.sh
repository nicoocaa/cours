# nico
# 23/02/2024
hostname="$(hostnamectl | grep Static | cut -d " " -f4)"
source="$(source /etc/os-release && echo $NAME)"
uname="$(uname -r)"
ip="$(ip a | grep -E '^2:.*' -A 2 | grep inet | tr -s ' '  | cut -d' ' -f3)"
free="$(free -mh | grep -E '^Mem.*' | tr -s ' ' | cut -d' ' -f4)"
mem="$(free -mh | grep -E '^Mem.*' | tr -s ' ' | cut -d' ' -f2)"
df="$(df -mh | grep -E '/$' | tr -s ' '  | cut -d' ' -f4)"
ps="$(ps -eo comm --sort=-%mem | head -n5)"

echo "Machine name : $hostname"
echo "OS $uname and kernel version is $source"
echo "IP : $ip" 
echo "RAM : $free memory available on $mem total memory"
echo "Disk : $df space left"
echo -e "$ps\n"
echo -e "Listening ports :\n$(while read super_line; do
echo "- $super_line : $(ss -tuln | grep :[1-9] | tr -s " " | cut -d " " -f7)"
done <<< $(paste -d " " <(ss -tuln | grep :[1-9] | tr -s " " | cut -d " " -f5 | sed 's/.*://') <(ss -tuln | grep :[1-9] | tr -s " " | cut -d " " -f1)))"