#!/usr/bin/env fibjs

# 当前目录中可以配置 include.list exclude.list可以直接上传


user=root
destion=139.196.47.205
depath=/root/crm;

path=`pwd`

includefile=./include.list
excludefile=./exclude.list

pinclude=''
pexclude=''

if [  -f "$includefile" ]; then
   pinclude='--include-from=./include.list'
fi


if [  -f "$excludefile" ]; then
	pexclude='--exclude-from=./exclude.list'
fi

echo "upload $path to $destion@$depath"
echo "----------------start--------------------------"
rsync  -avzv --delete $pinclude   $pexclude   ./  $user@$destion:$depath
echo "----------------end--------------------------"
