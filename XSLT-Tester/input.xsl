    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="urn:partner.soap.sforce.com">
        <xsl:output encoding="utf-8" indent="no" method="xml"/>
        <xsl:template match="/">
            <xsl:element name="payments">
           <xsl:for-each select="ns1:queryResponse/ns1:result/ns1:records">
                <xsl:element name="payment">
                   <xsl:element name="id"><xsl:value-of select="Id"/></xsl:element>
                           <xsl:element name="id"><xsl:value-of select="Id"/></xsl:element>
                           <xsl:element name="AuthorizationAmount"><xsl:value-of select="AuthorizationAmount"/></xsl:element>
                           <xsl:element name="type"><xsl:value-of select="type"/></xsl:element>
                    <xsl:element name="CapturedAmount"><xsl:value-of select="CapturedAmount"/></xsl:element>
                                 <xsl:element name="Method"><xsl:value-of select="Method"/></xsl:element>
                </xsl:element>
           </xsl:for-each>
            </xsl:element>
        </xsl:template>
    </xsl:stylesheet>
