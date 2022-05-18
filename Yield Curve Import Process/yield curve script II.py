import xml.etree.ElementTree as ET
import pandas as pd

xml_data = open('/path/user_agents.xml').read()

def xml2df(xml_data):
    root = ET.XML(xml_data) # element tree
    all_records = []
    for i, child in enumerate(root):
        record = {}
        for subchild in child:
            record[subchild.tag] = subchild.text
            all_records.append(record)
    return pd.DataFrame(all_records)




def xml2df(xml_data):
#...
    for i, child in enumerate(root): #Begin looping through our root tree
        record = {} #Place holder for our record
        for subchild in child: #iterate through the subchildren to user-agent, Ex: ID, String, Description.
            record[subchild.tag] = subchild.text #Extract the text create a new dictionary key, value pair
            all_records.append(record) #Append this record to all_records.
        # Flatten all key, value pairs to one large dictionary
        all_records = {k: v for d in all_records for k, v in d.items()}
# Convert to DataFrame, index=[0] is required when passing dictionary
xml_df = pd.DataFrame(all_records, index=[0])
return xml_df