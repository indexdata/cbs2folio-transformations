<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:message>Info: Processing file </xsl:message>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="record">
        <xsl:variable name="ppn" select="metadata/datafield[@tag='003@']/subfield[@code='0']"/>
        <xsl:variable name="file" select="concat('dir-',substring($ppn,8,2),'/dir-',substring($ppn,6,4),'/ppn-',$ppn,'.xml')"/>
        <xsl:message>Info: Writing to &apos;<xsl:value-of select="$file"/>&apos;</xsl:message>
        <xsl:result-document href="{$file}">
            <collection count="1">
                <xsl:copy-of select="."/>
            </collection>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="text()"/>
    
</xsl:stylesheet>