<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:variable name="lookups" select="/queryResponse/QueryResponse"/>
    <xsl:template match="/">
        <xsl:variable name="RecordLength" select="count(/queryResponse/result/records)"/>
        <xsl:element name="counter">
            <xsl:value-of select="$RecordLength"/>
        </xsl:element>
        <qbo>{ "Line": [
            <xsl:for-each select="queryResponse/result/records">{ "Description": "<xsl:value-of select="Name"/>",
                <xsl:variable name="product_code" select="ProductCode"/>
                "DetailType": "SalesItemLineDetail", "SalesItemLineDetail": { "TaxCodeRef": { "value": "NON" }, "Qty":
                <xsl:value-of select="expr1"/>, "UnitPrice":<xsl:value-of select="expr0"/>, "ItemRef": { "value": "
                <xsl:value-of select="$lookups/Item[FullyQualifiedName=$product_code]/Id"/>", "name": "<xsl:value-of select="Name"/>" } }, "LineNum":
                <xsl:value-of select="position()"/>, "Amount":<xsl:value-of select="expr0"/>, "Id": "1" }
                    <xsl:if test="$RecordLength!=position()">,</xsl:if>



            </xsl:for-each>
            ]}
        </qbo>
    </xsl:template>
</xsl:stylesheet>