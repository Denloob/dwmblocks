#!/usr/bin/env python3

import json
import urllib.request

with urllib.request.urlopen("https://ipv4.geojs.io/v1/ip/geo.json") as url:
    data = json.loads(url.read().decode())
    print(data['ip'], end='')
