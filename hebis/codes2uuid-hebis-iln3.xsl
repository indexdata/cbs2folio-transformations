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
        <!--  <xsl:when test=".='0 u ausleihbar'">7a03b2e2-c995-47a4-83d0-04bbe1930af4</xsl:when>  --> 
        <xsl:when test=".='1 b Kurzausleihe'">df64c252-595d-463c-aad8-3bda0ba101aa</xsl:when>
        <xsl:when test=".='2 c Lehrbuchsammlung'">d1ba00c9-3f08-4df9-9d70-c7e1ab3b1702</xsl:when>
        <xsl:when test=".='3 s Präsenzbestand Lesesaal'">1cecc65a-a7c4-437a-bb04-6756c23b422e</xsl:when>
        <xsl:when test=".='4 d Präsenzbestand Wochenendausleihe'">31c550e8-86b7-4674-bab0-7011ba94148e</xsl:when>
        <xsl:when test=".='5 i nur für den Lesesaal'">e04e82c1-1257-4046-bc5e-d742bbe061da</xsl:when>
        <xsl:when test=".='8 e vermisst'">cbd4ec80-1622-420e-8b7c-644b04109367</xsl:when>
        <xsl:when test=".='9 a bestellt'">8cef8fa7-0a78-4bdd-84d3-25ce207ef8c8</xsl:when>
        <xsl:when test=".='9 g nicht ausleihbar'">20c359cb-b422-47cc-8c40-e8f6655f2b70</xsl:when>
        <xsl:when test=".='9 Test'">3b23397c-93ec-40ad-bb8a-9113f9fe9de2</xsl:when>
        <xsl:when test=".='9 z Verlust'">661ffe64-2e47-4203-845f-96d820aa48f2</xsl:when>
        <xsl:otherwise>7a03b2e2-c995-47a4-83d0-04bbe1930af4</xsl:otherwise>
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
