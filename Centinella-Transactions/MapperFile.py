import lxml.etree as ET

dom = ET.parse("centinella_transaction_soap.xml")
xslt = ET.parse("centinella_transaction.xsl")
transform = ET.XSLT(xslt)
dom_result = transform(dom)
print(dom_result)


