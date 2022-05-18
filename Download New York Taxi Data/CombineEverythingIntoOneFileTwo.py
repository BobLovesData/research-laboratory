import os

file_masks = ['fhv', 'green', 'yellow']


def combine_files(file_mask):

    with open(os.path.join('TaxiDriveCombinedData', file_mask + '_trip_data.csv'),'w') as fout:
        csvfiles = []
        for path, directories, files in os.walk('TaxiDriveData/'):
            csvfiles.extend([os.path.join(path, fn) for fn in files if fn.startswith(file_mask)])

        for in_file in csvfiles:
            with open(in_file,'r') as fin:
                # f.next() # comment this out if you want to keep the headers
                for line in fin:
                    fout.write(line)


for m in file_masks:
    combine_files(m)