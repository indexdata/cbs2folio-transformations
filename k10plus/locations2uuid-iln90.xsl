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
        <xsl:when test=".='PRF'">7ee4a234-77f0-415d-bfb5-8acce84cf319</xsl:when>
        <xsl:when test=".='ALT'">daa2314f-f7da-468b-b61d-e9b88f2c0367</xsl:when>
        <xsl:when test=".='HOLTHUSEN'">b54c934b-d3dd-4899-9a3e-78a2e984289e</xsl:when>
        <xsl:when test=".='AZP'">0ebd6872-f8bc-4e0f-b111-d7a5ef4bcd54</xsl:when>
        <xsl:when test=".='ATLANTENSCHRANK'">63024fee-f3e8-42ed-96a5-02f3b6294e7b</xsl:when>
        <xsl:when test=".='STA'">e83fac36-512c-42fd-b530-71d68170f212</xsl:when>
        <xsl:when test=".='FL'">d6d7f50e-25e6-4f24-881d-3d78b34cc283</xsl:when>
        <xsl:when test=".='HA'">950aea9f-8112-4693-8aa0-c7ad8754ccc8</xsl:when>
        <xsl:when test=".='LEIHSTELLE'">cf0d6cf9-3ea9-4605-960c-71785e59126d</xsl:when>
        <xsl:when test=".='LESELOUNGE'">30272f6c-a721-4a87-84ef-001d49d9dbd0</xsl:when>
        <xsl:when test=".='LS-NUTZUNG'">efc0fc01-5d81-426e-9ec9-879b4ee29810</xsl:when>
        <xsl:when test=".='MAGAZIN'">bc565d2f-de93-4eb0-a9cd-d3d8e1c5f0c2</xsl:when>
        <xsl:when test=".='AMI'">8e914723-39db-49ed-8f8f-1e162148220d</xsl:when>
        <xsl:when test=".='Makuliert!HA'">6855eb40-d0e7-4c4e-ba90-4d3773b663c6</xsl:when>
        <xsl:when test=".='Makuliert!MAGAZIN'">71d3e26d-cd26-4fa7-8841-609e68f66960</xsl:when>
        <xsl:when test=".='MEDIOTHEK'">39f3bf22-717d-4900-aa8d-c4a81bd6e91b</xsl:when>
        <xsl:when test=".='MIKROFORM'">71d3e26d-cd26-4fa7-8841-609e68f66960</xsl:when>
        <xsl:when test=".='PRR'">7e5314e4-ae2b-4b9d-ac8a-962b7a85e034</xsl:when>
        <xsl:when test=".='RARA'">7ab40f6b-85bc-4711-9b0a-b8a01f9ca939</xsl:when>
        <xsl:when test=".='SEMAPP'">4a4671c4-183e-4de6-9d4b-99328f63087a</xsl:when>
        <xsl:when test=".='ZSS-MAGAZIN'">4c65d434-83df-4e95-a305-e2f606348c51</xsl:when>
        <xsl:when test=".='ZTG'">f83c0ce8-5e85-4dd0-a191-e9daadf98d66</xsl:when>
        <xsl:when test=".[contains(.,'geloescht')]">2f84ae67-bd38-4546-a0bb-256d7a1b7ef6</xsl:when>
	<xsl:when test=".='Online'">184aae84-a5bf-4c6a-85ba-4a7c73026cd5</xsl:when>
	<xsl:otherwise>bbbb3330-253a-45d2-924c-75179019c943</xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>
</xsl:stylesheet>
