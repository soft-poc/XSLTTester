<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:variable name="lookups" select="/queryResponse/QueryResponse"/>
    <xsl:template match="/">
        <xsl:element name="MissingSKU">
        <xsl:for-each select="queryResponse/result/records">
            <xsl:variable name="product_code" select="Name"/>
            <xsl:if test="not($lookups/Item[FullyQualifiedName=$product_code]/FullyQualifiedName)">
                <xsl:element name="Sku">
                                            <xsl:value-of select="$product_code"/>
            </xsl:element>
            </xsl:if>

        </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>