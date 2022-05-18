import yaml
import pysftp
import os
import AuthOnFingerPrint

with open('config/config.yaml') as settings:
    cfg = yaml.load(settings)

host = cfg['host']
username = cfg['username']
password = cfg['password']
serverkey = cfg['fingerPrint']

directoryPairs = {'', '', ''}

options = pysftp.CnOpts()
options.hostkeys.clear()
options.hostkeys.add('', '', AuthOnFingerPrint.FingerprintKey(serverkey))

with pysftp.Connection(host, username=username, password=password, cnopts=options) as sftp:
    #for source, destination in directoryPairs.items():
        #sftp.get_d(source, destination, preserve_mtime=True)
        #if sftp.exists(source):
            #files = sftp.listdir(source)
            #for f in files:
                #sftp.remove(os.path.join(source, f))
    sftp.close()



