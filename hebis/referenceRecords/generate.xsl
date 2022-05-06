<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
 
    <xsl:template match="xsl:when[ancestor::xsl:template/@match!='contributorTypeId']"> <!-- contributorTypeId is a closed list with marcrelator -->
            <xsl:variable name="text" select='substring-before(substring-after(@test,"&apos;"),"&apos;")'/>
            <xsl:variable name="pos"><xsl:number format="001"/></xsl:variable>
            <xsl:result-document href="{concat('referenceRecords/',tokenize(base-uri(),'/|\.')[last()-1],'/',ancestor::xsl:template/@match,'/',$pos,'--',replace(substring($text,1,20),'[^a-zA-Z0-9]','_'),'--',.,'.json')}">
                <xsl:text>{&#13;</xsl:text>
                    <xsl:text>  "id": "</xsl:text><xsl:value-of select="."/><xsl:text>",&#13;</xsl:text>
                    <xsl:text>  "name": "</xsl:text><xsl:value-of select="$text"/><xsl:text>",&#13;</xsl:text>
                    <xsl:text>  "source": "hebis"&#13;</xsl:text>
                <xsl:text>}&#13;</xsl:text>
            </xsl:result-document>
        </xsl:template>
        
        <xsl:template match="text()"/>
</xsl:stylesheet>
