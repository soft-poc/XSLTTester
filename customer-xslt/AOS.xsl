 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
<xsl:variable name="lookups" select="/items"/>
        <xsl:variable name="product_code" select="'BFBUNDLE'"/>
        <xsl:variable name="BundleDetails" select="$lookups/item[sku=$product_code]/ItemGroupDetail" />
        <xsl:if test="$BundleDetails">
     "ItemGroupDetail": {
                    "ItemGroupLine": [
            <xsl:for-each select="$BundleDetails/ItemGroupLine">
                 {
                            "ItemRef": {
                                "value": "<xsl:value-of select='ItemRef'/>",
                                "name": "<xsl:value-of select='ItemRef/@name'/>",
                                "type": "<xsl:value-of select='ItemRef/@type'/>"
                            },
                            "Qty": <xsl:value-of select='Qty'/>
                        },
            </xsl:for-each>
            ]
            }
        </xsl:if>

       </xsl:template>
    </xsl:stylesheet>