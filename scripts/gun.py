import subprocess
import json
import requests
from sseclient import SSEClient

def getEvents():
    while True:
        messages = SSEClient("https://api.particle.io/v1/devices/2b004d000951343334363138/events?access_token=b2c4192789c9f675767542ed215829b2abfad3de")
        for msg in messages:
            print (msg.data)
            if "TRIGGER PULLED" in msg.data:
                jsonData = json.loads(msg.data)
                print ("Data: %s Core: %s" % (jsonData["data"], jsonData["coreid"]))
                subprocess.call("/Users/joeb/Workspaces/eth/glockchain/scripts/gunShell.sh shot", shell=True)
            elif "Gun DOCKED" in msg.data:
                jsonData = json.loads(msg.data)
                print ("Data: %s Core: %s" % (jsonData["data"], jsonData["coreid"]))
                subprocess.call("/Users/joeb/Workspaces/eth/glockchain/scripts/gunShell.sh holster", shell=True)
            elif "Gun REMOVED" in msg.data:
                jsonData = json.loads(msg.data)
                print ("Data: %s Core: %s" % (jsonData["data"], jsonData["coreid"]))
                subprocess.call("/Users/joeb/Workspaces/eth/glockchain/scripts/gunShell.sh drawn", shell=True)

getEvents()
