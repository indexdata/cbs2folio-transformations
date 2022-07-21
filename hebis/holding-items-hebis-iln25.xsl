<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <!-- ILN 25 UB Mainz -->

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)"/>
    <!-- UB Mainz 209A$f/209G$a -->
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/> 
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="$standort='FREIHAND'">ZBFREI</xsl:when>
             <xsl:when test="$standort='LBS'">ZBLBS</xsl:when>
             <xsl:when test="$standort='LESESAAL'">ZBLS</xsl:when>
             <xsl:when test="contains($standort,'RARA')">ZBRARA</xsl:when>
             <xsl:otherwise>ZBMAG</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='002'">
           <xsl:choose>
             <xsl:when test="$standort='Erziehungswissenschaft'">GFGPÄD</xsl:when>
             <xsl:when test="$standort='Filmwissenschaft'">GFGFILM</xsl:when>
             <xsl:when test="$standort='Journalistik'">GFGJOUR</xsl:when>
             <xsl:when test="$standort='Politikwissenschaft'">GFGPOL</xsl:when>
             <xsl:when test="$standort='Psychologie'">GFGPSYCH</xsl:when>
             <xsl:when test="$standort='Publizistik'">GFGPUB</xsl:when>
             <xsl:when test="$standort='Soziologie'">GFGSOZ</xsl:when>
             <xsl:otherwise>GFGPÄD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='005'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LESESAAL')">UMLS</xsl:when>
             <xsl:when test="contains($standort,'LBS')">UMLBS</xsl:when>
             <xsl:otherwise>UMFH</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='006'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LEHRBUCH')">MINLBS</xsl:when>
             <xsl:when test="contains($standort,'Handapparat')">MINFAK</xsl:when>
             <xsl:otherwise>MIN</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='009'">FBMPI</xsl:when>	
         <xsl:when test="$abt='016'">
           <xsl:choose>
             <xsl:when test="contains($standort,'Rara')">THRARA</xsl:when>
             <xsl:when test="contains($standort,'LEHRBUCH')">THLBS</xsl:when>
             <xsl:otherwise>TH</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='018'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LEHRBUCH')">RWLBS</xsl:when>
             <xsl:otherwise>RW</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='019'">
           <xsl:choose>
             <xsl:when test="contains($standort,'Handapparat')">GHFAK</xsl:when> <!-- Es gibt auch starts-with(...,...) -->
             <xsl:when test="contains($standort,'Lehrbuch')">GHLBS</xsl:when>
             <xsl:when test="contains($standort,'Lesesaal')">GHLS</xsl:when>
             <xsl:when test="contains($standort,'Magazin')">GHMAG</xsl:when>
             <xsl:when test="($standort='CELA')
               or ($standort='CELTRA')
               or ($standort='SSC')">GHSEP</xsl:when>
             <xsl:otherwise>GHFREI</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='020'">RWFAK</xsl:when>
         <xsl:when test="$abt='021'">ZBMAG</xsl:when>
         <xsl:when test="$abt='034'">FBGTEM</xsl:when>
         <xsl:when test="$abt='043'">UMPSY</xsl:when>
         <xsl:when test="$abt='054'">UMZMK</xsl:when>
         <xsl:when test="$abt='058'">PHPHI</xsl:when>
         <xsl:when test="$abt='066'">RWETH</xsl:when>
         <xsl:when test="$abt='069'">FBPSY</xsl:when>
         <xsl:when test="$abt='070'">PHGER</xsl:when>
         <xsl:when test="$abt='071'">PHAVL</xsl:when>
         <xsl:when test="$abt='072'">PHANG</xsl:when>
         <xsl:when test="$abt='073'">PHAVS</xsl:when>
         <xsl:when test="$abt='074'">PHROM</xsl:when>
         <xsl:when test="$abt='075'">PHSLAV</xsl:when>
         <xsl:when test="$abt='076'">PHPOL</xsl:when>
         <xsl:when test="$abt='077'">PHKLP</xsl:when>
         <xsl:when test="$abt='078'">PHKLA</xsl:when>
         <xsl:when test="$abt='079'">GFGKUN</xsl:when>
         <xsl:when test="$abt='080'">ZBTURK</xsl:when>
         <xsl:when test="$abt='082'">FBÄGYPT</xsl:when>
         <xsl:when test="$abt='085'">FBVFGE</xsl:when>
         <xsl:when test="$abt='083'">PHKLW</xsl:when>
         <xsl:when test="$abt='086'">PHALG</xsl:when>
         <xsl:when test="$abt='087'">PHBYZ</xsl:when>
         <xsl:when test="$abt='088'">PHMNG</xsl:when>
         <xsl:when test="$abt='090'">PHBUW</xsl:when>
         <xsl:when test="$abt='091'">PHMUW</xsl:when>
         <xsl:when test="$abt='092'">PHOEG</xsl:when>
         <xsl:when test="$abt='093'">
           <xsl:choose>
             <xsl:when test="$standort='MAG'">ZBMAG</xsl:when>
             <xsl:otherwise>ZBLS</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='094'">FBIGL</xsl:when>
         <xsl:when test="$abt='110'">GFGGEO</xsl:when>
         <xsl:when test="$abt='111'">FBKUNST</xsl:when>
         <xsl:when test="$abt='112'">PHHFM</xsl:when>
         <xsl:when test="$abt='113'">GFGSPO</xsl:when>
         <xsl:when test="$abt='120'">PHTHW</xsl:when>
         <xsl:when test="$abt='124'">FBGESANG</xsl:when>
         <xsl:when test="$abt='125'">ZBMAG</xsl:when>
         <xsl:when test="$abt='126'">GFGUSA</xsl:when>
         <xsl:when test="$abt='127'">PHMAG</xsl:when>
         <xsl:otherwise>UNKNOWN</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>
   
  <xsl:template match="permanentLoanTypeId">
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='dummy'">dummy</xsl:when>
        <xsl:when test=".='u'">0 u ausleihbar</xsl:when>
        <xsl:when test=".='b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test=".='c'">2 c Lehrbuchsammlung</xsl:when>
        <xsl:when test=".='s'">3 s Präsenzbestand Lesesaal</xsl:when>
        <xsl:when test=".='d'">4 d Präsenzbestand Wochenendausleihe</xsl:when>
        <xsl:when test=".='i'">5 i nur für den Lesesaal</xsl:when>
        <xsl:when test=".='e'">8 e vermisst</xsl:when>
        <xsl:when test=".='g'">9 g nicht ausleihbar</xsl:when>
        <xsl:when test=".='a'">9 a bestellt</xsl:when>
        <xsl:when test=".='z'">9 z Verlust</xsl:when>
        <xsl:otherwise>0 u ausleihbar</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>
  
  <xsl:template match="discoverySuppress"> <!-- add: substring(., 1, 4) = 'true') or -->
    <discoverySuppress>
      <xsl:value-of select="(substring(., 1, 4) = 'true') or (substring(., 1, 1) = 'g') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/>           
    </discoverySuppress>
  </xsl:template>

<!-- Parsing call number for prefix - optional -->

  <xsl:template name="prefix">
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
