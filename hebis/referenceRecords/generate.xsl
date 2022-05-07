<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:variable name="xsl-name-liste" select="('itemNoteTypeId','materialTypeId','identifierTypeId','sourceId','permanentLoanTypeId')"/>
    <xsl:variable name="api-name-liste" select="('item-note-types','material-types','identifier-types','holdings-sources','loan-types')"/>
    <xsl:variable name="source-name-liste" select="('hebis','hebis','K10plus','hebis','local')"/>
 
    <xsl:template match="xsl:when[index-of($xsl-name-liste,ancestor::xsl:template/@match)>0 and xsl:text]">
            <xsl:variable name="text" select='substring-before(substring-after(@test,"&apos;"),"&apos;")'/>
            <xsl:variable name="pos"><xsl:number format="001"/></xsl:variable>
            <xsl:variable name="i" select="index-of($xsl-name-liste,ancestor::xsl:template/@match)"/>
            <xsl:result-document href="{concat('referenceRecords/',tokenize(base-uri(),'/|\.')[last()-1],'/',$api-name-liste[$i],'/',$pos,'--',replace(substring($text,1,20),'[^a-zA-Z0-9]','_'),'--',.,'.json')}">
                <xsl:text>{&#10;</xsl:text>
                    <xsl:text>  "id": "</xsl:text><xsl:value-of select="."/><xsl:text>",&#10;</xsl:text>
                    <xsl:message><xsl:value-of select="."/></xsl:message>
                    <xsl:text>  "name": "</xsl:text><xsl:value-of select="$text"/><xsl:text>",&#10;</xsl:text>
                    <xsl:text>  "source": "</xsl:text><xsl:value-of select="$source-name-liste[$i]"/><xsl:text>"&#10;</xsl:text>
                <xsl:text>}&#10;</xsl:text>
            </xsl:result-document>
        </xsl:template>
        
        <xsl:template match="text()"/>
</xsl:stylesheet>
