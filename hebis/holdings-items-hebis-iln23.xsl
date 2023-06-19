<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2022-11-09 (YYYY-MM-DD) -->

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
    <xsl:variable name="signatur" select="$i/datafield[@tag='209A']/subfield[@code='a']"/>
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
         <xsl:when test="$abt='020'">
           <xsl:choose>
             <xsl:when test="starts-with($standort, 'Patentinformationszentrum')">000_UBG</xsl:when>
             <xsl:when test="starts-with($signatur, 'INCHER-Kassel Präsenzbestand')">020_INC</xsl:when>
             <xsl:when test="starts-with($signatur, 'Institutionenausleihe')">020_IAL</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='021'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat Digitale Bibliotheksdienste'">021_HDB</xsl:when>
             <xsl:when test="$standort='Handapparat, Prof'">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">020_SON</xsl:when>
             <xsl:when test="starts-with($signatur, '125 STK')">021_STK</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='022'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat, Prof'">020_HAP</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">020_SON</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="$standort='Sonderstandort Wilhelmshöher Allee, Elektrotechnik/Informatik'">022_WAS</xsl:when>
             <xsl:when test="$signatur='Institut für Musik, Musica practica, Mönchebergstr. 1, Raum 2012'">022_IMU</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='023'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat, Prof'">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">020_SON</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">021_ZTG</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='024'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat, Prof'">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='025'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat, Prof'">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='030'">
           <xsl:choose>
             <xsl:when test="$standort='Brüder-Grimm-Gesellschaft'">030_BGG</xsl:when>
             <xsl:when test="$standort='Bibliothek Landrabbiner Isaac Prager'">030_PRA</xsl:when>
             <xsl:when test="$standort='Eulensaal'">030_EUL</xsl:when>
             <xsl:when test="$standort='Foyer Eulensaal'">030_FEU</xsl:when>
             <xsl:when test="$standort='Großformateregal'">030_GRO</xsl:when>
             <xsl:when test="$standort='Kompaktmagazin Menzelstraße (Alpha-Presse)'">030_KHS</xsl:when>
             <xsl:when test="$standort='Magazin'">030_MAG</xsl:when>
             <xsl:when test="$standort='Magazin Holländischer Platz'">030_CBM</xsl:when>
             <xsl:when test="$standort='Rara'">030_RAR</xsl:when>
             <xsl:when test="$standort='Sonderlesesaal'">030_SLS</xsl:when>
             <xsl:when test="$standort='Sonderstandort Magazin Oberzwehren'">030_OZW</xsl:when>
             <xsl:when test="$standort='Tresormagazin'">030_TRE</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">030_ZTG</xsl:when>
             <xsl:otherwise>030_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='031'">
           <xsl:choose>
             <xsl:when test="$standort='Sonderstandort Magazin Oberzwehren'">031_OZW</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='032'">
           <xsl:choose>
             <xsl:when test="$standort='Magazin'">032_CBM</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='033'">
           <xsl:choose>
             <xsl:when test="$standort='Brüder-Grimm-Gesellschaft'">033_BGG</xsl:when>
             <xsl:when test="$standort='Magazin Holländischer Platz'">033_CBM</xsl:when>
             <xsl:when test="$standort='Rara'">033_RAR</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='034'">
           <xsl:choose>
             <xsl:when test="$standort='Foyer Eulensaal'">034_FEU</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='036'">
           <xsl:choose>
             <xsl:when test="$standort='Sonderstandort Magazin Oberzwehren'">036_OZW</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='039'">
           <xsl:choose>
             <xsl:when test="$standort='Foyer Eulensaal'">039_FEU</xsl:when>
             <xsl:when test="$standort='Magazin'">039_MAG</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='040'">
           <xsl:choose>
             <xsl:when test="$standort='Sammlung Amerikanische Bibliothek'">021_MAG</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='050'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat Digitale Bibliotheksdienste'">021_HDB</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">050_ZTG</xsl:when>
             <xsl:otherwise>050_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='070'">
           <xsl:choose>
             <xsl:when test="$standort='Großformateregal'">070_GRO</xsl:when>
             <xsl:when test="$standort='Medienregal'">070_MDR</xsl:when>
             <xsl:when test="$standort='Magazin'">070_MAG</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">070_ZTG</xsl:when>
             <xsl:otherwise>070_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='080'">
           <xsl:choose>
             <xsl:when test="$standort='Magazin'">080_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">080_SON</xsl:when>
             <xsl:when test="$standort='Sonderstandort Gewächshaus'">080_SON</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">080_ZTG</xsl:when>
             <xsl:when test="starts-with($signatur, 'Institutionenausleihe')">020_IAL</xsl:when>
             <xsl:otherwise>080_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='090'">
           <xsl:choose>
             <xsl:when test="$standort='Großformateregal'">090_GRO</xsl:when>
             <xsl:when test="$standort='Medienregal'">090_MDR</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">090_ZTG</xsl:when>
             <xsl:when test="starts-with($signatur, 'Institutionenausleihe')">020_IAL</xsl:when>
             <xsl:otherwise>090_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='110'">
           <xsl:choose>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:otherwise>999_XYZ</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>
   
  <xsl:template match="permanentLoanTypeId">
    <xsl:variable name="loantype" select="key('original',.)/datafield[@tag='209A']/subfield[@code='d']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='u'">0 u Ausleihbar</xsl:when>
        <xsl:when test=".='b'">1 b Fernleihe - passiv</xsl:when>
        <xsl:when test=".='c'">2 c Filme (KHS)</xsl:when>
        <xsl:when test=".='s'">3 s Präsenzbestand</xsl:when>
        <xsl:when test=".='d'">4 d Fernleihe - passiv</xsl:when>
        <xsl:when test=".='i'">5 i nur für den Lesesaal</xsl:when>
        <xsl:when test=".='e'">8 e Studienkolleg</xsl:when>
        <xsl:when test=".='a'">9 a bestellt (Erwerbung)</xsl:when>
        <xsl:when test=".='o'">9 f Nur BGP-kein Zugriff-verpackt (Bau)</xsl:when>
        <xsl:when test=".='g'">9 g nicht ausleihbar</xsl:when>
        <xsl:when test=".='z'">9 z nicht ausleihbar</xsl:when>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <xsl:template match="discoverySuppress"> <!-- uses 208@$b (TBD? Kat. 4850 bzw. 247E/XY ?) -->
    <discoverySuppress>
      <!-- MZ: <xsl:value-of select="(substring(., 1, 1) = 'g') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/> 
           DA: nicht anzeigen: Pos.2: f, p, y, z -->
      <xsl:value-of select="(substring(., 1, 4) = 'true') or (substring(., 2, 1) = 'f') or (substring(., 2, 1) = 'p') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/>
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
