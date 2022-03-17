<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <customers>
            <xsl:for-each select="/customers/customer">
                <customer>
                    <customer_number>
                        <xsl:value-of select="customer_number"/>
                    </customer_number>
                    <name>
                        <xsl:value-of select="name"/>
                    </name>
                    <sort_name>
                        <xsl:value-of select="substring (name,0, 10 )"/>
                    </sort_name>
                    <address1>
                        <xsl:value-of select="address1"/>
                    </address1>
                    <address2>
                        <xsl:value-of select="address2"/>
                    </address2>
                    <city>
                        <xsl:value-of select="city"/>
                    </city>
                    <state>
                        <xsl:value-of select="state"/>
                    </state>
                    <zip>
                        <xsl:value-of select="zip"/>
                    </zip>
                    <phone>
                        <xsl:value-of select="phone"/>
                    </phone>
                    <loyality_id>
                        <xsl:value-of select="loyality_id"/>
                    </loyality_id>
                </customer>
            </xsl:for-each>
        </customers>
    </xsl:template>
</xsl:stylesheet>

