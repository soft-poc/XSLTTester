import lxml.etree as ET

dom = ET.parse("Return_Temp.xml")
xslt = ET.parse("Return.xsl")
transform = ET.XSLT(xslt)
dom_result = transform(dom)
print(dom_result)

with open("D:\Output.xml","w") as dom:
    dom.write(str(dom_result))

