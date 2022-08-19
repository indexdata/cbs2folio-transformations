<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 204 UB Giessen -->
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
        <xsl:when test=".='0 u Ausleihbar'"><xsl:text>ecfbf446-421a-4a46-8e06-3e1e36d5b317</xsl:text></xsl:when> 
        <xsl:when test=".='1 b Kurzausleihe'"><xsl:text>03db4452-a270-4e03-9940-0ce86051694c</xsl:text></xsl:when>
        <xsl:when test=".='2 c Lehrbuchsammlungsausleihe'"><xsl:text>f71d6dcd-b3da-45dd-9e3f-a45afa3718ec</xsl:text></xsl:when>
        <xsl:when test=".='3 s Präsenzbestand'"><xsl:text>5d0c3d01-4dcb-4923-acda-dc0402f5f476</xsl:text></xsl:when>
        <xsl:when test=".='4 d Passive Fernleihe'"><xsl:text>7fc991fd-8500-4ba8-9894-052ec69d718f</xsl:text></xsl:when>
        <xsl:when test=".='5 i Nur für den Lesesaal'"><xsl:text>4d3e1d7a-cf78-4a9e-bb00-e6596de015e2</xsl:text></xsl:when>
        <xsl:when test=".='6 f nur Kopie möglich'"><xsl:text>6210aee5-990a-42ac-a08c-ecfb28c4bbfb</xsl:text></xsl:when>
        <!-- <xsl:when test=".='7 x Semesterausleihe'"><xsl:text></xsl:text></xsl:when> -->
        <xsl:when test=".='8 e Vermisst'"><xsl:text>5e46da98-6ab0-4ff2-a911-531c8b7bc71d</xsl:text></xsl:when>
        <xsl:when test=".='9 a Zur Erwerbung bestellt'"><xsl:text>48ddc2c8-8b09-4275-9de7-fabbb219d1e1</xsl:text></xsl:when>
        <xsl:when test=".='9 g Nicht ausleihbar'"><xsl:text>35856cfc-dcde-465f-ada0-cedb491bd2da</xsl:text></xsl:when>
        <xsl:when test=".='9 o Ausleihstatus unbekannt'"><xsl:text>5170505e-f4a4-4f17-955b-e0ce202889c4</xsl:text></xsl:when>
        <xsl:when test=".='9 z Verlust'"><xsl:text>38e8967f-a722-4297-aaeb-56f812533a78</xsl:text></xsl:when>
        <!-- <xsl:otherwise>2b94c631-fca9-4892-a730-03ee529ffe27</xsl:otherwise> <! 0 u normal ausleihbar -->
        <xsl:otherwise>5170505e-f4a4-4f17-955b-e0ce202889c4</xsl:otherwise> <!-- 9 o Ausleihstatus unbekannt -->
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
