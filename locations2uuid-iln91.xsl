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
                <xsl:when test="$electronicholding='O'">8e69bce1-378e-4a7d-b9b5-abf14cfdf35a</xsl:when>
                <!-- Fernleihe -->   
                <xsl:when test="$callnumberLower='fernleihe'">a13c6b25-2d01-47cf-8074-59fee6a841fb</xsl:when>
                <xsl:when test="$itemLevelCallnumberLower='fernleihe'">a13c6b25-2d01-47cf-8074-59fee6a841fb</xsl:when>
                <!-- ausgesondert -->   
                <xsl:when test="$callnumberLower='ausgesondert'">993ec32c-262f-4d44-be28-218acd10e232</xsl:when>
                <xsl:when test="$itemLevelCallnumberLower='ausgesondert'">993ec32c-262f-4d44-be28-218acd10e232</xsl:when>
                <!-- HIL Freihand (HILFH) -->
                <xsl:when test="$lower = 'z'">21ae51d9-94a4-4321-8f81-ec30c94bb337</xsl:when>
                <!-- HIL Magazin (HILMZ) -->
                <xsl:when test="$lower = 'mz'">b6977006-04a0-4f66-b12b-2b8c1c108f49</xsl:when>
                <!-- HOL Freihand (HOLFH) -->
                <xsl:when test="$lower = 'ho'">1f9862ee-c4e8-42ba-8c62-3d890d09ff4f</xsl:when>
                <!-- GOER Freihand (GOERFH) -->
                <xsl:when test="$lower = 'f'">87e0975d-38e1-4bc5-9967-25c666f49d5f</xsl:when>                
                <!-- GOEI Freihand (GOEIFH) -->
                <xsl:when test="$lower = 'n'">eccc2c82-a9b1-45f3-ba15-c19ae298fd37</xsl:when>
                <!-- GCG Freihand (GCGFH) -->
                <xsl:when test="$lower='gcg'">bb970ad6-c2a3-4bf4-a1f2-514dabadd400</xsl:when>
                <!-- Keine Zuordnung / Sonstige (SONST) --> 
                <xsl:otherwise>993ec32c-262f-4d44-be28-218acd10e232</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>