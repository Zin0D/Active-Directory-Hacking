#VERRY Short Script to get USERNAMES via an SMB Session
import os
import time
import sys
""" MAKE SURE TO ENTER YOUR OWN SID, WITHOUT THE HOST PART, TO ENUM"""

#Heist
usr = "USER"
ipv4 = "127.0.0.1"
passwd = "USER"
i = 1000
while(i != 1500):
    try:
        os.system(f'rpcclient -U {usr} --password={passwd} {ipv4} -c "lookupsids S-1-5-21-4254423774-1266059056-3197185112-{i}"')
        i += 1
        time.sleep(0.1)
    except KeyboardInterrupt:
        print("EXITING...")
        sys.exit()
