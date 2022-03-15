<xsl:stylesheet version = "1.0"
   xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="lookups" select="/customers/lookups"/>
    <xsl:template match="/">
        <xsl:element name="abc">
            <xsl:if test="$lookups/node[key='115']/value!=''">
                 I am good
            </xsl:if>
        </xsl:element>
    </xsl:template>


    

    <xsl:template match="node">
        <xsl:value-of select="value"/>
    </xsl:template>
</xsl:stylesheet>