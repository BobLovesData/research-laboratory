import pandas as pd
import os

file_masks = ['fhv', 'green', 'yellow']


def combine_files(file_mask):

    #for path, directories, files in os.walk('TaxiDriveData/'):
     #   for fn in files:
      #      if fn.startswith(file_mask):
       #         combined_csv = pd.concat([pd.read_csv(os.path.join('TaxiDriveData/',f)) for f in files])
        #        if combined_csv.empty == False:
         #           combined_csv.to_csv(os.path.join('TaxiDriveCombinedData', file_mask + '_tripdata_combined.csv'), index=False)
    csvfiles = []
    for path, directories, files in os.walk('TaxiDriveData/'):
        csvfiles.extend([os.path.join(path, fn) for fn in files if fn.startswith(file_mask)])

    df = pd.concat((pd.read_csv(fn) for fn in csvfiles))
    df.to_csv(os.path.join('TaxiDriveCombinedData', file_mask + '_trip_data.csv'), index=False)

for m in file_masks:
    combine_files(m)