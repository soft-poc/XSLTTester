import lxml.etree as ET

dom = ET.parse("source.xml")
xslt = ET.parse("mapping.xsl")
transform = ET.XSLT(xslt)
newdom = transform(dom)
print(newdom)


