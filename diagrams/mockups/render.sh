#!/usr/bin/env bash
# Render HTML mockups to PNG with headless Chrome. Run from anywhere.
set -euo pipefail
cd "$(dirname "$0")"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
OUT=../exports

shot() { # name page width height
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
    --window-size="$3,$4" --screenshot="$OUT/mockup_$1.png" "file://$PWD/$2.html" >/dev/null 2>&1
  echo "mockup_$1.png"
}

shot search        a_search        1100 720
shot search_mobile a_search_mobile 520  900
shot card          b_card          1100 620
shot status        c_status        1100 620
shot import        d_import        900  210
