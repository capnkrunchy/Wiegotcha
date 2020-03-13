#!/bin/bash

echo "Content-type: text/html"
echo ""
echo '<html>'
echo '<head>'
variable=$1
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '</head>'
echo '<body>'
sudo dummy=$variable sh -c 'echo "lf hid sim" $dummy | /root/proxmark3/client/proxmark3 /dev/ttyACM0'
echo '</body>'
echo '</html>'

exit 0
