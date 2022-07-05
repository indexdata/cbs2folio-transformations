<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <!-- ILN 23 UB Kassel: holding-items-hebis-iln23.xsl -->

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)"/>
    <!-- 209A$f/209G$a ? -->
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <!-- <xsl:variable name="signatur" select="$i/datafield[@tag='209A']/subfield[@code='a']"/> ? -->
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/> 
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="$standort='Erdgeschoss'">S1EG</xsl:when>
             <xsl:when test="$standort='1. Obergeschoss'">S1OG1</xsl:when>
             <xsl:when test="$standort='2. Obergeschoss'">S1OG2</xsl:when>
             <xsl:when test="$standort='3. Obergeschoss'">S1OG3</xsl:when>
             <xsl:when test="$standort='4. Obergeschoss'">S1OG3</xsl:when>
             <!-- Rara, Sonderlesesaal, ...? -->
             <xsl:otherwise>MAG</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <!-- Hier abt='001' ergaenzen, wenn Schlossumzug -->
         <xsl:when test="$abt='021'">
           <xsl:choose>
             <xsl:when test="$standort='Erdgeschoss'">L4EG</xsl:when>
             <xsl:when test="$standort='1. Obergeschoss'">L41OG</xsl:when>
             <xsl:when test="$standort='2. Obergeschoss'">L42OG</xsl:when>
             <xsl:when test="$standort='3. Obergeschoss'">L43OG</xsl:when>
   
             <xsl:otherwise>ABT021FREIHAND</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='005'">INST005</xsl:when>
         <xsl:when test="$abt='024'">INST024</xsl:when>
         <!-- weitere ergaenzen, wenn OUS-Strukturen klarer -->
         <xsl:otherwise>UNDEF</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>
   
  <xsl:template match="permanentLoanTypeId">
    <xsl:variable name="loantype" select="key('original',.)/datafield[@tag='209A']/subfield[@code='d']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='u'">0 u Ausleihbar</xsl:when>
        <xsl:when test=".='b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test=".='c'">2 c Lehrbuchsammlungsausleihe</xsl:when>
        <xsl:when test=".='s'">3 s Präsenzbestand</xsl:when>
        <xsl:when test=".='d'">4 d Passive Fernleihe</xsl:when>
        <xsl:when test=".='i'">5 i Nur für den Lesesaal</xsl:when>
        <xsl:when test=".='f'">6 f nur Kopie möglich</xsl:when> <!-- ILN 8: in LBS3 nicht genutzt -->
        <!-- Status 7 mit 237A/4801 Semesterausleihe erzeugen? = vertagt, da unklar, ob in Folio nutzbar und fuer CBS-Saetze nicht relevant -->
        <xsl:when test=".='e'">8 e Vermisst</xsl:when>
        <xsl:when test=".='a'">9 a Zur Erwerbung bestellt</xsl:when>
        <xsl:when test=".='g'">9 g Nicht ausleihbar</xsl:when>
        <xsl:when test=".='o'">9 o Ausleihstatus unbekannt</xsl:when>
        <xsl:when test=".='z'">9 z Verlust</xsl:when>
        <!-- <xsl:otherwise>0 u Ausleihbar</xsl:otherwise>  wg. Zs ohne $d? -->
        <xsl:otherwise>9 o Ausleihstatus unbekannt</xsl:otherwise> <!-- damit Sonderfaelle auffallen -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <xsl:template match="discoverySuppress"> <!-- uses 208@$b (TBD? Kat. 4850 bzw. 247E/XY ?) -->
    <discoverySuppress>
      <!-- MZ: <xsl:value-of select="(substring(., 1, 1) = 'g') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/> 
           DA: nicht anzeigen: Pos.2: f, p, y, z -->
      <xsl:value-of select="(substring(., 2, 1) = 'f') or (substring(., 2, 1) = 'p') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/>
    </discoverySuppress>
  </xsl:template>

  <!-- Parsing call number for prefix - optional -->
  
  <xsl:template name="prefix"> <!-- ILN 8: Auswirkungen Testen -->
    <xsl:param name="cn"/>
    <xsl:param name="cnprefixelement"/>
    <xsl:param name="cnelement"/>
    <!-- Anpassen -->
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
    <!-- Anpassen Ende -->

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
