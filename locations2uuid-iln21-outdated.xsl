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
        <xsl:when test=".='bestellt'">e3c2a462-747d-4d00-81de-e078c257becd</xsl:when>
        <xsl:when test=".='E01'">b5e6e8fe-d434-48b4-b43b-c1b096fba1d8</xsl:when>
        <xsl:when test=".='E02'">648f472e-490f-462b-83b6-bbbc8228b79d</xsl:when>
        <xsl:when test=".='E03'">6cd0441c-c5b9-4014-9367-bddcdcefdf04</xsl:when>
        <xsl:when test=".='E04'">e6704bd4-aa42-4d51-89aa-e0069c73bf64</xsl:when>
        <xsl:when test=".='Magazin'">ab302f5d-221d-4b33-9efb-60fde83d3a87</xsl:when>
        <xsl:when test=".='Magazinturm-E01'">47c13862-b9bd-48bf-8209-b525bd524fb5</xsl:when>
        <xsl:when test=".='Magazinturm-E02'">47c13862-b9bd-48bf-8209-b525bd524fb5</xsl:when>
        <xsl:when test=".='Magazinturm-E03'">47c13862-b9bd-48bf-8209-b525bd524fb5</xsl:when>
        <xsl:when test=".='Magazinturm-E04'">47c13862-b9bd-48bf-8209-b525bd524fb5</xsl:when>
        <xsl:when test=".='Mediathek'">65c7e4cb-0cf0-4b1c-a75c-6db98887b160</xsl:when>
        <xsl:when test=".='SEMAPP-ZENTRALE'">3d8ffe4e-fd43-484e-a556-0a5184d69ad7</xsl:when>
        <xsl:when test=".='ZSLS'">c19004fc-6c68-4de4-8d23-f5788a6567d1</xsl:when>
        <xsl:when test=".='ZSMAG'">abddeb0b-102a-4303-a607-c6e31d7d5a14</xsl:when>
        <xsl:when test=".='ZENTRALE'">52f2573c-35dc-44d8-b908-f97a3be51dd6</xsl:when>
        <xsl:when test=".='ABGANG'">d989f800-479e-4ed2-b1a1-5eba2d757495</xsl:when>
        <xsl:when test=".='TB Technik'">5fe3fd46-608e-4c89-b761-ac85fd5664c5</xsl:when>
        <xsl:when test=".='TB Wirtschaft'">be74d3d6-67fd-40a7-9de1-331304cec787</xsl:when>
        <xsl:when test=".='TBBHV'">03a47ee4-491e-4f4d-bb93-4c79baf8cb16</xsl:when>
        <xsl:when test=".='TB Kunst'">8a358406-2f75-4eb3-98ca-6eec5cd5ce35</xsl:when>
        <xsl:when test=".='TB Nautik'">be74d3d6-67fd-40a7-9de1-331304cec787</xsl:when>
        <xsl:when test=".='TB Musik'">861c7e7a-9b8a-49dc-a5d9-8853cb259c49</xsl:when>
        <xsl:when test=".='TB Sozialw.'">5fe3fd46-608e-4c89-b761-ac85fd5664c5</xsl:when>
        <xsl:when test=".='BB Nat.-NW1'">e2547a91-c342-4481-b92f-b58d9b45f872</xsl:when>
        <xsl:when test=".='BB WiWi'">e1f2b527-09fc-4088-82f8-78dc6f55d666</xsl:when>
        <xsl:when test=".='Juridicum'">e8956477-529c-4a0c-ae2e-d11701eb599d</xsl:when>
        <xsl:when test=".[contains(.,'geloescht')]">d989f800-479e-4ed2-b1a1-5eba2d757495</xsl:when>
		<xsl:when test=".='Online'">58a36dce-7dae-4bc4-8edb-3e8b8f8e44cd</xsl:when>
		<xsl:otherwise>52f2573c-35dc-44d8-b908-f97a3be51dd6</xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>
</xsl:stylesheet>
