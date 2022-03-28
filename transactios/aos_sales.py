import lxml.etree as ET

dom = ET.parse("aos_sales.xml")
xslt = ET.parse("aos_sales.xsl")

transform = ET.XSLT(xslt)
dom_result = transform(dom)
print(dom_result)

