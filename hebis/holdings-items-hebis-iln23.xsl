<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2023-11-20 (YYYY-MM-DD) -->

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
         <xsl:when test="$electronicholding">000_ERS</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUM_XYZ</xsl:when>
         <xsl:when test="$abt='000'">
          <xsl:text>000_UBG</xsl:text>
         </xsl:when>
         <xsl:when test="$abt='010'">
           <xsl:choose>
             <xsl:when test="starts-with($signatur, 'Wird erworben')">000_ERW</xsl:when>
             <xsl:otherwise>010_ERD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='020'">
           <xsl:choose>
             <xsl:when test="starts-with($standort, 'Patentinformationszentrum')">000_UBG</xsl:when>
             <xsl:when test="starts-with($signatur, 'INCHER-Kassel Pr')">020_INC</xsl:when>
             <xsl:when test="starts-with($signatur, 'Institutionenausleihe')">020_IAL</xsl:when>
             <xsl:when test="starts-with($signatur, 'Ausgeschieden')">000_UBG</xsl:when>
             <xsl:otherwise>999_XYZ</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='021'">
           <xsl:choose>
             <xsl:when test="$standort='Handapparat Digitale Bibliotheksdienste'">021_HDB</xsl:when>
             <xsl:when test="starts-with($standort, 'Handapparat, Prof')">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">020_SON</xsl:when>
             <xsl:when test="starts-with($signatur, '125 STK')">021_STK</xsl:when>
             <xsl:when test="starts-with($signatur, 'Handapparat Digitale Bibliotheksdienste')">021_HAI</xsl:when>
             <xsl:when test="starts-with($signatur, 'Handapparat Direktion')">021_HAI</xsl:when>
             <xsl:when test="$standort='Handapparat Direktion'">021_HDD</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='022'">
           <xsl:choose>
             <xsl:when test="starts-with($standort, 'Handapparat, Prof')">020_HAP</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">020_SON</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort Wilhelmsh')">022_WAS</xsl:when>
             <xsl:when test="contains($signatur, 'r Musik, Musica Practica, M')">022_IMU</xsl:when>
             <xsl:when test="$standort='Handapparat Direktion'">021_HDD</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='023'">
           <xsl:choose>
             <xsl:when test="starts-with($standort, 'Handapparat, Prof')">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort FB')">020_SON</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">021_ZTG</xsl:when>
             <xsl:when test="$standort='Handapparat Direktion'">021_HDD</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='024'">
           <xsl:choose>
             <xsl:when test="starts-with($standort, 'Handapparat, Prof')">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="$standort='Handapparat Direktion'">021_HDD</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='025'">
           <xsl:choose>
             <xsl:when test="starts-with($standort, 'Handapparat, Prof')">020_HAP</xsl:when>
             <xsl:when test="$standort='Magazin'">021_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Sonderstandort Wilhelmsh')">022_WAS</xsl:when>
             <xsl:when test="$standort='Handapparat Direktion'">021_HDD</xsl:when>
             <xsl:otherwise>021_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='030'">
           <xsl:choose>
             <xsl:when test="contains($standort, 'der-Grimm-Gesellschaft')">030_BGG</xsl:when>
             <xsl:when test="$standort='Bibliothek Landrabbiner Isaac Prager'">030_PRA</xsl:when>
             <xsl:when test="$standort='Eulensaal'">030_EUL</xsl:when>
             <xsl:when test="$standort='Foyer Eulensaal'">030_FEU</xsl:when>
             <xsl:when test="$standort='Großformateregal'">030_GRO</xsl:when>
             <xsl:when test="starts-with($standort, 'Kompaktmagazin Menzelstra')">030_KHS</xsl:when>
             <xsl:when test="$standort='Magazin'">030_MAG</xsl:when>
             <xsl:when test="starts-with($standort, 'Magazin Holl')">030_CBM</xsl:when>
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
             <xsl:otherwise>999_XYZ</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='032'">
           <xsl:choose>
             <xsl:when test="$standort='Magazin'">032_CBM</xsl:when>
             <xsl:otherwise>999_XYZ</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='033'">
           <xsl:choose>
             <xsl:when test="contains($standort, 'der-Grimm-Gesellschaft')">033_BGG</xsl:when>
             <xsl:when test="starts-with($standort, 'Magazin Holl')">033_CBM</xsl:when>
             <xsl:when test="$standort='Rara'">033_RAR</xsl:when>
             <xsl:otherwise>999_XYZ</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='034'">
           <xsl:choose>
             <xsl:when test="$standort='Foyer Eulensaal'">034_FEU</xsl:when>
             <xsl:otherwise>999_XYZ</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='035'">
          <xsl:text>035_FWH</xsl:text>
         </xsl:when>
         <xsl:when test="$abt='036'">
           <xsl:choose>
             <xsl:when test="$standort='Sonderstandort Magazin Oberzwehren'">036_OZW</xsl:when>
             <xsl:otherwise>999_XYZ</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='039'">
           <xsl:choose>
             <xsl:when test="$standort='Foyer Eulensaal'">039_FEU</xsl:when>
             <xsl:when test="$standort='Magazin'">039_MAG</xsl:when>
             <xsl:otherwise>039_MAG</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='040'">
            <xsl:text>021_MAG</xsl:text>
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
             <xsl:when test="starts-with($standort, 'Sonderstandort Gew')">080_SON</xsl:when>
             <xsl:when test="$standort='Zeitungsauslage'">080_ZTG</xsl:when>
             <xsl:when test="starts-with($signatur, 'Institutionenausleihe')">020_IAL</xsl:when>
             <xsl:otherwise>080_FHD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='090'">
           <xsl:choose>
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
         <xsl:when test="$abt='200'">
           <xsl:choose>
             <xsl:when test="$standort='Archiv'">200_ARC</xsl:when>
             <xsl:when test="starts-with($standort, 'Gew')">200_GEW</xsl:when>
             <xsl:when test="$standort='ISOS-Bibliothek'">200_ISO</xsl:when>
             <xsl:when test="$standort='Magazin Apfelkeller'">200_APF</xsl:when>
             <xsl:when test="$standort='Magazin Spitzbogenkeller'">200_SPI</xsl:when>
             <xsl:when test="starts-with($standort, 'Ausleihtheke')">200_SON</xsl:when>
             <xsl:when test="starts-with($standort, 'Gro')">200_SON</xsl:when>
             <xsl:when test="starts-with($standort, 'Medien-Regal')">200_SON</xsl:when>
             <xsl:otherwise>200_FHD</xsl:otherwise>
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
        <xsl:when test=".='f'">9 f Nur BGP-kein Zugriff-verpackt (Bau)</xsl:when>
        <xsl:when test=".='g'">9 g nicht ausleihbar</xsl:when>
        <xsl:when test=".='z'">9 z nicht ausleihbar</xsl:when>
        <xsl:otherwise>9 o Ausleihstatus unbekannt</xsl:otherwise> <!-- damit Sonderfaelle auffallen -->
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

</xsl:stylesheet>

