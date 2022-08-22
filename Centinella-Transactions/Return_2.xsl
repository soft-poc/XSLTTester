<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output encoding="utf-8" indent="no" method="xml"/>
        <!-- Create variable reference to node sets  -->
        <xsl:variable name="CreditMemoNodeSet" select="/SalesCredit/result/records[type='CreditMemo']"/>
        <xsl:variable name="CreditMemolineNodeSet" select="/SalesCredit/result/records[type='CreditMemoLine']"/>
        <xsl:variable name="ProductNodeSet" select="/SalesCredit/result/records[type='Product2']"/>
        <xsl:variable name="InvoiceNodeSet" select="/SalesCredit/queryResponse[result/records/type='Invoice']"/>
        <xsl:variable name="TotalGiftAmount" select="sum($InvoiceNodeSet/paymentsummary/records[Type='Unknown']/AuthorizationAmount)"/>
        <xsl:variable name="TotalCreditAmount" select="sum($InvoiceNodeSet/paymentsummary/records[Type='Visa']/CapturedAmount)"/>
        <xsl:variable name="InvoiceTotalWithTax" select="$InvoiceNodeSet/TotalAmountWithTax"/>
        <xsl:template match="/">
            <transactions>
                <invoices>
                    <xsl:for-each select="/SalesCredit/result/records[type='CreditMemo']">
                        <xsl:variable name="created_date" select="substring-before(CreatedDate,'T')"/>
                        <xsl:variable name="year" select="substring-before($created_date, '-')"/>
                        <xsl:variable name="month" select="substring-before(substring-after($created_date, '-'), '-')"/>
                        <xsl:variable name="day" select="substring-after(substring-after($created_date, '-'), '-')"/>
                        <xsl:variable name="created_time" select="substring-after(CreatedDate,'T')"/>
                        <xsl:variable name="hour" select="substring-before($created_time, ':')"/>
                        <xsl:variable name="minute" select="substring-before(substring-after($created_time, ':'), ':')"/>
                        <xsl:variable name="second" select="substring-before(substring-after(substring-after($created_time, ':'), ':'),'.')"/>
                        <xsl:variable name="CustomerNumber" select="$InvoiceNodeSet/BillingAccount/epicorCustomerNumber__c"/>
                        <xsl:variable name="LoyalityId" select="BillingAccount/loyaltyID__c"/>
                        <invoice>
                            <header>
                                <TransactionDate>
                                    <xsl:value-of select="$month"/>
                                    <xsl:value-of select="$day"/>
                                    <xsl:value-of select="$year"/>
                                </TransactionDate>
                                <TransactionTime>
                                    <xsl:value-of select="$hour"/>
                                    <xsl:value-of select="$minute"/>
                                    <xsl:value-of select="$second"/>
                                </TransactionTime>
                                <StoreNumber>
                                    <xsl:value-of select="substring-after($InvoiceNodeSet/result/records/FulfillmentOrders/records/FulfilledFromLocation/ExternalReference, '-')"/>
                                </StoreNumber>
                                <CustomerNumber>
                                    <xsl:choose>
                                        <xsl:when test="$CustomerNumber!=''">
                                            <xsl:value-of select="$CustomerNumber"/>
                                        </xsl:when>
                                        <xsl:otherwise>710000</xsl:otherwise>
                                    </xsl:choose>
                                </CustomerNumber>
                                <JobNumber/>
                                <TaxCode>WEB</TaxCode>
                                <SalesTaxRate/>
                                <PricingIndicator/>
                                <PricingPercent/>
                                <Clerk/>
                                <PurchaseOrderNumber/>
                                <TransactionTotal>
                                    <xsl:value-of select="translate(concat(format-number($CreditMemoNodeSet/TotalAmountWithTax, '0000000.00'),'+'),'.','')"/>
                                </TransactionTotal>
                                <SaleTaxable/>
                                <SalespersonNumber>5</SalespersonNumber>
                                <TotalSalesTax>
                                    <xsl:value-of select="translate(concat(format-number($CreditMemoNodeSet/TotalTaxAmount, '0000000.00'),'+'),'.','')"/>
                                </TotalSalesTax>
                                <unused/>
                                <Instructions1/>
                                <Instructions2/>
                                <Ship-ToName>
                                    <xsl:choose>
                                        <xsl:when test="string-length($InvoiceNodeSet/shipments/records/ShipToName)>29">
                                            <xsl:value-of select="substring($InvoiceNodeSet/shipments/records/ShipToName,1,29)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$InvoiceNodeSet/shipments/records/ShipToName"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </Ship-ToName>
                                <Ship-ToAddress1>
                                    <xsl:choose>
                                        <xsl:when test="string-length($InvoiceNodeSet/shipments/records/ShipToAddress/street)>29">
                                            <xsl:value-of select="substring($InvoiceNodeSet/shipments/records/ShipToAddress/street,1,29)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$InvoiceNodeSet/shipments/records/ShipToAddress/street"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </Ship-ToAddress1>
                                <Ship-ToAddress2>
                                    <xsl:variable name="shipping_add2" select="concat($InvoiceNodeSet/shipments/records/ShipToAddress/city,',',$InvoiceNodeSet/shipments/records/ShipToAddress/state)"/>
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
                                    <xsl:variable name="shipping_add3" select="concat($InvoiceNodeSet/shipments/records/ShipToAddress/postalCode,',',$InvoiceNodeSet/shipments/records/ShipToAddress/country)"/>
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
                                    <xsl:value-of select="$InvoiceNodeSet/result/records/ReferenceEntity/Name"/>
                                </ReferenceInformation>
                                <CustomerTelephone>
                                    <xsl:value-of select="$InvoiceNodeSet/result/records/BillingAccount/Phone"/>
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
                                    <xsl:value-of select="$InvoiceNodeSet/result/records/FulfillmentOrders/records/DeliveryMethod/Name"/>
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
                                <LoyalityId/>
                            </header>
                            <tender>
                                <Alt1Tender/>
                                <Alt1TenderReference/>
                                <Alt2Tender/>
                                <Alt2TenderReference/>
                                <Alt3Tender>
                                    <xsl:if test="$TotalCreditAmount!=0">
                                        <xsl:choose>
                                            <xsl:when test="Invoice_covers_total_amount__c='false'">
                                                <xsl:value-of select="translate(concat(format-number($InvoiceTotalWithTax - $TotalGiftAmount, '0000000.00'),'+'),'.','')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="translate(concat(format-number($TotalCreditAmount - $TotalGiftAmount, '0000000.00'),'+'),'.','')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </Alt3Tender>
                                <Alt3TenderReference/>
                                <Alt4Tender/>
                                <Alt4TenderReference/>
                                <Alt5Tender>
                                    <xsl:if test="$TotalGiftAmount!=0">
                                        <xsl:value-of select="translate(concat(format-number($TotalGiftAmount, '0000000.00'),'+'),'.','')"/>
                                    </xsl:if>
                                </Alt5Tender>
                                <Alt5TenderReference/>
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
                            <cards>
                                <xsl:for-each select="$InvoiceNodeSet/cards/records">
                                    <xsl:variable name="PaymentMId" select="Id"/>
                                    <xsl:if test="$InvoiceNodeSet/paymentsummary/records[PaymentMethodId=$PaymentMId]/Type='Unknown'">
                                        <card>
                                            <CardTransactionType>2</CardTransactionType>
                                            <CardType>1</CardType>
                                            <CardNumber>
                                                <xsl:value-of select="format-number(Gift_Certificate_Number__c, '0000000000000000')"/>
                                            </CardNumber>
                                            <CardTransactionAmount>
                                                <xsl:value-of select="translate(concat(format-number($InvoiceNodeSet/paymentsummary/records[PaymentMethodId=$PaymentMId]/AuthorizationAmount, '0000000.00'),'+'),'.','')"/>
                                            </CardTransactionAmount>
                                            <RebateId/>
                                            <RebateDescription/>
                                            <BankCardType/>
                                            <BankCardAuthcode/>
                                            <Filler/>
                                        </card>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="$InvoiceNodeSet/result/records/InvoiceLines/records[Gift_Certificate_Number__c!='']">
                                    <xsl:if test="(Type!='Tax') and (Type!='Adjustment')">
                                        <card>
                                            <CardTransactionType>1</CardTransactionType>
                                            <CardType>1</CardType>
                                            <CardNumber>
                                                <xsl:value-of select="format-number(Gift_Certificate_Number__c, '0000000000000000')"/>
                                            </CardNumber>
                                            <CardTransactionAmount>
                                                <xsl:value-of select="translate(concat(format-number(LineAmount, '0000000.00'),'+'),'.','')"/>
                                            </CardTransactionAmount>
                                            <RebateId/>
                                            <RebateDescription/>
                                            <BankCardType/>
                                            <BankCardAuthcode/>
                                            <Filler/>
                                        </card>
                                    </xsl:if>
                                </xsl:for-each>
                            </cards>
                            <lines>
                                <xsl:for-each select="$InvoiceNodeSet/result/records/InvoiceLines/records">
                                    <xsl:variable name="ProductCode" select="Product2/ProductCode"/>
                                    <xsl:if test="(Type!='Tax')">
                                        <xsl:if test="(LineAmount>0) and (Type!='Adjustment') ">
                                            <line>
                                                <SKU>
                                                    <xsl:choose>
                                                        <xsl:when test="ReferenceEntityItemType='Delivery Charge' and ReferenceEntityItemTypeCode='Charge'">SHIP</xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:choose>
                                                                <xsl:when test="string-length($ProductCode)>14">
                                                                    <xsl:if test="$ProductCode='eGiftCertificate'">GC</xsl:if>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="$ProductCode"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
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
                                                    <xsl:variable name="AdjustedAmount" select="sum(/records/InvoiceLines/records[Product2/ProductCode=$ProductCode]/LineAmount[../Type='Adjustment'])"/>
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
                                        <xsl:if test="Type='Adjustment'">
                                            <xsl:variable name="AdjustedAmount" select="sum($InvoiceNodeSet/result/records/InvoiceLines/records[Product2/ProductCode=$ProductCode]/LineAmount)"/>
                                            <line>
                                                <SKU>WEBDISCOUNT</SKU>
                                                <ItemTransactionType>R</ItemTransactionType>
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
                                                    <xsl:choose>
                                                        <xsl:when test="Quantity!=''">
                                                            <xsl:value-of select="translate(format-number(Quantity, '00000.000'),'.','')"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="translate(format-number(1.0, '00000.000'),'.','')"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </Quantity>
                                                <UnitPrice>
                                                    <xsl:choose>
                                                        <xsl:when test="UnitPrice!=''">
                                                            <xsl:value-of select="translate(format-number(UnitPrice, '00000.000'),'.','')"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="translate(format-number(substring($AdjustedAmount,2), '00000.000'),'.','')"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </UnitPrice>
                                                <ExtendedPrice>
                                                    <xsl:value-of select="translate(format-number(substring($AdjustedAmount,2), '000000.00'),'.','')"/>
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
                                    </xsl:if>
                                </xsl:for-each>
                            </lines>
                        </invoice>
                    </xsl:for-each>
                </invoices>
            </transactions>
        </xsl:template>
    </xsl:stylesheet>