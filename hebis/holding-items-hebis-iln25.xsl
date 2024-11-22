<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2023-06-16 (YYYY-MM-DD) -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <!-- ILN 25 UB Mainz -->
<xsl:template match="processing[not(parent::delete)]">
  <processing> <!-- overwrites hebis default -->
    <item>
      <retainExistingValues>
        <forOmittedProperties>true</forOmittedProperties>
        <forTheseProperties>
          <arr>
            <i>materialTypeId</i>
          </arr>
        </forTheseProperties>
      </retainExistingValues>
      <status>
        <policy>retain</policy>
      </status>
      <retainOmittedRecord>
        <ifField>hrid</ifField>
        <matchesPattern>it.*</matchesPattern>
      </retainOmittedRecord>
      <statisticalCoding>
        <arr>
          <i>
            <if>deleteSkipped</if>
            <becauseOf>ITEM_STATUS</becauseOf>
            <setCode>ITEM_STATUS</setCode>
            <!-- seems not to work properly Quesnelia 2024-10-28 -->
          </i>
        </arr>
      </statisticalCoding>
    </item>
  	<holdingsRecord>
  	  <retainExistingValues>
  	    <forOmittedProperties>true</forOmittedProperties>
  	  </retainExistingValues>
  	  <retainOmittedRecord>
  	    <ifField>hrid</ifField>
  	    <matchesPattern>ho.*</matchesPattern>
  	  </retainOmittedRecord>
  	  <statisticalCoding>
  	    <arr>
  	      <i>
  	        <if>deleteSkipped</if>
  	        <becauseOf>ITEM_STATUS</becauseOf>
  	        <setCode>ITEM_STATUS</setCode>
  	      </i>
  	      <i>
  	        <if>deleteSkipped</if>
  	        <becauseOf>ITEM_PATTERN_MATCH</becauseOf>
  	        <setCode>ITEM_PATTERN_MATCH</setCode>
  	      </i> 
  	    </arr>
  	  </statisticalCoding>
  	</holdingsRecord>
    <instance/>
  </processing>
</xsl:template>

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)"/>
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/> 
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <xsl:variable name="onorder" select="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a'"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],2,1) = 'o') and not($i/datafield[@tag='209A']/subfield[@code='d'])">AUFSATZ</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="$onorder">ZBZEB</xsl:when>
             <xsl:when test="contains($standort,'Fernleihe Lesesaal')">ZBFLLS</xsl:when>
             <xsl:when test="contains($standort,'Fernleihe')">ZBFL</xsl:when>
             <xsl:when test="contains($standort,'FREIHAND')">ZBFREI</xsl:when>
             <xsl:when test="contains($standort,'LESESAAL')">ZBLS</xsl:when>
             <xsl:when test="contains($standort,'LBS')">ZBLBS</xsl:when>
             <xsl:when test="contains($standort,'RARA')">ZBRARA</xsl:when>
             <xsl:otherwise>ZBMAG</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='002'">
           <xsl:choose>
             <xsl:when test="$onorder">GFGZEB</xsl:when>
             <xsl:when test="contains($standort,'Erziehungswissenschaft')">GFGPÄD</xsl:when>
             <xsl:when test="contains($standort,'Filmwissenschaft')">GFGFILM</xsl:when>
             <xsl:when test="contains($standort,'Journalistik')">GFGJOUR</xsl:when>
             <xsl:when test="contains($standort,'Politikwissenschaft')">GFGPOL</xsl:when>
             <xsl:when test="contains($standort,'Psychologie')">GFGPSYCH</xsl:when>
             <xsl:when test="contains($standort,'Publizistik')">GFGPUB</xsl:when>
             <xsl:when test="contains($standort,'Soziologie')">GFGSOZ</xsl:when>
             <xsl:otherwise>GFGPÄD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
		 <xsl:when test="$abt='003'">
           <xsl:choose>
             <xsl:when test="$onorder">ZBZEB</xsl:when>
             <xsl:otherwise>ZBLS</xsl:otherwise>
			     </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='004'">PHRVK</xsl:when>
         <xsl:when test="$abt='005'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LESESAAL')">UMLS</xsl:when>
             <xsl:when test="contains($standort,'LBS')">UMLBS</xsl:when>
             <xsl:otherwise>UMFH</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='006'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LEHRBUCH')">MINTLBS</xsl:when>
             <xsl:when test="contains($standort,'Handapparat')">MINTFAK</xsl:when>
             <xsl:otherwise>MINT</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='009'">FBMPI</xsl:when>	
         <xsl:when test="$abt='016'">
           <xsl:choose>
             <xsl:when test="contains($standort,'Magazin') or contains($standort,'Rara')">THRARA</xsl:when>
             <xsl:when test="contains($standort,'LEHRBUCH')">THLBS</xsl:when>
             <xsl:when test="contains($standort,'Büro') or contains($standort,'büro')">THFAK</xsl:when>
             <xsl:when test="contains($standort,'Psychologie')">THPSYCH</xsl:when>
             <xsl:otherwise>TH</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='018'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LEHRBUCH')">RWLBS</xsl:when>
             <xsl:when test="contains($standort,'Magazin')">RWMAG</xsl:when>
             <xsl:otherwise>RW</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='019'">
           <xsl:choose>
             <xsl:when test="$onorder">GHZEB</xsl:when>
             <xsl:when test="contains($standort,'Fernleihe Lesesaal')">GHFLLS</xsl:when>
             <xsl:when test="contains($standort,'Fernleihe')">GHFL</xsl:when>
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
         <xsl:when test="$abt='035'">UMRMED</xsl:when>
         <xsl:when test="$abt='043'">UMPSY</xsl:when>
         <xsl:when test="$abt='054'">UMZMK</xsl:when>
         <xsl:when test="$abt='058'">PHPHI</xsl:when>
         <xsl:when test="$abt='066'">
	    <xsl:choose>
             <xsl:when test="contains($standort,'AMA')">RWAMA</xsl:when>
             <xsl:otherwise>RWETH</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
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
         <xsl:when test="$abt='080'">RWTURK</xsl:when>
         <xsl:when test="$abt='082'">FBÄGYPT</xsl:when>
         <xsl:when test="$abt='083'">PHKLW</xsl:when>
         <xsl:when test="$abt='085'">FBAVFGA</xsl:when>
         <xsl:when test="$abt='086'">PHALG</xsl:when>
         <xsl:when test="$abt='087'">PHBYZ</xsl:when>
         <xsl:when test="$abt='088'">PHMNG</xsl:when>
         <xsl:when test="$abt='090'">PHBUW</xsl:when>
         <xsl:when test="$abt='091'">
           <xsl:choose>
             <xsl:when test="contains($standort,'Separiert')">PHMUWMAG</xsl:when>
             <xsl:otherwise>PHMUW</xsl:otherwise>
           </xsl:choose>
	</xsl:when>
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
         <xsl:when test="$abt='112'">
             <xsl:choose>
               <xsl:when test="contains($standort,'Freihand')">PHHFMFREI</xsl:when>
               <xsl:otherwise>PHHFMMAG</xsl:otherwise>
             </xsl:choose>
           </xsl:when>
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
        <xsl:when test="(.='dummy') or (.='aufsatz')">dummy</xsl:when>
        <xsl:when test="(.='') or (.='u')">u ausleihbar (auch Fernleihe)</xsl:when>
        <xsl:when test=".='b'">b Kurzausleihe</xsl:when>
        <xsl:when test=".='c'">c Lehrbuchsammlung</xsl:when>
        <xsl:when test=".='s'">s Präsenzbestand Lesesaal</xsl:when>
        <xsl:when test=".='d'">d ausleihbar (keine Fernleihe)</xsl:when>
        <xsl:when test=".='i'">i nur für den Lesesaal</xsl:when>
        <xsl:when test=".='e'">e vermisst</xsl:when>
        <xsl:when test=".='g'">g nicht ausleihbar</xsl:when>
        <xsl:when test=".='a'">a bestellt</xsl:when>
        <xsl:when test=".='z'">z Verlust</xsl:when>
        <xsl:when test=".='1'">1 Fernleihe - ausleihbar ohne Verl.</xsl:when>
        <xsl:when test=".='2'">2 Fernleihe - ausleihbar mit Verl.</xsl:when>
        <xsl:when test=".='3'">3 Fernleihe - Kurzausleihe ohne Verl.</xsl:when>
        <xsl:otherwise>unbekannt</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <xsl:template match="discoverySuppress"> <!-- add: substring(., 1, 4) = 'true') or -->
    <discoverySuppress>
      <xsl:value-of select="(substring(., 1, 4) = 'true') or (substring(., 1, 1) = 'g') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/>           
    </discoverySuppress>
  </xsl:template>

  <xsl:template match="i[holdingsNoteTypeId='Standort (8201)']"> <!-- 8201 will be displayed by default: add exceptions here -->
    <xsl:variable name="i" select="key('original',../../../permanentLocationId)"/>
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:if test="not(($abt='000' and (./note='FREIHAND' or ./note='LBS' or ./note='LESESAAL' or ./note='RARA' or ./note='MAG')) or
	  ($abt='002' and (./note='Erziehungswissenschaft' or ./note='Filmwissenschaft' or ./note='Journalistik' or ./note='Politikwissenschaft' or ./note='Psychologie' or ./note='Publizistik' or ./note='Soziologie')) or
	  ($abt='003' and (./note='LESESAAL')) or
	  ($abt='005' and (./note='UM LESESAAL' or ./note='UM LBS' or ./note='UM FREIHAND')) or
	  ($abt='006' and (./note='MIN' or ./note='MIN LEHRBUCHSAMMLUNG')) or
	  ($abt='016' and (./note='Theologie LEHRBUCHSAMMLUNG')) or
	  ($abt='018' and (./note='ReWi LEHRBUCHSAMMLUNG')) or
	  ($abt='019' and (./note='Lehrbuchsammlung' or ./note='Lesesaal' or ./note='Magazin')) or
	  ($abt='034' and (./note='FB 4-40')) or
	  ($abt='035' and (./note='Institut für Rechtsmedizin')) or
	  ($abt='043' and (./note='Klinik für Psychiatrie und Psychotherapie')) or
	  ($abt='054' and (./note='Zahnklinik')) or
	  ($abt='058' and (./note='Philosophie')) or
	  ($abt='066' and (./note='ReWi / Ethnologie und Afrikastudien' or ./note='AMA - African Music Archives')) or
	  ($abt='069' and (./note='Psychologisches Institut / IB')) or
	  ($abt='070' and (./note='Germanistik')) or
	  ($abt='071' and (./note='Allgemeine und Vergleichende Literaturwissenschaft')) or
	  ($abt='072' and (./note='Anglistik/Amerikanistik')) or
	  ($abt='073' and (./note='Allgemeine und Vergleichende Sprachwissenschaft')) or
	  ($abt='074' and (./note='Romanistik')) or
	  ($abt='075' and (./note='Slavistik')) or
	  ($abt='076' and (./note='Polonicum')) or
	  ($abt='077' and (./note='Klassische Philologie')) or
	  ($abt='078' and (./note='Klassische Archäologie')) or
	  ($abt='079' and (./note='Kunstgeschichte')) or
	  ($abt='080' and (./note='Turkologie')) or
	  ($abt='082' and (./note='Ägyptologie und Altorientalistik')) or
	  ($abt='083' and (./note='Historische Kulturwissenschaften')) or
	  ($abt='085' and (./note='Institut für Vor- und Frühgeschichte' or ./note='Vor- und frühgeschichtliche Archäologie' or ./note='FB 16.1')) or
	  ($abt='086' and (./note='Alte Geschichte')) or
	  ($abt='087' and (./note='Byzantinistik')) or
	  ($abt='088' and (./note='Mittlere und Neuere Geschichte')) or
	  ($abt='090' and (./note='Buchwissenschaft')) or
	  ($abt='091' and (./note='Musikwissenschaft' or ./note='Musikwissenschaft / Separiert')) or
	  ($abt='092' and (./note='Osteuropäische Geschichte')) or
	  ($abt='094' and (./note='Institut für Geschichtliche Landeskunde')) or
	  ($abt='112' and (./note='Hochschule für Musik' or ./note='Hochschule für Musik / Freihand' or ./note='Hochschule für Musik / Magazin')) or
	  ($abt='113' and (./note='Sport')) or	
	  ($abt='124' and (./note='Gesangbucharchiv')) or
	  ($abt='125' and (./note='MAG')) or
	  ($abt='126' and (./note='USA BIBL')))">
        <i>
          <note>
              <xsl:value-of select="./note"/>
          </note>
          <xsl:copy-of select="*[name(.)!='note']"/>
        </i>
    </xsl:if>
  </xsl:template>

<!-- Parsing call number for prefix - optional -->

  <xsl:template match="callNumber">
    <xsl:variable name="i" select="key('original',../permanentLocationId)"/>
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/> 
    <xsl:choose>
      <xsl:when test="($abt='016' and (starts-with(., 'THEMAG ') or starts-with(., 'THERARA '))) or 
        ($abt='000' and (starts-with(., 'RARA ') and not(contains(.,'°')))) or
        ($abt='019' and (starts-with(.,'CELA') or starts-with(.,'CELTRA') or starts-with(.,'LBS') or starts-with(.,'MAG') or starts-with(.,'SSC'))) or
        ($abt='120' and ($standort='Medienkulturwissenschaft' or $standort='Alltagsmedien')) or
        ($abt='003') or ($abt='004') or
        ($abt='002' and (starts-with(., '400 ') or starts-with(., '410 ') or starts-with(., '430 ') or starts-with(., '480 ')) and $standort='Politikwissenschaft / Bibliothek Inklusive Politische Bildung') or
        ($abt='005' and (starts-with(., '700 ') or starts-with(., '710 '))) or
        ($abt='054' and (starts-with(., '798 ') or starts-with(., '791 '))) or
        (($abt='127') and not(starts-with(.,'SI ') or starts-with(.,'SK ')))"> <!-- RVK-Bereiche und Verwandtes -->
        <xsl:choose>
          <xsl:when test="contains(.,' ')">
            <callNumberPrefix>
              <xsl:value-of select="normalize-space(substring-before(.,' '))"/>
            </callNumberPrefix>
            <callNumber>
              <xsl:value-of select="normalize-space(substring-after(.,' '))"/>
            </callNumber>
          </xsl:when>
          <xsl:otherwise>
            <callNumberPrefix/>
            <callNumber>
              <xsl:value-of select="."/>
            </callNumber>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="cnprefix">
          <xsl:choose>
            <xsl:when test="contains(.,'°')">
              <xsl:value-of select="concat(substring-before(.,'°'),'°')"/>
            </xsl:when>
            <xsl:when test="contains(.,'@')">
              <xsl:value-of select="substring-before(.,'@')"/> 
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <callNumberPrefix>
          <xsl:value-of select="normalize-space(translate($cnprefix,'@',''))"/>
        </callNumberPrefix>
        <callNumber>
          <xsl:value-of select="normalize-space(translate(substring-after(.,$cnprefix),'@',''))"/>
        </callNumber>
      </xsl:otherwise>
    </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
