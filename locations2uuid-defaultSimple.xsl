<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:key name="original" match="record/original/item" use="@epn"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Map locations -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>       
        <permanentLocationId>
            <xsl:choose>
                <!-- Online -->
                <xsl:when test="$electronicholding='O'">25a12084-ef35-4cb8-9511-a7c530cd5486</xsl:when>
                <!-- All the rest -->
                <xsl:otherwise>afb3cd61-e48f-4519-abb1-1af6f67be4a3</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>
