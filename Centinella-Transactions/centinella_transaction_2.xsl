    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output encoding="utf-8" indent="no" method="xml"/>
        <xsl:template match="/">
            <xsl:variable name="ProductSKUS" select="count(/queryResponse/result/records[Product2Id!=''])"/>
            <xsl:element name="ProductSKUList">
                <xsl:for-each select="/queryResponse/result/records[Product2Id!='']">
                    <xsl:choose>
                        <xsl:when test="$ProductSKUS!=position()">'<xsl:value-of select="Product2Id"/>',</xsl:when>
                        <xsl:otherwise>'<xsl:value-of select="Product2Id"/>'</xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:element>
        </xsl:template>
    </xsl:stylesheet>




