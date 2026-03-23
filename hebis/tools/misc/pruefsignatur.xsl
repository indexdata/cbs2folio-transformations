<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>

<!-- 

    Skript für den Abgleich der Signaturangaben innerhalb der Holdings
    Für die Input-Datei mit PPNs wird folgendes Format erwartet:
    <root>
        <i>12345678</i>
        <i>90123456</i>
        ...
    </root>
    
    oder auch:
    
    <root>
        <row>
            <i>12345678</i>
            ...
        </row>
        <row>
            <i>90123456</i>
            ...
        </row>
        ...
     </root>
    
    Nur die Namen der <i>-Elemente sind dabei festgelegt. Output sind die auffälligen PPNs und Signaturen als Liste in Textform. Im Error-Kanal wird jede PPN geloggt.
    
    Als Prozessor wird ein neuerer Saxon empfohlen (XSLT 2.0).
    
    -->

    <xsl:template match="/">
        <xsl:apply-templates select="//i"/>
    </xsl:template>

    <xsl:template match="i">
        <xsl:variable name="ppn" select="."/>
        <xsl:message><xsl:number level="any" count="i"/> : <xsl:value-of select="$ppn"
            /></xsl:message>
        <xsl:variable name="url"
            select="concat('https://folio-api.ub.uni-mainz.de/sru-ubmz-prod/ubmz?version=1.1&amp;operation=searchRetrieve&amp;query=hrid==',.,'&amp;maximumRecords=1&amp;recordSchema=raw')"/>
        <xsl:variable name="sru">
            <xsl:copy-of select="document($url)"/>
        </xsl:variable>
        <xsl:for-each select="$sru//holdingsRecords2">
            <xsl:variable name="signaturliste" as="xs:string *">
                <xsl:for-each select=".//effectiveCallNumberComponents">
                    <xsl:sequence select="string-join((prefix, callNumber, suffix), ' ')"/>
                </xsl:for-each>
                <xsl:sequence
                    select="string-join((callNumberPrefix, callNumber, callNumberSuffix), ' ')"/>
            </xsl:variable>
            <xsl:if test="count(distinct-values($signaturliste)) != 1">
                <xsl:message>
                    <xsl:text>--- Problem: </xsl:text>
                    <xsl:value-of
                        select="concat($ppn, ':', string-join(distinct-values($signaturliste), ', '))"
                    />
                </xsl:message>
                <xsl:value-of
                    select="concat($ppn, ':', string-join(distinct-values($signaturliste), ', '), '&#10;')"
                />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
