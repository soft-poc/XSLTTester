import lxml.etree as ET

dom = ET.parse("source2.xml")
xslt = ET.parse("mapping2.xsl")
transform = ET.XSLT(xslt)
newdom = transform(dom)
print(newdom)


