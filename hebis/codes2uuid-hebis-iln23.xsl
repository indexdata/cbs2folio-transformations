<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 23 UB Kassel -->
  <!-- Map locations (codes2uuid-hebis-iln23.xsl)
       the IDs are the location names in FOLIO, generated from 209A $f and other pica fields -->

  <xsl:template match="permanentLocationId"> <!-- ILN -->
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='DUMMY'">6276b77c-d3fc-419e-a968-776b8e24657c</xsl:when>
        <xsl:when test=".='ABT021FREIHAND'">TBD</xsl:when>
        <xsl:when test=".='INST024'">fb64e20a-3822-4035-bcaa-a17296780b17</xsl:when>
        <xsl:when test=".='L4EG'">bcd7cdc8-599b-4d1d-aec7-e13808f34c80</xsl:when>

        <xsl:otherwise>5017a025-9055-41cf-9466-5c2ea4e207f0</xsl:otherwise> <!-- UNDEF -->
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <!-- ILN 8: 6 nicht genutzt + 7 als Sonderfall = im LBS3-OUS nur manuell in Bandsatz eingetragen -->
  <xsl:template match="permanentLoanTypeId"> <!-- ILN -->
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='0 u Ausleihbar'"><xsl:text>2b94c631-fca9-4892-a730-03ee529ffe27</xsl:text></xsl:when> 
        <xsl:when test=".='1 b Kurzausleihe'"><xsl:text>bb0ce7c4-ed32-4a12-8c33-275c3f3cb6de</xsl:text></xsl:when>
        <xsl:when test=".='2 c Lehrbuchsammlungsausleihe'"><xsl:text>0da2c71c-7433-41ce-8271-7be3317c0d83</xsl:text></xsl:when>
        <xsl:when test=".='3 s Präsenzbestand'"><xsl:text>f77564f5-f8de-4c21-8aea-c3bc40cf37e6</xsl:text></xsl:when>
        <xsl:when test=".='4 d Passive Fernleihe'"><xsl:text>7437cc4a-a4ff-4cab-9958-ab953a10ed19</xsl:text></xsl:when>
        <xsl:when test=".='5 i Nur für den Lesesaal'"><xsl:text>2e48e713-17f3-4c13-a9f8-23845bb210a4</xsl:text></xsl:when>
        <!-- <xsl:when test=".='6 f nur Kopie möglich'"><xsl:text>???</xsl:text></xsl:when> -->
        <xsl:when test=".='7 x Semesterausleihe'"><xsl:text>f3328220-a786-4f4b-aee6-24fe587c3187</xsl:text></xsl:when>
        <xsl:when test=".='8 e Vermisst'"><xsl:text>03919ca9-83ae-4518-8234-291e0d948f75</xsl:text></xsl:when>
        <xsl:when test=".='9 a Zur Erwerbung bestellt'"><xsl:text>baaae2f6-229f-49cb-a190-b4f0a6ac868a</xsl:text></xsl:when>
        <xsl:when test=".='9 g Nicht ausleihbar'"><xsl:text>60cc511f-89b2-4ea3-89d2-1469920d4d3f</xsl:text></xsl:when>
        <xsl:when test=".='9 o Ausleihstatus unbekannt'"><xsl:text>83f8945f-b64c-4a72-aa93-342108989345</xsl:text></xsl:when>
        <xsl:when test=".='9 z Verlust'"><xsl:text>c757bcfc-09da-4299-a038-c3c366686d87</xsl:text></xsl:when>
        <!-- <xsl:otherwise>2b94c631-fca9-4892-a730-03ee529ffe27</xsl:otherwise> <! 0 u normal ausleihbar -->
        <xsl:otherwise>83f8945f-b64c-4a72-aa93-342108989345</xsl:otherwise> <!-- 9 o Ausleihstatus unbekannt -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <!-- Map statistical code ids -->
  <xsl:template match="statisticalCodeIds"> <!-- ILN -->
    <statisticalCodeIds>
      <arr>
        <xsl:for-each select="arr/i">
          <i>
            <xsl:choose>
              <xsl:when test=".='1001'">TBD</xsl:when>
              <!-- add as needed -->
              
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

</xsl:stylesheet>
