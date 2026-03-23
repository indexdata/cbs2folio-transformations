<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- ILN 108 TH Bingen -->
 
  <xsl:template match="permanentLocationId"> <!-- ILN -->
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='DUMMY'">61620ac4-7899-4a94-859e-5cb362ebb6bb</xsl:when>
        <xsl:when test=".='ONLINE'">f2a4473a-efe8-4162-a121-7c8d61fec455</xsl:when>
        <xsl:when test=".='ARCH'">b1a0428a-7683-47ab-9faf-c9fdb46aad49</xsl:when>
        <xsl:when test=".='FREI'">00ccc28b-4a1c-43fb-9101-1f4bfe3673ba</xsl:when>
        <xsl:when test=".='FB'">d11f081b-14eb-47d7-8cce-bce59636fb35</xsl:when>
        <xsl:when test=".='KP'">a9c7dc2c-9404-4514-877a-54f3f73e99a6</xsl:when>
        <xsl:when test=".='RARA'">009c050c-b4ab-4991-b30f-65959e636414</xsl:when>
        <xsl:when test=".='VW'">cbcdd2e1-ef2f-48a4-8729-18298a13ede8</xsl:when>
        <xsl:when test=".='NZ'">f21fabca-a4e6-46fb-a761-b97969c35c09</xsl:when>
        <xsl:otherwise>f21fabca-a4e6-46fb-a761-b97969c35c09</xsl:otherwise> <!-- NZ -->
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <xsl:template match="permanentLoanTypeId"> <!-- ILN -->
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='u ausleihbar'"><xsl:text>7957aeb7-a7ef-4e6f-911c-607b5fc5384e</xsl:text></xsl:when> 
        <xsl:when test=".='s Präsenzbestand'"><xsl:text>b3e00274-cc17-413c-a6ba-c3ddf816c14f</xsl:text></xsl:when>
        <xsl:when test=".='d Zustimmung Wochenendausleihe'"><xsl:text>76d6f2ba-46b8-49b8-83d6-d232a978d1ca</xsl:text></xsl:when>
        <xsl:when test=".='i nur für den Lesesaal'"><xsl:text>52a32f70-978e-4a66-9eeb-bccdf9c081bc</xsl:text></xsl:when>
        <xsl:when test=".='e vermisst'"><xsl:text>a86b5d31-84c1-4cde-8237-337f3267c9e9</xsl:text></xsl:when>
        <xsl:when test=".='g nicht ausleihbar'"><xsl:text>c7fe3ab7-e05c-405b-8699-fbea519e2bad</xsl:text></xsl:when>
        <xsl:when test=".='z Verlust'"><xsl:text>f0f0114d-09a3-4785-b9ca-93d2f3c47bda</xsl:text></xsl:when>
        <xsl:when test=".='dummy'"><xsl:text>009be487-b93d-47e1-acde-eab43ea5fe33</xsl:text></xsl:when>
        <xsl:when test=".='unbekannt'"><xsl:text>a2ce67e6-798d-4420-94f4-3adc2cb5c6a4</xsl:text></xsl:when>        
        <xsl:otherwise>a2ce67e6-798d-4420-94f4-3adc2cb5c6a4</xsl:otherwise> <!-- unbekannt -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>
 
   <!-- Map identifier types -->
  <xsl:template match="identifierTypeId"> <!-- additional RLP -->
    <identifierTypeId>
      <xsl:choose>
        <xsl:when test=".='PPN-K10plus'"><xsl:text>98e4039e-adfe-405f-b763-c642765269df</xsl:text></xsl:when>
        <xsl:when test=".='PPN-Hebis'"><xsl:text>be3a2669-391d-4027-b023-1092a61ac631</xsl:text></xsl:when>
        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
      </xsl:choose>
    </identifierTypeId>
  </xsl:template>

  <!-- Map statistical code ids -->
  <xsl:template match="statisticalCodeIds"> <!-- additional RLP --> <!-- TBD: generate -->
    <statisticalCodeIds>
      <arr>
        <xsl:for-each select="arr/i">
          <i>
            <xsl:choose>
              <xsl:when test=".='Dublettenbereinigung'">812aef7b-f026-449e-8976-31883ad95d1b</xsl:when>
              <xsl:when test=".='ZDB-Titel-mit-Mono-EPN'">73abd902-87c7-4bad-bdfe-25cbc06b6e63</xsl:when>
              <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>
 
  <!-- Map holding note types -->
  <xsl:template match="holdingsNoteTypeId"> <!-- Level 2: FOLIO/hebis-wide -->
    <holdingsNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Abrufzeichen'"><xsl:text>6d3f575d-6727-42a4-ae58-56c00de2e1d4</xsl:text></xsl:when>        
        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
      </xsl:choose>
    </holdingsNoteTypeId>
  </xsl:template>
 
</xsl:stylesheet>
