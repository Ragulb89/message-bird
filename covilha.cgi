#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Bash as CGI"
echo "</title></head><body>"


echo "<h1>Time in Covilha</h1>"
echo "<pre> $(TZ=Portugal date +%r) </pre>"


echo "</body></html>"
