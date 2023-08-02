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
        <xsl:when test=".='AM'">22ec765a-bef5-439e-a2b1-cfa6787eeeb2</xsl:when>
        <xsl:when test=".='DUMMY'">0a88749f-517f-4085-9734-e3235b3dea32</xsl:when>
        <xsl:when test=".='KEL'">7ef2804f-5e61-433b-bd82-8a849538bce4</xsl:when>
        <xsl:when test=".='LS'">a5407150-55f6-430a-b9b2-37378116aa0a</xsl:when>
        <xsl:when test=".='MAG'">11247661-1dc7-4eeb-91bd-d5ffb36312d8</xsl:when>
        <xsl:when test=".='ONLINE'">8fe5fdc7-1656-4169-ba0f-7572c3fcdee7</xsl:when>
        <xsl:when test=".='VERW'">793777ce-5181-446d-875a-58a1dd1b1612</xsl:when>
        <xsl:otherwise>811aea67-94a8-4822-9f5a-1d102e2ed367</xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <xsl:template match="permanentLoanTypeId">
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='b'">29386c67-3f6e-4de5-a432-a0aefa4f7b77</xsl:when> <!-- Kurzausleihe -->
        <xsl:when test=".='c'">f6794a4b-2f97-431e-ba94-b18d76ec5fde</xsl:when> <!-- Semesterausleihe -->
        <xsl:when test=".='s'">2f02e11d-d179-4027-be29-fd5a9dc84d27</xsl:when> <!-- Präsenzbestand -->
        <xsl:when test=".='d'"></xsl:when> <!--nicht genutzt -->
        <xsl:when test=".='i'">f1265623-9bf9-440e-a3db-42f99b970d3a</xsl:when> <!-- nur für den Lesesaal -->
        <xsl:when test=".='f'"></xsl:when> <!-- nicht genutzt -->
        <xsl:when test=".='e'">fef17994-698f-4e73-97bc-a6491a80865a</xsl:when> <!-- vermisst -->
        <xsl:when test=".='a'">d09d1ee7-9ac6-4670-8070-6bfe9c416197</xsl:when> <!-- bestellt (Erwerbung) -->
        <xsl:when test=".='g'">6f0711dc-cf85-4d8c-aae2-580c8b5c076a</xsl:when> <!-- gesperrt -->
        <xsl:when test=".='z'"></xsl:when> <!-- nicht genutzt -->
        <xsl:when test=".='dummy'">bed41238-73f9-431f-8f83-49d524a62298</xsl:when>
        <xsl:otherwise>6e46ca16-6095-4f22-a9e4-b28c7593fc36</xsl:otherwise> <!-- ausleihbar -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

</xsl:stylesheet>
