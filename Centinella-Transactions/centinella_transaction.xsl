<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output encoding="utf-8" indent="no" method="xml"/>
        <xsl:template match="/">

       <xsl:variable name="TotalGiftAmount" select="sum(/paymentsummary/records[Type='Unknown']/AuthorizationAmount)"/>
        <xsl:variable name="TotalCreditAmount" select="sum(/paymentsummary/records[Type='CreditCard']/AuthorizationAmount)"/>
       <xsl:variable name="PaymentSummaryCount" select="count(/queryResponse/result/records)"/>
                 <xsl:for-each select="paymentsummary/records">
                    <xsl:element name="amount">

                        <xsl:value-of select="$TotalGiftAmount"/>,
                        <xsl:value-of select="$TotalCreditAmount"/>
                    </xsl:element>
                 </xsl:for-each>
        </xsl:template>
    </xsl:stylesheet>
