<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <!-- ILN 25 UB Mainz -->
  
  <xsl:template match="record[not(delete)]">
    <record>
      <xsl:copy-of select="original"/>
      <instance>
        <source>hebis</source>
        <hrid><xsl:value-of select="instance/hrid"/></hrid>
        <xsl:apply-templates select="instance/*[not(self::hrid or self::source or self::administrativeNotes)]"/>
        <administrativeNotes>
          <arr>
            <xsl:apply-templates select="instance/administrativeNotes/arr/*"/>
            <i><xsl:value-of select="concat('Hebis-Instanz hebis-PPN: ',instance/hrid)"/></i>
          </arr>
        </administrativeNotes>
      <!-- TBD: lokale Schlagwortsysteme
        <subjects>
          <arr>
            <xsl:for-each select="original/datafield[@tag='145Z']/subfield[@code='a']">
              <i><value><xsl:value-of select="."/></value></i>
            </xsl:for-each>
          </arr>
        </subjects> -->
      </instance>
      <xsl:apply-templates select="instanceRelations|processing"/>
      <xsl:variable name="original" select="original"/>
      <holdingsRecords>
        <arr>
          <xsl:for-each select="holdingsRecords/arr/i">
            <i>
              <xsl:apply-templates select="*[not(self::administrativeNotes)]"/>
              <administrativeNotes>
                <arr>
                  <xsl:apply-templates select="administrativeNotes/arr/*"/>
                  <i><xsl:value-of select="concat(translate($original/item[@epn=current()/hrid]/datafield[@tag='201B']/subfield[@code='0'], '-', '.'),', ', substring($original/item[@epn=current()/hrid]/datafield[@tag='201B']/subfield[@code='t'],1,5), ' (Letzte Änderung CBS)')"/></i>
                  <i><xsl:value-of select="concat('Datenursprung Hebis hebis-EPN: ',hrid)"/></i>
                </arr>
              </administrativeNotes>
            </i>
          </xsl:for-each>
        </arr>
      </holdingsRecords>
    </record>
  </xsl:template>

  <xsl:template match="processing[parent::delete]">
        <processing> <!-- overwrites hebis default -->
          <item>
            <blockDeletion>
              <ifField>hrid</ifField>
              <matchesPattern>.*</matchesPattern>
            </blockDeletion>
          </item>
          <holdingsRecord>
            <blockDeletion>
              <ifField>hrid</ifField>
              <matchesPattern>.*</matchesPattern>
            </blockDeletion>
            <statisticalCoding>
              <arr>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>ITEM_STATUS</becauseOf>
                  <setCode>ITEM_STATUS</setCode>
                </i>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>HOLDINGS_RECORD_PATTERN_MATCH</becauseOf>
                  <setCode>HOLDINGS_RECORD_PATTERN_MATCH</setCode>
                </i> 
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>ITEM_PATTERN_MATCH</becauseOf>
                  <setCode>ITEM_PATTERN_MATCH</setCode>
                </i> 
              </arr>
            </statisticalCoding>
          </holdingsRecord>
          <instance>
            <statisticalCoding>
              <arr>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>PO_LINE_REFERENCE</becauseOf>
                  <setCode>PO_LINE_REFERENCE</setCode>
                </i>   
              </arr>
            </statisticalCoding>
          </instance>
        </processing>
  </xsl:template>
  
  <xsl:template match="processing[not(parent::delete)]">
    <processing> <!-- overwrites hebis default -->
      <item>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
          <xsl:if test="(substring(../original/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') or (substring(../original/datafield[@tag='002@']/subfield[@code='0'],2,2) != 'bv')">
            <forTheseProperties>
              <arr>
                <i>materialTypeId</i>
              </arr>
            </forTheseProperties>
          </xsl:if>
        </retainExistingValues>
        <status>
          <policy>retain</policy>
        </status>
        <retainOmittedRecord>
          <ifField>hrid</ifField>
          <matchesPattern>it.*</matchesPattern>
        </retainOmittedRecord>
        <!-- does not to work properly in Quesnelia 2024-12:
            - statistical code is not set in some cases (false neagtive)
            - statistical code is also set (false positive) in "retainOmittedRecord" protected cases
            - statistical code is also set (false positive) in holding transfer cases
            -> left out (in addition seems not to be needed)
          <statisticalCoding>
            <arr>
              <i>
                <if>deleteSkipped</if>
                <becauseOf>ITEM_STATUS</becauseOf>
                <setCode>ITEM_STATUS</setCode>
              </i>         
            </arr>
          </statisticalCoding> -->
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
      <instance>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
        </retainExistingValues>
      </instance>
    </processing>
  </xsl:template>

  <xsl:template match="materialTypeId"> <!-- Level 0/2: hebis wide and local -->
    <xsl:variable name="i" select="key('original',../../../../permanentLocationId)[last()]"/>
    <materialTypeId>
       <xsl:choose>
         <xsl:when test="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) != 'O') and (substring($i/../datafield[@tag='002@']/subfield[@code='0'],2,2) = 'bv')">Zeitschriftenband</xsl:when>
         <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
       </xsl:choose>
    </materialTypeId>
  </xsl:template>

  <xsl:template match="i[permanentLoanTypeId='dummy']"/>
  
  <xsl:template match="i[holdingsNoteTypeId='Letzte Änderung CBS']"/>

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)[last()]"/>
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="standort" select="upper-case($i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'])"/> 
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
             <xsl:when test="contains($standort,'FERNLEIHE LESESAAL')">ZBFLLS</xsl:when>
             <xsl:when test="contains($standort,'FERNLEIHE')">ZBFL</xsl:when>
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
             <xsl:when test="contains($standort,upper-case('Erziehungswissenschaft'))">GFGPÄD</xsl:when>
             <xsl:when test="contains($standort,upper-case('Filmwissenschaft'))">GFGFILM</xsl:when>
             <xsl:when test="contains($standort,upper-case('Journalistik'))">GFGJOUR</xsl:when>
             <xsl:when test="contains($standort,upper-case('Politikwissenschaft'))">GFGPOL</xsl:when>
             <xsl:when test="contains($standort,upper-case('Psychologie'))">GFGPSYCH</xsl:when>
             <xsl:when test="contains($standort,upper-case('Publizistik'))">GFGPUB</xsl:when>
             <xsl:when test="contains($standort,upper-case('Soziologie'))">GFGSOZ</xsl:when>
             <xsl:otherwise>GFGPÄD</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
		 <xsl:when test="$abt='003'">
           <xsl:choose>
             <xsl:when test="$onorder">ZBZEB</xsl:when>
             <xsl:otherwise>ZBLS</xsl:otherwise>
			     </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='004'">
           <xsl:choose>
             <xsl:when test="contains($standort,'NUMERUS')">PHNC</xsl:when>
             <xsl:otherwise>PHRVK</xsl:otherwise>
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
             <xsl:when test="contains($standort,'LEHRBUCH')">MINTLBS</xsl:when>
             <xsl:when test="contains($standort,'HANDAPPARAT')">MINTFAK</xsl:when>
             <xsl:otherwise>MINT</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='009'">FBMPI</xsl:when>	
         <xsl:when test="$abt='016'">
           <xsl:choose>
             <xsl:when test="contains($standort,'MAGAZIN') or contains($standort,'Rara')">THRARA</xsl:when>
             <xsl:when test="contains($standort,'LEHRBUCH')">THLBS</xsl:when>
             <xsl:when test="contains($standort,'BÜRO') or contains($standort,'büro')">THFAK</xsl:when>
             <xsl:when test="contains($standort,'PSYCHOLOGIE')">THPSYCH</xsl:when>
             <xsl:otherwise>TH</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='018'">
           <xsl:choose>
             <xsl:when test="contains($standort,'LEHRBUCH')">RWLBS</xsl:when>
             <xsl:when test="contains($standort,'MAGAZIN')">RWMAG</xsl:when>
             <xsl:when test="contains($standort,'RECHT')">RWR</xsl:when>
             <xsl:when test="contains($standort,'MEDIZIN')">RWM</xsl:when>
             <xsl:when test="contains($standort,'VWL') or contains($standort,'BWL') or contains($standort,'WIPÄD')">RWW</xsl:when>
             <xsl:otherwise>RW</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='019'">
           <xsl:choose>
             <xsl:when test="$onorder">GHZEB</xsl:when>
             <xsl:when test="contains($standort,upper-case('Fernleihe Lesesaal'))">GHFLLS</xsl:when>
             <xsl:when test="contains($standort,upper-case('Fernleihe'))">GHFL</xsl:when>
             <xsl:when test="contains($standort,upper-case('Handapparat'))">GHFAK</xsl:when>
             <xsl:when test="contains($standort,upper-case('Lehrbuch'))">GHLBS</xsl:when>
             <xsl:when test="contains($standort,upper-case('Lesesaal'))">GHLS</xsl:when>
             <xsl:when test="contains($standort,upper-case('Magazin'))">GHMAG</xsl:when>
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
	           <xsl:when test="contains($standort,'JAHN')">RWJAHN</xsl:when>
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
             <xsl:when test="contains($standort,upper-case('Separiert'))">PHMUWMAG</xsl:when>
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
               <xsl:when test="contains($standort,'FREIHAND')">PHHFMFREI</xsl:when>
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
      <xsl:choose>
        <xsl:when test="$abt='127'">
          <xsl:choose>
            <xsl:when test="contains($standort,'SONDERSTANDORT') or contains($standort,upper-case('Hegelstraße'))"><temporaryLocationId>PHSON</temporaryLocationId></xsl:when>
          </xsl:choose>
         </xsl:when>
       </xsl:choose>     
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
    <xsl:variable name="i" select="key('original',../../../permanentLocationId)[last()]"/>
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:if test="not(($abt='000' and (./note='FREIHAND' or ./note='LBS' or ./note='LESESAAL' or ./note='RARA' or ./note='MAG')) or
	  ($abt='002' and (./note='Erziehungswissenschaft' or ./note='Filmwissenschaft' or ./note='Journalistik' or ./note='Politikwissenschaft' or ./note='Psychologie' or ./note='Publizistik' or ./note='Soziologie')) or
	  ($abt='003' and (./note='LESESAAL')) or
	  ($abt='005' and (./note='UM LESESAAL' or ./note='UM LBS' or ./note='UM FREIHAND')) or
	  ($abt='006' and (./note='MIN' or ./note='MIN LEHRBUCHSAMMLUNG')) or
	  ($abt='016' and (./note='Theologie LEHRBUCHSAMMLUNG')) or
	  ($abt='018' and (./note='ReWi LEHRBUCHSAMMLUNG') or (./note='Recht') or (./note='VWL') or (./note='BWL')  or (./note='WiPäd') or (./note='Medizin')) or
	  ($abt='019' and (./note='Lehrbuchsammlung' or ./note='Lesesaal' or ./note='Magazin')) or
	  ($abt='034' and (./note='FB 4-40')) or
	  ($abt='035' and (./note='Institut für Rechtsmedizin')) or
	  ($abt='043' and (./note='Klinik für Psychiatrie und Psychotherapie')) or
	  ($abt='054' and (./note='Zahnklinik')) or
	  ($abt='058' and (./note='Philosophie')) or
	  ($abt='066' and (./note='ReWi / Ethnologie und Afrikastudien' or ./note='AMA - African Music Archives' or ./note='ReWi / Jahn-Bibliothek für Afrikanische Literaturen')) or 
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

<!-- multiple call number workaround  - TBD: Ansetzungsformen der weiteren Signaturen? -->

  <xsl:template match="notes">
    <xsl:variable name="i" select="key('original',../permanentLocationId)[last()]"/>
      <notes>
        <arr>
          <xsl:apply-templates select="arr/i[not(holdingsNoteTypeId='Signatur Ansetzungsform (7100)')]"/> 
        </arr>
      </notes>
  </xsl:template>
  
  <!-- Parsing call number for prefix - optional -->
  <xsl:template match="callNumber">
    <xsl:variable name="i" select="key('original',../permanentLocationId)[last()]"/>
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/> 
    <xsl:choose>
      <xsl:when test="matches(.,'^\d{3}\s[A-Z]{2}\s\d{3,6}.*') or matches(.,'^\d{3}\s[A-Z]\s\d{3}\.\d{3}.*') or starts-with(.,'INFO ')"> <!-- RVK-Signatur oder Magazin-Signatur -->
          <callNumberPrefix>
            <xsl:value-of select="substring-before(.,' ')"/>
          </callNumberPrefix>
          <callNumber>
            <xsl:value-of select="substring-after(.,' ')"/>
          </callNumber>
      </xsl:when>
      <xsl:when test="($abt='016' and (starts-with(., 'THEMAG ') or starts-with(., 'THERARA '))) or 
        ($abt='000' and (starts-with(., 'RARA ') and not(contains(.,'°')))) or
        ($abt='019' and (starts-with(.,'CELA') or starts-with(.,'CELTRA') or starts-with(.,'LBS') or starts-with(.,'MAG') or starts-with(.,'SSC'))) or
        ((($abt='079') or ($abt='080')) and starts-with(.,'GROSSFORMAT')) or
        (($abt='126') and (starts-with(.,'Oversize'))) or
        (($abt='127') and not(starts-with(.,'SI ') or starts-with(.,'SK ')))"> <!-- Leeerzeichen zur Abtrennung -->
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

  <xsl:template match="statisticalCodeIds">
    <xsl:variable name="i" select="key('original',../../../../permanentLocationId)[last()]"/> <!-- ILN -->
    <statisticalCodeIds>
      <arr>
        <xsl:if test="$i/datafield[(@tag='209B') and not(subfield[@code='x']='01' or subfield[@code='x']='02')]/subfield[@code='a']='LZA'">
          <i>LZA</i>
        </xsl:if>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

</xsl:stylesheet>