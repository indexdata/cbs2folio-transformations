<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8"/>
    
    <xsl:template match="*[matches(.,'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')]">
        <xsl:value-of select="."/><xsl:text>;</xsl:text>
        <xsl:text>&apos;</xsl:text><xsl:value-of select="ancestor::xsl:template/@match"/><xsl:text>&apos;;</xsl:text>
        <xsl:value-of select="substring-after(./@test,'.=')"/>
        <xsl:text>&#13;</xsl:text>
    </xsl:template>
    
    <xsl:template match="text()"/>

</xsl:stylesheet>