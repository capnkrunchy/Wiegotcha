#!/bin/bash

echo "Content-type: text/html"
echo ""
echo '<html>'
echo '<head>'
variable=$1
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '</head>'
echo '<body>'
sudo dummy=$variable sh -c 'echo "lf em 410x_write" $dummy "1" | /root/proxmark3/client/proxmark3 /dev/rfcomm0'
echo '</body>'
echo '</html>'

exit 0