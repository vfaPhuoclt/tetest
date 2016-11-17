#!/bin/sh
path=$(dirname $0)
output="${path}/buildtime_header.h"
param=$1
echo $output
if [ "$param" = "" ]; then
	if [ ! -e $output ]; then
		# ファイルがなければデフォルトのファイルを作成する		
		param="dummy";
	fi
fi
echo $param
if [ "$param" = "update" ]; then
echo "// このファイルはビルド時にスクリプトで生成されています。" > $output
echo "" >> $output


#revision=$(git --git-dir="${path}/../../.git" log -1 --format="%H")
date=$(git --git-dir="${path}/../../.git" log -1 --format="%ci")


#echo "#define NEMURI_GIT_REVISION @\"${revision}\"" >> $output
echo "#define WIFI_GIT_DATE @\"${date}\"" >> $output

echo "" >> $output
echo "// [EOF]" >> $output
fi
if [ "$param" = "dummy" ]; then
echo "// このファイルはビルド時にスクリプトで生成されています。" > $output
echo "" >> $output

revision="Localbuild"
date="Unknown"

#echo "#define NEMURI_GIT_REVISION @\"${revision}\"" >> $output
echo "#define WIFI_GIT_DATE @\"${date}\"" >> $output

echo "" >> $output
echo "// [EOF]" >> $output
echo $output
fi

