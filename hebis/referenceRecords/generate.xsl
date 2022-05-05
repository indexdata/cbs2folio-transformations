<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>[&#13;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]&#13;</xsl:text>
    </xsl:template>

    
    <xsl:template match="xsl:when | xsl:otherwise">
            <xsl:message><xsl:value-of select="."/></xsl:message>
            <xsl:text>{&#13;</xsl:text>
                <xsl:text>  "id": "</xsl:text><xsl:value-of select="."/><xsl:text>",&#13;</xsl:text>
                <xsl:text>  "name": "</xsl:text><xsl:value-of select='substring-before(substring-after(@test,"&apos;"),"&apos;")'></xsl:value-of><xsl:text>",&#13;</xsl:text>
                <xsl:text>  "source": "hebis"&#13;</xsl:text>
            <xsl:text>},&#13;</xsl:text>
        </xsl:template>
        
        <xsl:template match="text()"/>
</xsl:stylesheet>
