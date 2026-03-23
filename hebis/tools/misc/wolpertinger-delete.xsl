<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    
    <xsl:template match="/collection">
        <collection>
            <xsl:apply-templates/>
        </collection>
    </xsl:template>
    
    <xsl:template match="record[delete]"/> <!-- no delete -->
    
    <xsl:template match="record">
        <xsl:variable name="currentrecord" select="."/> <!-- 003H Primäre Hebis-PPN -->
        <xsl:variable name="hebppns" select="metadata/datafield[@tag='003H']/subfield[@code='0']|metadata/datafield[@tag='006H']/subfield[@code='0']"/>
        <xsl:variable name="hebppns-dist" select="distinct-values($hebppns)"/>
        <xsl:for-each select="$hebppns-dist">
            <record>
                <status>deleted</status>
                <hrid><xsl:value-of select="."/></hrid>
            </record>
        </xsl:for-each>
    </xsl:template>
   
  
</xsl:stylesheet>
