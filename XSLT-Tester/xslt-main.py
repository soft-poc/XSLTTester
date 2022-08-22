import lxml.etree as ET

dom = ET.parse("input_payload.xml")
xslt = ET.parse("input.xsl")
transform = ET.XSLT(xslt)
dom_result = transform(dom)
print(dom_result)


