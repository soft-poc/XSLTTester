<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="lookups" select="/queryResponse/items"/>
<xsl:template match="/">
   <report>
       <xsl:for-each select="/queryResponse/result/records">
           <xsl:element name="line">
                <xsl:element name="Id">
                        <xsl:value-of select="Id"/>
                 </xsl:element>
                <xsl:element name="TotalLines">
                        <xsl:value-of select="expr1"/>
                 </xsl:element>
                <xsl:element name="Amount">
                        <xsl:value-of select="expr0"/>
                 </xsl:element>
                <xsl:element name="URL">
                        <xsl:value-of select="Id"/>
                 </xsl:element>
           </xsl:element>

       </xsl:for-each>
   </report>
</xsl:template>
</xsl:stylesheet>