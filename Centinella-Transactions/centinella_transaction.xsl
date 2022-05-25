<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output encoding="utf-8" indent="no" method="xml"/>
        <xsl:template match="/">
            <transactions>
                <invoices>
                    <xsl:for-each select="/queryResponse/result/records">
                        <xsl:variable name="created_date" select="substring-before(CreatedDate,'T')"/>
                        <xsl:variable name="year" select="substring-before($created_date, '-')"/>
                        <xsl:variable name="month" select="substring-before(substring-after($created_date, '-'), '-')"/>
                        <xsl:variable name="day" select="substring-after(substring-after($created_date, '-'), '-')"/>
                        <invoice>
                            <header>
                                <TransactionDate>
                                    <xsl:value-of select="$month"/>
                                    <xsl:value-of select="$day"/>
                                    <xsl:value-of select="$year"/>
                                </TransactionDate>
                                <TransactionTime/>
                                <StoreNumber>
                                    <xsl:value-of select="substring-after(FulfillmentOrders/records/FulfilledFromLocation/ExternalReference, '-')"/>
                                </StoreNumber>
                                <CustomerNumber>378844</CustomerNumber>
                                <JobNumber/>
                                <TaxCode>WEB</TaxCode>
                                <SalesTaxRate/>
                                <PricingIndicator/>
                                <PricingPercent/>
                                <Clerk/>
                                <PurchaseOrderNumber/>
                                <TransactionTotal>
                                    <xsl:value-of select="translate(concat(format-number(TotalAmountWithTax, '0000000.00'),'+'),'.','')"/>
                                </TransactionTotal>
                                <SaleTaxable/>
                                <SalespersonNumber>5</SalespersonNumber>
                                <TotalSalesTax>
                                    <xsl:value-of select="translate(concat(format-number(TotalTaxAmount, '0000000.00'),'+'),'.','')"/>
                                </TotalSalesTax>
                                <unused/>
                                <Instructions1/>
                                <Instructions2/>
                                <Ship-ToName>
                                    <xsl:choose>
                                        <xsl:when test="string-length(BillingAccount/Name)>29">
                                            <xsl:value-of select="substring(BillingAccount/Name,1,29)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="BillingAccount/Name"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </Ship-ToName>
                                <Ship-ToAddress1>
                                    <xsl:choose>
                                        <xsl:when test="string-length(BillingAccount/BillingAddress/street)>29">
                                            <xsl:value-of select="substring(BillingAccount/BillingAddress/street,1,29)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="BillingAccount/BillingAddress/street"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </Ship-ToAddress1>
                                <Ship-ToAddress2>
                                    <xsl:variable name="shipping_add2" select="concat(BillingAccount/BillingAddress/city,',',BillingAccount/BillingAddress/postalCode)"/>
                                    <xsl:choose>
                                        <xsl:when test="string-length($shipping_add2)>29">
                                            <xsl:value-of select="substring($shipping_add2,1,29)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$shipping_add2"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </Ship-ToAddress2>
                                <Ship-ToAddress3>
                                    <xsl:variable name="shipping_add3" select="concat(BillingAccount/BillingAddress/state,',',BillingAccount/BillingAddress/stateCode,',',BillingAccount/BillingAddress/country)"/>
                                    <xsl:choose>
                                        <xsl:when test="string-length($shipping_add3)>29">
                                            <xsl:value-of select="substring($shipping_add3,1,29)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$shipping_add3"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </Ship-ToAddress3>
                                <ReferenceInformation>
                                    <xsl:value-of select="ReferenceEntity/Name"/>
                                </ReferenceInformation>
                                <CustomerTelephone>
                                    <xsl:value-of select="BillingAccount/Phone"/>
                                </CustomerTelephone>
                                <CustomerResaleNo/>
                                <CustomerID/>
                                <SpecialOrderVendor/>
                                <TotalDeposit/>
                                <ExpectedDeliveryDate/>
                                <EstimateExpirationDate/>
                                <TerminalNumber/>
                                <TransactionNumber/>
                                <TransactionType/>
                                <TotalCashTendered/>
                                <ChangeGiven/>
                                <TotalCheckTendered/>
                                <CheckNumber/>
                                <BankcardTendered/>
                                <BankcardNumber/>
                                <ThirdPartyVendorCode/>
                                <UseESTUcostindicator/>
                                <PrivateLabelCardType/>
                                <SpecialTransactionProcessingFlag/>
                                <PrivateLabelCardPromoType/>
                                <TDXTransaction/>
                                <unsused2/>
                                <DirectShip/>
                                <TransactionCodes>
                                    <xsl:value-of select="FulfillmentOrders/records/DeliveryMethod/Name"/>
                                </TransactionCodes>
                                <ShipViaCode/>
                                <RouteNumber/>
                                <RouteDay/>
                                <RouteStop/>
                                <DeliveryTimeCode/>
                                <CalculateTradeDiscount/>
                                <RetailSalesTax/>
                                <PosShortId/>
                                <AddNIFItems/>
                                <LoyalityId>6267927758</LoyalityId>
                            </header>
                            <tender>
                                <Alt1Tender/>
                                <Alt1TenderReference/>
                                <Alt2Tender/>
                                <Alt2TenderReference/>
                                <xsl:choose>
                                    <xsl:when test="Order_Payment_Summary__r/Type='Visa'">
                                         <Alt3Tender>000000000+</Alt3Tender>
                                        <Alt3TenderReference/>
                                        <Alt4Tender/>
                                        <Alt4TenderReference/>
                                        <Alt5Tender/>
                                        <Alt5TenderReference/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <Alt3Tender/>
                                        <Alt3TenderReference/>
                                        <Alt4Tender/>
                                        <Alt4TenderReference/>
                                        <Alt5Tender>000000000+</Alt5Tender>
                                        <Alt5TenderReference/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <Alt6Tender/>
                                <Alt6TenderReference/>
                                <Alt7Tender/>
                                <Alt7TenderReference/>
                                <Alt8Tender/>
                                <Alt8TenderReference/>
                                <Alt9Tender/>
                                <Alt9TenderReference/>
                                <Alt10Tender/>
                                <Alt10TenderReference/>
                                <Filler/>
                            </tender>
                            <card>
                                <xsl:choose>
                                    <xsl:when test="Order_Payment_Summary__r/Type='Visa'">
                                        <CardTransactionType>T</CardTransactionType>
                                         <CardType>B</CardType>
                                    </xsl:when>
                                    <xsl:otherwise>
                                           <!-- 1 = Activate IDGC 2= Redeem Gift Cards, T= Type Bank card  -->
                                         <CardTransactionType>2</CardTransactionType>
                                         <CardType>1</CardType>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!-- Check for gift card and place gift card if value is coming for gift cards -->
                                <CardNumber>
                                    <xsl:value-of select="format-number(substring-after(Order_Payment_Summary__r/Method, '- '), '0000000000000000')"/>
                                </CardNumber>
                                <CardTransactionAmount>
                                    <xsl:value-of select="translate(concat(format-number(Order_Payment_Summary__r/AuthorizationAmount, '0000000.00'),'+'),'.','')"/>
                                </CardTransactionAmount>
                                <RebateId/>
                                <RebateDescription/>
                                <BankCardType>1</BankCardType>
                                <BankCardAuthcode/>
                                <Filler/>
                            </card>
                            <lines>
                                <xsl:for-each select="InvoiceLines/records">
                                    <xsl:if test="Type!='Tax'">
                                        <line>
                                            <SKU>
                                                <xsl:choose>
                                                    <xsl:when test="ReferenceEntityItemType='Delivery Charge' and ReferenceEntityItemTypeCode='Charge'">SHIP</xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="Product2/ProductCode"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </SKU>
                                            <ItemTransactionType/>
                                            <Description/>
                                            <Taxable/>
                                            <PricingFlag/>
                                            <ManualPrice/>
                                            <EstimateUseCode/>
                                            <TradeDiscount/>
                                            <DiscountPercent/>
                                            <SpecialOrderVendor/>
                                            <UnitOfMeasure/>
                                            <Quantity>
                                                <xsl:value-of select="translate(format-number(Quantity, '00000.000'),'.','')"/>
                                            </Quantity>
                                            <UnitPrice>
                                                <xsl:value-of select="translate(format-number(UnitPrice, '00000.000'),'.','')"/>
                                            </UnitPrice>
                                            <ExtendedPrice>
                                                <xsl:value-of select="translate(format-number(LineAmount, '000000.00'),'.','')"/>
                                            </ExtendedPrice>
                                            <UnitCost/>
                                            <BOMSKU/>
                                            <ReferenceNumber/>
                                            <ExtendedTaxable/>
                                            <ExtendedNon-Taxabl/>
                                            <BackorderQuantity/>
                                            <unused1/>
                                            <TermsDiscount/>
                                            <DirectShip/>
                                            <unused2/>
                                            <ExportSetID/>
                                            <AdderSKUFlag/>
                                            <MasterLoadID/>
                                            <SpecialOrderDocumentNumber/>
                                            <SpecialOrderLineNumber/>
                                            <SOType/>
                                            <Filler/>
                                        </line>
                                    </xsl:if>
                                </xsl:for-each>
                            </lines>
                        </invoice>
                    </xsl:for-each>
                </invoices>
            </transactions>
        </xsl:template>
    </xsl:stylesheet>
