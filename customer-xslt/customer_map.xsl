<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="lookups" select="/queryResponse/items"/>
<xsl:template match="/">
    <xsl:variable name="RecordLength" select="count(queryResponse/result/records)"/>

    <qbo>
        { "Line": [<xsl:for-each select="queryResponse/result/records"><xsl:variable name="product_code" select="StockKeepingUnit"/><xsl:variable name="ItemType" select="$lookups/item[sku=$product_code]/type" />
            {
        "Description": "<xsl:value-of select="Name"/>",<xsl:choose><xsl:when test="$ItemType='Group'">
         "DetailType": "GroupLineDetail",
          "GroupLineDetail": {
            "Quantity":<xsl:value-of select="expr1"/>,
            "GroupItemRef": {
            "name": "<xsl:value-of select="Name"/>",
            "value": "<xsl:value-of select="$lookups/item[sku=$product_code]/id"/>"
            }},</xsl:when><xsl:otherwise>
            "DetailType": "SalesItemLineDetail",
             "SalesItemLineDetail":{
        "TaxCodeRef": {
        "value": "NON"
        },
        "Qty":<xsl:value-of select="expr1"/>,
        "ItemRef":{
        "value": "<xsl:value-of select="$lookups/item[sku=$product_code]/id"/>",
        "name":"<xsl:value-of select="Name"/>"
        }
        },</xsl:otherwise> </xsl:choose>
        "LineNum":<xsl:value-of select="position()"/>,
        "Amount":<xsl:value-of select="expr0"/>
        }<xsl:if test="$RecordLength!=position()">,</xsl:if></xsl:for-each>
        ]}
    </qbo>
</xsl:template>
</xsl:stylesheet>