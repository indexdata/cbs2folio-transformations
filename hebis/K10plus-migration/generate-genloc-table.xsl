<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
 
    <xsl:variable name="abfrage">$abt=&apos;</xsl:variable>
    <xsl:variable name="apos">&apos;</xsl:variable>
 
    <!-- Generates location file for Genloc, input is k10plus-swb-ub-mainz.xsl -->
 
    <xsl:template match="xsl:template[@name='permanentLocationId']">
        <xsl:variable name="liste">
            <xsl:apply-templates mode="permanentlocation"/>
            <row><code>AUFSATZ</code><sigel>DE-77</sigel></row>
            <row><code>ONLINE</code><sigel>DE-77</sigel></row>
        </xsl:variable>
        <xsl:variable name="codes2uuid" select="document('../codes2uuid-hebis-iln25.xsl')//xsl:template[@match='permanentLocationId|temporaryLocationId']"/>
        <xsl:result-document href="{'effectiveLocationID_mapping.json'}">
            <xsl:text>{&#10;</xsl:text>
            <xsl:for-each select="$liste/row[code!='UNKNOWN']">
                <xsl:variable name="ausdruck"><xsl:text>.=&apos;</xsl:text><xsl:value-of select="code"/><xsl:text>&apos;</xsl:text></xsl:variable>
                 <xsl:text>  "</xsl:text><xsl:value-of select="$codes2uuid//xsl:when[@test=$ausdruck]"/><xsl:text>": "</xsl:text><xsl:value-of select="sigel"/><xsl:text>",&#10;</xsl:text>
            </xsl:for-each>
            <xsl:text>  "8334fb6b-013b-4ad4-9d58-7710f82edb50": "DE-77",&#10;</xsl:text>
            <xsl:text>  "Default": "DE-77"&#10;</xsl:text>
            <xsl:text>}&#10;</xsl:text>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="xsl:when[starts-with(@test,$abfrage)]" mode="permanentlocation">
        <xsl:variable name="sigel" select="concat('DE-',translate(substring-before(substring-after(@test,$abfrage),$apos),'/ ','-'))"/>
        <xsl:for-each select="descendant-or-self::xsl:when[not(element())]|descendant-or-self::xsl:otherwise[not(element())]">
            <row><code><xsl:value-of select="."/></code><sigel><xsl:value-of select="$sigel"/></sigel></row>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="text()" mode="#all"/>
</xsl:stylesheet>