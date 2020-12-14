<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Map locations 
       NOTE: The tests are the codes returned by 209A $f, not the location names in FOLIO -->
   <xsl:template match="permanentLocationId">
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='ZS-Lesesaal'">7f9cbae3-4831-45ed-9fb5-bdcc30544c18</xsl:when>
        <xsl:when test=".='Magazin'">158e56a0-92f7-4c29-9630-ea134483dbb8</xsl:when>
        <xsl:when test=".='Mediathek'">11d9bb9b-fe63-4159-965f-e1ba26f6850a</xsl:when>
        <xsl:when test=".='Handschr.-LS'">31ac6d7e-4a9a-469b-b7a4-18c99c9ba87a</xsl:when>
        <xsl:when test=".='Zentrale Leihtheke'">48e979f0-b637-4dbb-b818-e03b6ef8c58b</xsl:when>
        <xsl:when test=".='Freihandbereich 1'">5ecf63c1-c76e-4896-aaf2-8a97ab9f032c</xsl:when>
        <xsl:when test=".='BB WiWi'">fa1d4d42-a872-4e5f-9346-d2840421060d</xsl:when>
        <xsl:when test=".='TB BHV'">c19004fc-6c68-4de4-8d23-f5788a6567d1</xsl:when>
		<xsl:when test=".[contains(.,'geloescht')]">2f84ae67-bd38-4546-a0bb-256d7a1b7ef6</xsl:when>
		<xsl:when test=".='Online'">58a36dce-7dae-4bc4-8edb-3e8b8f8e44cd</xsl:when>
		<xsl:otherwise>48e979f0-b637-4dbb-b818-e03b6ef8c58b</xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>
</xsl:stylesheet>
