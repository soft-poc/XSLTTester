import lxml.etree as ET

dom = ET.parse("payload.xml")
xslt = ET.parse("report.xsl")
transform = ET.XSLT(xslt)
dom_result = transform(dom)
print(dom_result)


