<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Map locations -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
        <xsl:variable name="callnumber" select="string(../callNumber)"/>
        <xsl:variable name="itemLevelCallnumber" select="string(../itemLevelCallNumber)"/>
        <xsl:variable name="callnumberLower" select="lower-case(normalize-space($callnumber))"/>
        <xsl:variable name="itemLevelCallnumberLower" select="lower-case(normalize-space($itemLevelCallnumber))"/>
        <xsl:variable name="lower" select="lower-case(normalize-space(.))"/>
        <!-- xsl:variable name="lower" select="lower-case(.)"/>
	    <xsl:variable name="callnumber" select="../callNumber"/>
        <xsl:variable name="itemLevelCallnumber" select="../itemLevelCallNumber"/>
        <xsl:variable name="callnumberLower" select="lower-case($callnumber)"/> 
        <xsl:variable name="itemLevelCallnumberLower" select="lower-case($itemLevelCallnumber)"/ --> 

        <permanentLocationId>
            <xsl:choose>
                <!-- Online -->
                <xsl:when test="$electronicholding='O'">a4a8d22a-2529-4425-b732-97a3e1cd52cd</xsl:when>
                <!-- Magazin, kein $f -->
                <xsl:when test=".=''">4eebee1e-61ab-4284-87d8-f1fc7183fc24</xsl:when>
                <!-- Fernleihe -->
                <xsl:when test="$lower = 'fl'">780e8161-2232-4cf2-9bf6-59a39c74bfe5</xsl:when>
                <!-- Bibliografischer Block -->
                <xsl:when test="$lower = 'bb'">69916a8d-caf4-45aa-aa7b-c5c7c2c918ec</xsl:when>
                <!-- Freihand -->
                <xsl:when test="$lower = 'fh'">174a5ef6-1408-4a0e-8036-e4371c668d78</xsl:when>
                <!-- Lehrbuchsammlung -->
                <xsl:when test="$lower = 'lbs'">9be1adba-9ef1-47e6-8882-77346289b3ce</xsl:when>                
                <!-- Lesesaal -->
                <xsl:when test="$lower = 'ls'">481bb5b8-1434-476d-b55e-dd935a10f0c5</xsl:when>
                <!-- Lesesaal + Lehrbuchsammlung -->
                <xsl:when test="$lower='ls+lbs'">6d1a8d1e-4f38-4d32-9614-54f812e2b015</xsl:when>
                <!-- Keine Zuordnung / Sonstiges --> 
                <xsl:otherwise>3b7fd3c5-20ca-4b4c-870c-6cab4b8c6624</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>