#!/bin/ash


echo "Sleeps for 15s to initialize"
sleep 15s

while true; do

  php /app/cli.php -plex-url="$PLEX_URL" -sections="$PLEX_SECTIONS" -sort-skip-words="$PLEX_SORT_SKIP_WORDS" -token="$PLEX_TOKEN" || break

  echo ""
  if [ -f /data/* ]; then
    echo "Removing old data"
    rm -r /data/* || break
  fi

  echo "Copping app-files to /data"
  cp -R /app/assets /data/ || break
  cp -R /app/plex-data/ /data/ || break
  cp /app/index.html /data/ || break

  echo "Chmoding /data"
  chmod 0755 -R /data/ || break

  echo ""
  echo "Sleep until next run in $PLEX_INTERVAL"
  sleep "$PLEX_INTERVAL" || break
  echo ""
  echo ""

done
