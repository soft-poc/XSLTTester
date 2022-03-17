import lxml.etree as ET

dom = ET.parse("customer_src.xml")
xslt = ET.parse("customer_map.xsl")
transform = ET.XSLT(xslt)
dom_result = transform(dom)
print(dom_result)


