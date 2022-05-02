<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="permanentLocationId">
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='DUMMY'">87764786-c5c8-47d0-a480-df506c751d76</xsl:when> <!-- TBD? -->
        <xsl:when test=".='BRUWGM'">f6e47539-f4e6-41d8-b711-61a33f7bf2e5</xsl:when>
        <xsl:when test=".='BZGOM'">5ebff00a-c6df-4335-90d0-7ff4945112ad</xsl:when>
        <xsl:when test=".='BZGLB'">0652ba86-8112-405f-9118-0eed500bcbb1</xsl:when>
        <xsl:when test=".='BSPTST'">1bdb8316-46cb-49ff-b2a4-a623fc6db4e9</xsl:when>

        <xsl:otherwise>413fe054-a4f3-423e-a62f-088eb111ea8d</xsl:otherwise> <!-- TBD? -->
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <xsl:template match="permanentLoanTypeId">
    <permanentLoanTypeId>
      <xsl:choose>
        <!--  <xsl:when test=".='0 u normal ausleihbar'">c943ac60-b743-4d14-92d9-69de65934af8</xsl:when> see otherwise  --> 
        <xsl:when test=".='1 b Kurzausleihe'">fdb6f275-b9ab-4638-9e96-02fa5bdd67ca</xsl:when>
        <xsl:when test=".='2 c ausleihbar, keine Fernleihe'">cd7cd95f-66f7-49d5-a737-f4e001a8521c</xsl:when>
        <xsl:when test=".='3 s Präsenzbestand'">9ec54944-4f44-460d-8791-3a76083fd31d</xsl:when>
        <xsl:when test=".='4 d passive Fernleihe'">90631eac-caf7-4c31-9c63-e91552085aff</xsl:when>
        <xsl:when test=".='5 i nur für den Lesesaal'">a7239b09-6780-40bc-9058-c945de2fb535</xsl:when>
        <xsl:when test=".='6 f nur Kopie möglich'">cff01821-6c65-4309-aa65-40bea4a89efe</xsl:when>
        <xsl:when test=".='8 e vermisst'">2c84f231-cab9-498a-8c05-5cb337fbfbf6</xsl:when>
        <xsl:when test=".='9 a Erwerbungsdaten'">d28f0423-623b-428f-88cf-3dbea1d7c83b</xsl:when>
        <xsl:when test=".='9 g nicht ausleihbar (gesperrt)'">a2103b55-a144-4f73-ab01-db53ee32c878</xsl:when>
        <xsl:when test=".='9 o Ausleihstatus unbekannt'">481f366d-1bca-44ef-a5a2-fe343aca08d7</xsl:when>
        <xsl:when test=".='9 z Verlust'">b167f552-152e-43f3-bc52-090a21cc9625</xsl:when>
        <xsl:otherwise>c943ac60-b743-4d14-92d9-69de65934af8</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <!-- Map statistical code ids -->
  <xsl:template match="statisticalCodeIds">
    <statisticalCodeIds>
      <arr>
        <xsl:for-each select="arr/i">
          <i>
            <xsl:choose>
              <xsl:when test=".='BASIS'">0ac04835-6a08-4043-9453-38908ff91129</xsl:when>
              <xsl:when test=".='00015'">a59d4a4e-0339-4243-9039-bd64c8a9c941</xsl:when>
              <xsl:when test=".='00016'">e70c1e74-d136-4d59-bdb9-1ec2f33c6a93</xsl:when>
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

</xsl:stylesheet>
