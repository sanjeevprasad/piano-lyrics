#!/bin/sh
set -eu
OUTPUT_FILE=public/piano-standalone.html

printf "<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width,initial-scale=1'>

" >$OUTPUT_FILE

echo "<style>$(cat public/global.css | sd '\n' '')</style>" >>$OUTPUT_FILE
echo "<style>$(cat public/build/bundle.css | sd '\n' '')</style>" >>$OUTPUT_FILE
echo "<style>$(cat public/chota.css | sd '\n' '')</style>" >>$OUTPUT_FILE
echo "</head>" >>$OUTPUT_FILE
echo "<body></body>" >>$OUTPUT_FILE
echo "<script>$(cat public/build/bundle.js)</script>" >>$OUTPUT_FILE
echo "</html>" >>$OUTPUT_FILE

ls -lah $OUTPUT_FILE
echo "Done generating $OUTPUT_FILE"
