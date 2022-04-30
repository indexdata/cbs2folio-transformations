<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)"/>
    <!-- UB FFM 209A$f/209G$a ? -->
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/>
    <xsl:variable name="electronicholding" select="(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'l') or (substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'o') or ($abt='900')"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="starts-with($i/datafield[@tag='209A']/subfield[@code='h'],'SR')">ZBOM</xsl:when> <!-- TBD: Offenes Magazin -->

             <xsl:otherwise>UNKNOWN</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='034'">
           <xsl:choose>
             <xsl:when test="$standort='Magazin'">BRUWGM</xsl:when>

             <xsl:otherwise>BRUW</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='330'">
           <xsl:choose>
             <xsl:when test="starts-with($standort,'Lehrbuch')">BZGLB</xsl:when>

             <xsl:otherwise>BZGOM</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='006'">
           <xsl:choose>
             <xsl:when test="$standort='Testarchiv'">BSPTST</xsl:when>

             <xsl:otherwise>BSP</xsl:otherwise>
           </xsl:choose>
         </xsl:when>

         <xsl:otherwise>UNKNOWN</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>
   
  <xsl:template match="permanentLoanTypeId">
    <!-- Mainz 209A$d -->
    <xsl:variable name="loantype" select="key('original',.)/datafield[@tag='209A']/subfield[@code='d']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test="$loantype='u'">0 u ausleihbar</xsl:when>
        <xsl:when test="$loantype='b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test="$loantype='c'">2 c Lehrbuchsammlung</xsl:when>
        <xsl:when test="$loantype='s'">3 s Präsenzbestand Lesesaal</xsl:when>
        <xsl:when test="$loantype='d'">4 d Präsenzbestand Wochenendausleihe</xsl:when>
        <xsl:when test="$loantype='i'">5 i nur für den Lesesaal</xsl:when>
        <xsl:when test="$loantype='e'">8 e vermisst</xsl:when>
        <xsl:when test="$loantype='g'">9 g nicht ausleihbar</xsl:when>
        <xsl:when test="$loantype='a'">9 a bestellt</xsl:when>
        <xsl:when test="$loantype='z'">9 z Verlust</xsl:when>
        <xsl:otherwise>ausleihbar/Fernleihe</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

</xsl:stylesheet>
