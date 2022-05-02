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
    <xsl:variable name="signatur" select="$i/datafield[@tag='209A']/subfield[@code='a']"/>
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="starts-with($signatur,'SR')">ZBOM</xsl:when> <!-- TBD: Offenes Magazin -->

             <xsl:otherwise>UNKNOWN</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='034'">
           <xsl:choose>
             <xsl:when test="starts-with($signatur,'52/')">BRUWGM</xsl:when>

             <xsl:otherwise>BRUW</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='330'">
           <xsl:choose>
             <xsl:when test="starts-with($signatur,'26/')">BZGLB</xsl:when>

             <xsl:otherwise>BZGOM</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='006'">
           <xsl:choose>
             <xsl:when test="starts-with($signatur,'42/')">BSPTST</xsl:when>

             <xsl:otherwise>BSP</xsl:otherwise>
           </xsl:choose>
         </xsl:when>

         <xsl:otherwise>UNKNOWN</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>
   
  <xsl:template match="permanentLoanTypeId">
    <xsl:variable name="loantype" select="key('original',.)/datafield[@tag='209A']/subfield[@code='d']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='u'">0 u normal ausleihbar</xsl:when>
        <xsl:when test=".='b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test=".='c'">2 c ausleihbar, keine Fernleihe</xsl:when>
        <xsl:when test=".='s'">3 s Präsenzbestand</xsl:when>
        <xsl:when test=".='d'">4 d passive Fernleihe</xsl:when>
        <xsl:when test=".='i'">5 i nur für den Lesesaal</xsl:when>
        <xsl:when test=".='f'">6 f nur Kopie möglich</xsl:when>
        <xsl:when test=".='e'">8 e vermisst</xsl:when>
        <xsl:when test=".='a'">9 a Erwerbungsdaten</xsl:when>
        <xsl:when test=".='g'">9 g nicht ausleihbar (gesperrt)</xsl:when>
        <xsl:when test=".='o'">9 o Ausleihstatus unbekannt</xsl:when>
        <xsl:when test=".='z'">9 z Verlust</xsl:when>
        <xsl:otherwise>0 u ausleihbar</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <!-- Parsing call number for prefix - optional -->
  
  <xsl:template name="prefix"> <!-- TBD: Adapt to ILN 3 -->
    <xsl:param name="cn"/>
    <xsl:param name="cnprefixelement"/>
    <xsl:param name="cnelement"/>
    <xsl:variable name="cnprefix">
      <xsl:choose>
        <xsl:when test="contains($cn,'°')">
          <xsl:value-of select="concat(substring-before($cn,'°'),'°')"/>
        </xsl:when>
        <xsl:when test="contains($cn,'@')">
          <xsl:value-of select="substring-before($cn,'@')"/> 
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:message>Debug: <xsl:value-of select="$cnelement"/> Prefix "<xsl:value-of select="$cnprefix"/>"</xsl:message>
    <xsl:if test="string-length($cnprefix)>0">
      <xsl:element name="{$cnprefixelement}">
        <xsl:value-of select="normalize-space(translate($cnprefix,'@',''))"/>
      </xsl:element>
    </xsl:if>
    <xsl:element name="{$cnelement}">
      <xsl:value-of select="normalize-space(translate(substring-after($cn,$cnprefix),'@',''))"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="callNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'callNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'callNumber'"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="itemLevelCallNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'itemLevelCallNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'itemLevelCallNumber'"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
