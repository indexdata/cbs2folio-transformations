<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

    <xsl:template match="dataExportXML">
        <xsl:element name="collection">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="record">
        <xsl:element name="record">
            <xsl:element name="hrid"><xsl:value-of select="tag[@id='003@']/sbf[@id='0']"/></xsl:element>
            <xsl:element name="metadata">
                <xsl:for-each select="tag[starts-with(@id,'0')]"><xsl:apply-templates select="."/></xsl:for-each>
                <xsl:element name="item" ><xsl:attribute name="epn"><xsl:value-of select="tag[starts-with(@id,'203@')]/sbf[@id='0']"/></xsl:attribute>
                <xsl:for-each select="tag[starts-with(@id,'1') or starts-with(@id,'2')]"><xsl:apply-templates select="."/></xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tag">
        <xsl:element name="datafield">
            <xsl:attribute name="tag">
                <xsl:choose>
                    <xsl:when test="contains(@id,'/')"><xsl:value-of select="substring-before(@id,'/')"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="@id"/></xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:if test="contains(@id,'/')"><xsl:attribute name="occurrence"><xsl:value-of select="substring-after(@id,'/')"/></xsl:attribute></xsl:if>
            <xsl:attribute name="fulltag">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="sbf">
        <xsl:element name="subfield">
            <xsl:attribute name="code">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
