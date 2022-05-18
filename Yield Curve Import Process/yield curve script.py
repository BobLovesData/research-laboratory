import lxml.etree
import pandas as pd

nsmap = {
  'm': 'http://schemas.microsoft.com/ado/2007/08/dataservices/metadata',
  'd': 'http://schemas.microsoft.com/ado/2007/08/dataservices'
}
m_null = ('{%s}null' % nsmap['m'])


def xml2dict(xml_file):
    root = lxml.etree.parse(xml_file)
    result = {}
    all_records = []
    for properties_el in root.xpath('//m:properties', namespaces=nsmap):
        for child in properties_el.getchildren():
            tag = child.tag.split('}',1)[-1]  # split the namespace off the tag
            if child.attrib.get(m_null):
                value = None
            else:
                value = child.text
            result[tag] = value
    return result

#finalResult = pd.DataFrame(xml2dict('YieldCurveData.xml'), index=[0])

print(pd.DataFrame(xml2dict('YieldCurveData.xml'), index=[0]))

