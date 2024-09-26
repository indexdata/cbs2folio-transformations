<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2023-07-20 (YYYY-MM-DD) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="collection">
    <collection>
      <xsl:apply-templates/>
    </collection>
  </xsl:template>
  <xsl:template match="record[./status='deleted']">
    <record>
      <delete>
        <hrid>
          <xsl:value-of select="./hrid"/>
        </hrid>
        <processing>
        <instance>
            <statisticalCoding>
              <arr>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>PO_LINE_REFERENCE</becauseOf>
                  <setCode>dcf1220f-5524-4f1e-8e40-5da3366e8478</setCode>
                </i>   
              </arr>
            </statisticalCoding> 
          </instance>
          <holdingsRecord>
            <blockDeletion>
              <ifField>hrid</ifField>
              <matchesPattern>\D+.*</matchesPattern>
            </blockDeletion>
          </holdingsRecord>
          <item>
            <blockDeletion>
              <ifField>hrid</ifField>
              <matchesPattern>\D+.*</matchesPattern>
            </blockDeletion>
          </item>
        </processing>
      </delete>
    </record>
  </xsl:template>
  <!-- hebis: added new templates -->
  <xsl:template name="parse-021x">
    <xsl:if test="subfield[@code='a']">
      <xsl:choose>
        <xsl:when test="./subfield[@code='a'][contains(., '@')]">
          <xsl:value-of select="concat(substring-before(./subfield[@code='a'], '@'), substring-after(./subfield[@code='a'], '@'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./subfield[@code='a']"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="subfield[@code='d']">
      <xsl:value-of select="concat(' : ', ./subfield[@code='d'])"/>
    </xsl:if>
    <xsl:if test="subfield[@code='e' or @code='h']">
      <xsl:value-of select="concat(' / ', ./subfield[@code='e' or @code='h'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='f']">
      <xsl:choose>
        <xsl:when test="./subfield[@code='f'][contains(., '@')]">
          <xsl:value-of select="concat(' = ', concat(substring-before(./subfield[@code='f'], '@'), substring-after(./subfield[@code='f'], '@')))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat(' = ', ./subfield[@code='f'])"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="subfield[@code='r']">
      <xsl:choose>
        <xsl:when test="./subfield[@code='r'][contains(., '@')]">
          <xsl:value-of select="concat(substring-before(./subfield[@code='r'], '@'), substring-after(./subfield[@code='r'], '@'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./subfield[@code='r']"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <xsl:template name="parse-036x">
    <xsl:choose>
      <xsl:when test="./subfield[@code='m']">
        <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='m']))"/>
        <xsl:if test="./subfield[@code='a']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='a'][contains(., '@')]">
              <xsl:value-of select="normalize-space(concat(', ', concat(substring-before(./subfield[@code='a'], '@'), substring-after(./subfield[@code='a'], '@'))))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="normalize-space(concat(', ', ./subfield[@code='a']))"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="./subfield[@code='a'][contains(., '@')]">
            <xsl:value-of select="normalize-space(concat('. ', concat(substring-before(./subfield[@code='a'], '@'), substring-after(./subfield[@code='a'], '@'))))"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='a']))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./subfield[@code='d']">
      <xsl:value-of select="concat(' : ', ./subfield[@code='d'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='e' or @code='h']">
      <xsl:value-of select="concat(' / ', ./subfield[@code='e' or @code='h'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='f']">
      <xsl:choose>
        <xsl:when test="./subfield[@code='f'][contains(., '@')]">
          <xsl:value-of select="normalize-space(concat(' = ', concat(substring-before(./subfield[@code='f'], '@'), substring-after(./subfield[@code='f'], '@'))))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(concat(' = ', ./subfield[@code='f']))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="./subfield[@code='l']">
      <xsl:value-of select="concat(' ; ', ./subfield[@code='l'])"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="record">
    <record>
      <processing>
        <holdingsRecord>
          <retainOmittedRecord>
            <ifField>hrid</ifField>
            <matchesPattern>\D+.*</matchesPattern>
          </retainOmittedRecord>
          <retainExistingValues>
            <forOmittedProperties>true</forOmittedProperties>
          </retainExistingValues>
          <statisticalCoding>
              <arr>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>HOLDINGS_RECORD_PATTERN_MATCH</becauseOf>
                  <setCode>ac9bae48-d14c-4414-919a-292d539f9967</setCode>
                </i> 
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>ITEM_PATTERN_MATCH</becauseOf>
                  <setCode>970b8b4e-ee88-4037-b954-a10ee75340f0</setCode>
                </i>           
              </arr>
            </statisticalCoding>
        </holdingsRecord>
        <item>
          <retainOmittedRecord>
            <ifField>hrid</ifField>
            <matchesPattern>\D+.*</matchesPattern>
          </retainOmittedRecord>
          <retainExistingValues>
            <forOmittedProperties>true</forOmittedProperties>
            <!-- Not applied at GBV but tested and working
                 <forTheseProperties>
                 <arr>
                 <i>yearCaption</i>
                 <i>statisticalCodeIds</i>
                 </arr>
                 </forTheseProperties>
            -->
          </retainExistingValues>
          <statisticalCoding>
              <arr>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>ITEM_STATUS</becauseOf>
                  <setCode>e7b3071c-8cc0-48cc-9cd0-dfc82c4e4602</setCode>
                </i>         
              </arr>
            </statisticalCoding>
          <status>
            <policy>overwrite</policy>
            <ifStatusWas>
              <arr>
                <i>
                  <name>On order</name>
                </i>
                <i>
                  <name>Available</name>
                </i>
                <i>
                  <name>Intellectual item</name>
                </i>
                <i>
                  <name>Missing</name>
                </i>
                <i>
                  <name>Restricted</name>
                </i>
                <i>
                  <name>Unknown</name>
                </i>
              </arr>
            </ifStatusWas>
          </status>
        </item>
      </processing>
      <original>
        <xsl:copy-of select="metadata/*"/>
      </original>
      <instance>
        <xsl:apply-templates select="metadata"/>
      </instance>
    </record>
  </xsl:template>
  <xsl:template match="metadata">
    <source>K10plus</source>
    <xsl:variable name="ppn" select="datafield[@tag='003@']/subfield[@code='0']"/>
    <hrid>
      <xsl:value-of select="$ppn"/>
    </hrid>
    <xsl:if test="datafield[@tag='002@']">
      <!-- mode of issuance -->
      <modeOfIssuanceId>
        <xsl:variable name="mii" select="substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1)"/>
        <xsl:variable name="noc" select="datafield[@tag='013D']/subfield[@code='9']"/>
        <xsl:choose>
          <xsl:when test="($noc='106354256' or $noc='32609296X' or $noc='344907406' or $noc='153776951') and ($mii='a' or $mii='f' or $mii='F' or $mii='s' or $mii='v')">integrierende Ressource</xsl:when>
          <xsl:when test="$mii='c'">mehrteilige Monografie</xsl:when>
          <xsl:when test="$mii='b' or $mii='d'">fortlaufende Ressource</xsl:when>
          <xsl:when test="$mii='z'">nicht spezifiziert</xsl:when>
          <xsl:otherwise>einzelne Einheit</xsl:otherwise>
        </xsl:choose>
      </modeOfIssuanceId>
    </xsl:if>
    
    <!-- Instance type ID (resource type) -->
    <instanceTypeId>
      <xsl:variable name="ctype" select="datafield[@tag='002C'][1]/subfield[@code='b']"/>
      <xsl:choose>
        <xsl:when test="$ctype='crd'">Kartografischer Datensatz</xsl:when>
        <xsl:when test="$ctype='cri'">Kartografisches Bild</xsl:when>
        <xsl:when test="$ctype='crm'">Kartografisches bewegtes Bild</xsl:when>
        <xsl:when test="$ctype='crt'">Kartografisches taktiles Bild</xsl:when>
        <xsl:when test="$ctype='crn'">Kartografische taktile dreidimensionale Form</xsl:when>
        <xsl:when test="$ctype='crf'">Kartografische dreidimensionale Form</xsl:when>
        <xsl:when test="$ctype='cod'">Computerdaten</xsl:when>
        <xsl:when test="$ctype='cop'">Computerprogramm</xsl:when>
        <xsl:when test="$ctype='ntv'">Bewegungsnotation</xsl:when>
        <xsl:when test="$ctype='ntm'">Noten</xsl:when>
        <xsl:when test="$ctype='prm'">Aufgeführte Musik</xsl:when>
        <xsl:when test="$ctype='snd'">Geräusche</xsl:when>
        <xsl:when test="$ctype='spw'">Gesprochenes Wort</xsl:when>
        <xsl:when test="$ctype='sti'">Unbewegtes Bild</xsl:when>
        <xsl:when test="$ctype='tci'">Taktiles Bild</xsl:when>
        <xsl:when test="$ctype='tcn'">Taktile Bewegungsnotation</xsl:when>
        <xsl:when test="$ctype='tcm'">Taktile Noten</xsl:when>
        <xsl:when test="$ctype='tct'">Taktiler Text</xsl:when>
        <xsl:when test="$ctype='tcf'">Taktile dreidimensionale Form</xsl:when>
        <xsl:when test="$ctype='txt'">Text</xsl:when>
        <xsl:when test="$ctype='tdf'">Dreidimensionale Form</xsl:when>
        <xsl:when test="$ctype='tdm'">Dreidimensionales bewegtes Bild</xsl:when>
        <xsl:when test="$ctype='tdi'">Zweidimensionales bewegtes Bild</xsl:when>
        <xsl:when test="$ctype='zzz'">Nicht spezifiziert</xsl:when>
        <xsl:when test="$ctype='xxx'">Sonstige</xsl:when>
        <xsl:otherwise>Nicht spezifiziert</xsl:otherwise>
      </xsl:choose>
    </instanceTypeId>
    
    <!-- Formats -->
    <instanceFormatIds>
      <arr>
        <xsl:choose>
          <xsl:when test="datafield[@tag='002E']">
            <xsl:for-each select="datafield[@tag='002E']">
              <i>
                <xsl:choose>
                  <xsl:when test="./subfield[@code='b']='sb'">Audio - Audio Belt</xsl:when>
                  <xsl:when test="./subfield[@code='b']='sg'">Audio - Audiocartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ss'">Audio - Audiokassette</xsl:when>
                  <xsl:when test="./subfield[@code='b']='se'">Audio - Phonographenzylinder</xsl:when>
                  <xsl:when test="./subfield[@code='b']='sd'">Audio - Audiodisk</xsl:when>
                  <xsl:when test="./subfield[@code='b']='sq'">Audio - Notenrolle</xsl:when>
                  <xsl:when test="./subfield[@code='b']='st'">Audio - Tonbandspule</xsl:when>
                  <xsl:when test="./subfield[@code='b']='sw'">Audio - Audio Wire Reel</xsl:when>
                  <xsl:when test="./subfield[@code='b']='sz'">Audio - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='si'">Audio - Tonspurspule</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ck'">Computermedien - Speicherkarte</xsl:when>
                  <xsl:when test="./subfield[@code='b']='cb'">Computermedien - Computerchip-Cartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='cd'">Computermedien - Computerdisk</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ce'">Computermedien - Computerdisk-Cartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ca'">Computermedien - Magnetbandcartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='cf'">Computermedien - Magnetbandkassette</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ch'">Computermedien - Magnetbandspule</xsl:when>
                  <xsl:when test="./subfield[@code='b']='cr'">Computermedien - Online-Ressource</xsl:when>
                  <xsl:when test="./subfield[@code='b']='cz'">Computermedien - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ha'">Mikroform - Mikrofilmlochkarte</xsl:when>
                  <xsl:when test="./subfield[@code='b']='he'">Mikroform - Mikrofiche</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hf'">Mikroform - Mikrofichekassette</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hb'">Mikroform - Mikrofilm-Cartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hc'">Mikroform - Mikrofilmkassette</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hd'">Mikroform - Mikrofilmspule</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hj'">Mikroform - Mikrofilmrolle</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hh'">Mikroform - Mikrofilmstreifen</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hg'">Mikroform - Lichtundurchlässiger Mikrofiche</xsl:when>
                  <xsl:when test="./subfield[@code='b']='hz'">Mikroform - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='pp'">Mikroskopisch - Objektträger</xsl:when>
                  <xsl:when test="./subfield[@code='b']='pz'">Mikroskopisch - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='mc'">Projizierbar - Filmdose</xsl:when>
                  <xsl:when test="./subfield[@code='b']='mf'">Projizierbar - Filmkassette</xsl:when>
                  <xsl:when test="./subfield[@code='b']='mr'">Projizierbar - Filmspule</xsl:when>
                  <xsl:when test="./subfield[@code='b']='mo'">Projizierbar - Filmrolle</xsl:when>
                  <xsl:when test="./subfield[@code='b']='gd'">Projizierbar - Filmstreifen</xsl:when>
                  <xsl:when test="./subfield[@code='b']='gf'">Projizierbar - Filmstreifen für Einzelbildvorführung</xsl:when>
                  <xsl:when test="./subfield[@code='b']='gc'">Projizierbar - Filmstreifen-Cartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='mz'">Projizierbar - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='gt'">Projizierbar - Overheadfolie</xsl:when>
                  <xsl:when test="./subfield[@code='b']='gs'">Projizierbar - Dia</xsl:when>
                  <xsl:when test="./subfield[@code='b']='ez'">Stereografisch - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='eh'">Stereografisch - Stereobild</xsl:when>
                  <xsl:when test="./subfield[@code='b']='es'">Stereografisch - Stereografische Disk</xsl:when>
                  <xsl:when test="./subfield[@code='b']='no'">Ohne Hilfsmittel zu benutzen - Karte</xsl:when>
                  <xsl:when test="./subfield[@code='b']='nn'">Ohne Hilfsmittel zu benutzen - Flipchart</xsl:when>
                  <xsl:when test="./subfield[@code='b']='nr'">Ohne Hilfsmittel zu benutzen - Gegenstand</xsl:when>
                  <xsl:when test="./subfield[@code='b']='nz'">Ohne Hilfsmittel zu benutzen - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='na'">Ohne Hilfsmittel zu benutzen - Rolle</xsl:when>
                  <xsl:when test="./subfield[@code='b']='nb'">Ohne Hilfsmittel zu benutzen - Blatt</xsl:when>
                  <xsl:when test="./subfield[@code='b']='nc'">Ohne Hilfsmittel zu benutzen - Band</xsl:when>
                  <xsl:when test="./subfield[@code='b']='zu'">Nicht spezifiziert - Nicht spezifiziert</xsl:when>
                  <xsl:when test="./subfield[@code='b']='vz'">Video - Sonstige</xsl:when>
                  <xsl:when test="./subfield[@code='b']='vc'">Video - Videocartridge</xsl:when>
                  <xsl:when test="./subfield[@code='b']='vf'">Video - Videokassette</xsl:when>
                  <xsl:when test="./subfield[@code='b']='vd'">Video - Videodisk</xsl:when>
                  <xsl:when test="./subfield[@code='b']='vr'">Video - Videobandspule</xsl:when>
                </xsl:choose>
              </i>
            </xsl:for-each>
          </xsl:when>
          <!-- hebis: added default "unspecified" -->
          <xsl:otherwise><i>Nicht spezifiziert - Nicht spezifiziert</i></xsl:otherwise>
          <!-- unspecified -->
        </xsl:choose>
      </arr>
    </instanceFormatIds>
    <!-- Identifiers -->
    <identifiers>
      <arr>
        <xsl:for-each select="datafield[@tag='003S' or @tag='003@' or @tag='004A' or @tag='004P' or @tag='004J' or @tag='004K' or @tag='004D' or @tag='005A' or @tag='005I' or @tag='005P' or @tag='005B' or @tag='004F' or @tag='004M' or @tag='004I' or @tag='006A' or @tag='006B' or @tag='006G' or @tag='006T' or @tag='006U' or @tag='006Z' or @tag='006S' or @tag='006L' or @tag='006' or @tag='006V' or @tag='006W' or @tag='006M' or @tag='004V' or @tag='004R' or @tag='004W' or @tag='004L' or @tag='004C' or @tag='004U' or @tag='003O' or @tag='003T' or @tag='003D' or @tag='007C' or @tag='007D' or @tag='007G' or @tag='017L']">
          <xsl:choose>
            <xsl:when test="./@tag='004A' or @tag='004D' or @tag='004P' or @tag='005A' or @tag='005P' or @tag='005B' or @tag='004F' or @tag='004M' or @tag='004I'">
              <xsl:variable name="id-value">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='f'] and ./subfield[@code='0']">
                    <xsl:value-of select="concat(./subfield[@code='0'],' ',./subfield[@code='f'])"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='f']">
                    <xsl:value-of select="./subfield[@code='f']"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='0']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='004A'">ISBN</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='a'">ISBN der parallelen Ausgabe auf einem anderen Datenträger</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='o'">ISBN der parallelen Ausgabe im Fernzugriff</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='p'">ISBN der parallelen Druckausgabe</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='u'">ISBN für parallele Ausgabe in einer anderen physischen Form</xsl:when>
                  <xsl:when test="./@tag='004P'">ISBN einer Manifestation in anderer physischer Form</xsl:when>
                  <xsl:when test="./@tag='005A'">ISSN</xsl:when>
                  <xsl:when test="./@tag='005B'">Invalid ISSN</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='a'">ISSN für parallele Ausgaben auf einem anderen Datenträger</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='o'">ISSN für parallele Ausgaben im Fernzugriff</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='p'">ISSN für parallele Druckausgaben</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='f'">Fehlerhafte ISSN der parallelen Ausgabe</xsl:when>
                  <xsl:when test="./@tag='005P'">ISSN paralleler Ausgaben</xsl:when>
                  <xsl:when test="./@tag='004D'">Invalid ISBN</xsl:when>
                  <xsl:when test="./@tag='004F'">ISMN</xsl:when>
                  <xsl:when test="./@tag='004M'">ISRN</xsl:when>
                  <xsl:when test="./@tag='004I'">Formal falsche ISMN</xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
            <xsl:when test="./@tag='007G' or @tag='007D'">
              <xsl:variable name="id-value">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='0']">
                    <xsl:value-of select="concat(./subfield[@code='i'],': ',./subfield[@code='0'])"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='i']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='007G'">Identnummer der erstkatalogisierenden Institution</xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
            <xsl:when test="./@tag='017L'">
              <xsl:variable name="id-value">
                <xsl:call-template name="join">
                  <xsl:with-param name="list" select="./subfield[@code='a' or @code='b' or @code='c' or @code='d']"/>
                  <xsl:with-param name="separator" select="' '"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='017L'">Produktsigel, Arbeitsfeld für sonstige Produktsigel</xsl:when>
                  <xsl:otherwise/>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
            <xsl:when test="./subfield[@code='0']">
              <xsl:variable name="id-value">
                <xsl:value-of select="./subfield[@code='0']"/>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='003O'">OCLC</xsl:when>
                  <xsl:when test="./@tag='003S'">PPN SWB</xsl:when>
                  <xsl:when test="./@tag='003@'">PPN</xsl:when>
                  <xsl:when test="./@tag='004J'">ISBN der Sekundärausgabe</xsl:when>
                  <xsl:when test="./@tag='004K'">Formal falsche ISBN der Sekundärausgabe</xsl:when>
                  <xsl:when test="./@tag='005I'">Autorisierte ISSN</xsl:when>
                  <xsl:when test="./@tag='006A'">LCCN</xsl:when>
                  <xsl:when test="./@tag='006G'">DNB-Nummer</xsl:when>
                  <xsl:when test="./@tag='004W'">Digital Object Identifier (DOI) im Druckwerk</xsl:when>
                  <xsl:when test="./@tag='003T'">SWB-OCLC-Nummer</xsl:when>
                  <xsl:when test="./@tag='006T'">CIP-Nummer</xsl:when>
                  <xsl:when test="./@tag='006U'">WV-Nummer</xsl:when>
                  <xsl:when test="./@tag='006Z'">ZDB-Nummer</xsl:when>
                  <xsl:when test="./@tag='006S'">SWB-PPN des umgelenkten Satzes</xsl:when>
                  <xsl:when test="./@tag='006L'">Weitere Verbundidentnummern</xsl:when>
                  <xsl:when test="./@tag='006X'">Identnummern weiterer Fremddatenlieferanten</xsl:when>
                  <xsl:when test="./@tag='003D'">PPN des umgelenkten GBV- bzw. K10plus-Satzes</xsl:when>
                  <xsl:when test="./@tag='006N'">Swets-Nummer</xsl:when>
                  <xsl:when test="./@tag='006V'">VD16-Nummer</xsl:when>
                  <xsl:when test="./@tag='006W'">VD17-Nummer</xsl:when>
                  <xsl:when test="./@tag='006M'">VD18-Nummer</xsl:when>
                  <xsl:when test="./@tag='007Y'">Sonstige Standardnummern</xsl:when>
                  <xsl:when test="./@tag='006Y'">Identnummern (allgemein)</xsl:when>
                  <xsl:when test="./@tag='007C'">CODEN</xsl:when>
                  <xsl:when test="./@tag='004L'">GTIN (vormals EAN)</xsl:when>
                  <xsl:when test="./@tag='004C'">Universal Product Code (UPC)</xsl:when>
                  <xsl:when test="./@tag='007D'">Verlags-, Produktions- und Bestellnummer</xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </arr>
    </identifiers>
    
    <!-- hebis: 
         - added missing tags and subfields (parts of multipart resources with dependent title, "contained works")
         - corrected order of tags and subfields, e.g. remainder of title and statement of responsibility of titles with subsets
         - separated transcription and Non Latin script
    -->
    
    <!-- title -->
    
    <!-- hebis: special feature at hebis, 036A/XY doesn't exist at GBV -->
    <xsl:variable name="title-036A">
      <xsl:for-each select="datafield[(@tag='036A') and (not(./subfield[@code='U']) or (substring(./subfield[@code='U'],1,4) = 'Latn'))]">
        <xsl:call-template name="parse-036x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-036A-ori">
      <xsl:for-each select="datafield[(@tag='036A') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
        <xsl:call-template name="parse-036x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-036C">
      <xsl:for-each select="datafield[(@tag='036C') and (not(./subfield[@code='U']) or (substring(./subfield[@code='U'],1,4) = 'Latn'))]">
        <xsl:call-template name="parse-036x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-036C-ori">
      <xsl:for-each select="datafield[(@tag='036C') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
        <xsl:call-template name="parse-036x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-036C-idx">
      <xsl:for-each select="datafield[(@tag='036C') and (not(./subfield[@code='U']) or (substring(./subfield[@code='U'],1,4) = 'Latn'))]">
        <xsl:if test="./subfield[@code='m']">
          <xsl:value-of select="concat(' ', ./subfield[@code='m'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='a']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='a'][contains(., '@')]">
              <xsl:value-of select="concat(' ', substring-after(./subfield[@code='a'], '@'))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(' ', ./subfield[@code='a'])"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./subfield[@code='d']">
          <xsl:value-of select="concat(' ', ./subfield[@code='d'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='e' or @code='h']">
          <xsl:value-of select="concat(' ', ./subfield[@code='e' or @code='h'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='f']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='f'][contains(., '@')]">
              <xsl:value-of select="concat(' ', substring-after(./subfield[@code='f'], '@'))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(' ', ./subfield[@code='f'])"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./subfield[@code='l']">
          <xsl:value-of select="concat(' ', ./subfield[@code='l'])"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021A">
      <xsl:for-each select="datafield[(@tag='021A') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:call-template name="parse-021x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021A-ori">
      <xsl:for-each select="datafield[(@tag='021A') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
        <xsl:call-template name="parse-021x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021A-idx">
      <xsl:for-each select="datafield[(@tag='021A') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:if test="./subfield[@code='a']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='a'][contains(., '@')]">
              <xsl:value-of select="substring-after(./subfield[@code='a'], '@')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="./subfield[@code='a']"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./subfield[@code='d']">
          <xsl:value-of select="concat(' ', ./subfield[@code='d'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='e' or @code='h']">
          <xsl:value-of select="concat(' ', ./subfield[@code='e' or @code='h'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='f']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='f'][contains(., '@')]">
              <xsl:value-of select="substring-after(./subfield[@code='f'], '@')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="./subfield[@code='f']"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./subfield[@code='r']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='r'][contains(., '@')]">
              <xsl:value-of select="substring-after(./subfield[@code='r'], '@')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="./subfield[@code='r']"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021C">
      <xsl:for-each select="datafield[(@tag='021C') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:choose>
          <xsl:when test="./subfield[@code='l']">
            <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='l']))"/>
            <xsl:if test="./subfield[@code='a']">
              <xsl:value-of select="concat(', ', translate(./subfield[@code='a'], '@', ''))"/>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(concat('. ', translate(./subfield[@code='a'], '@', '')))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021C-ori">
      <xsl:for-each select="datafield[@tag='021C']">
        <xsl:if test="(substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U']) ">
          <xsl:choose>
            <xsl:when test="./subfield[@code='l']">
              <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='l']))"/>
              <xsl:if test="./subfield[@code='a']">
                <xsl:value-of select="concat(', ', translate(./subfield[@code='a'], '@', ''))"/>
              </xsl:if>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="normalize-space(concat('. ', translate(./subfield[@code='a'], '@', '')))"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021C-idx">
      <xsl:for-each select="datafield[(@tag='021C') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:if test="./subfield[@code='l']">
          <xsl:value-of select="concat(' ', ./subfield[@code='l'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='a']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='a'][contains(., '@')]">
              <xsl:value-of select="concat(' ',substring-after(./subfield[@code='a'], '@'))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(' ', ./subfield[@code='a'])"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021G">
      <xsl:for-each select="datafield[(@tag='021G') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:value-of select="' | '"/>
        <xsl:call-template name="parse-021x"/>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="title-021M">
      <xsl:for-each select="datafield[(@tag='021M') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:value-of select="' | '"/>
        <xsl:call-template name="parse-021x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021M-ori">
      <xsl:for-each select="datafield[(@tag='021M') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
        <xsl:value-of select="' | '"/>
        <xsl:call-template name="parse-021x"/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021M-idx">
      <xsl:for-each select="datafield[(@tag='021M') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:value-of select="' '"/>
        <xsl:if test="./subfield[@code='a']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='a'][contains(., '@')]">
              <xsl:value-of select="substring-after(./subfield[@code='a'], '@')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="./subfield[@code='a']"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="./subfield[@code='d']">
          <xsl:value-of select="concat(' ', ./subfield[@code='d'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='e' or @code='h']">
          <xsl:value-of select="concat(' ', ./subfield[@code='e' or @code='h'])"/>
        </xsl:if>
        <xsl:if test="./subfield[@code='f']">
          <xsl:choose>
            <xsl:when test="./subfield[@code='f'][contains(., '@')]">
              <xsl:value-of select="substring-after(./subfield[@code='f'], '@')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="./subfield[@code='f']"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021N">
      <xsl:for-each select="datafield[(@tag='021N') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
        <xsl:if test="./subfield[@code='a']">
          <xsl:value-of select="./subfield[@code='a']"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="title-021N-ori">
      <xsl:for-each select="datafield[(@tag='021N') and ((substring(./subfield[@code='U'],1,4) != 'Latn') or not(./subfield[@code='U']))]">
        <xsl:if test="./subfield[@code='a']">
          <xsl:value-of select="./subfield[@code='a']"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <title>
      <xsl:choose>
        <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">
          <xsl:value-of select="normalize-space(substring-after($title-036C, '. '))"/>
          <xsl:if test="$title-021A != '' and boolean(substring($title-021A, 1, 1) != ' ')">
            <xsl:choose>
              <xsl:when test="datafield[@tag='036C'][last()]/subfield[@code='l']">
                <xsl:value-of select="concat(', ', $title-021A)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat(' ; ', $title-021A)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="$title-021A != '' and boolean(substring($title-021A, 1, 1) = ' ')">
            <xsl:value-of select="$title-021A"/>
          </xsl:if>
        </xsl:when> 
        
        <!-- TBD: need for adjustment at GBV? Not sure about the subfields in PXB-format -->
        <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f' or substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'v') and datafield[@tag='036E'] and $title-021A = ''">
          <xsl:for-each select="datafield[@tag='036E'][1]/subfield">
            <xsl:choose>
              <xsl:when test="@code='a'">
                <xsl:choose>
                  <xsl:when test="@code='a'[contains(., '@')]">
                    <xsl:value-of select="concat(substring-before(@code='a', '@'), substring-after(@code='a', '@'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="@code='h'">
                <xsl:value-of select="concat(' / ', .)"/>
              </xsl:when>
              <xsl:when test="@code='l' or @code='m'">
                <xsl:value-of select="concat(' ; ', .)"/>
              </xsl:when>
              <xsl:when test="@code='p'">
                <xsl:value-of select="concat('. ', .)"/>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:when> 
        
        <xsl:when test="$title-021A != ''">
          <xsl:value-of select="concat($title-021A, $title-021C)"/>
          <!-- hebis: ZDB special feature since RDA switch:
               Edition Statement instead of subseries -->
          <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'b') or boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'd')">
            <xsl:if test="datafield[@tag='032@']/subfield[@code='a'] != ''">
              <xsl:value-of select="concat('. ', datafield[@tag='032@']/subfield[@code='a'])"/>
            </xsl:if>
          </xsl:if>
          <xsl:if test="$title-021G != ''">
            <xsl:value-of select="$title-021G"/>
          </xsl:if>
          <xsl:if test="$title-021M != ''">
            <xsl:value-of select="$title-021M"/>
          </xsl:if>
          <xsl:if test="$title-021N != ''">
            <xsl:choose>
              <xsl:when test="boolean(substring($title-021N, 1, 1) = '/')">
                <xsl:value-of select="concat(' ', $title-021N)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat(' | ', $title-021N)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>KEIN TITEL, IM CBS PRÜFEN</xsl:otherwise>
      </xsl:choose>
    </title> 
    
    <indexTitle>
      <xsl:variable name="index-title">
        <xsl:choose>
          <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">
            <xsl:value-of select="$title-036C-idx"/>
            <xsl:if test="$title-021A-idx != ''">
              <xsl:value-of select="concat(' ', $title-021A-idx)"/>
            </xsl:if>
          </xsl:when>
          
          <!-- TBD: need for adjustment at GBV? Not sure about the subfields in PXB-format -->
          <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f' or substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'v') and datafield[@tag='036E'] and $title-021A = ''">
            <xsl:for-each select="datafield[@tag='036E'][1]/subfield">
              <xsl:choose>
                <xsl:when test="@code='a'">
                  <xsl:choose>
                    <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                      <xsl:value-of select="substring-after(., '@')"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="."/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:when test="@code='h' or @code='l' or @code='m' or @code='p'">
                  <xsl:value-of select="concat(' ', .)"/>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:when> 
          
          <xsl:when test="$title-021A-idx != ''">
            <xsl:value-of select="concat($title-021A-idx, ' ', $title-021C-idx)"/>
            <!-- hebis: ZDB special feature since the RDA switch:
                 Edition Statement instead of subseries -->
            <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'b') or boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'd')">
              <xsl:if test="datafield[@tag='032@']/subfield[@code='a'] != ''">
                <xsl:value-of select="concat('. ', datafield[@tag='032@']/subfield[@code='a'])"/>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$title-021M-idx != ''">
              <xsl:value-of select="$title-021M-idx"/>
            </xsl:if>
            <xsl:if test="$title-021N != ''">
              <xsl:value-of select="concat(' ', $title-021N)"/>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>KEIN TITEL, IM CBS PRÜFEN</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:value-of select="normalize-space(translate($index-title, '&#33;&#34;&#35;&#36;&#37;&#38;&#40;&#43;&#44;&#58;&#41;&#42;&#45;&#46;&#47;&#59;&#60;&#61;&#63;&#91;&#92;&#93;', ''))"/>  
    </indexTitle>
    
    <!-- Original Code
         <xsl:variable name="title-tag">
         <xsl:choose>
         <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">036C</xsl:when>
         <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036E']">036E</xsl:when>
         <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'v') and datafield[@tag='036F']/subfield[@code='8']">036F</xsl:when>
         <xsl:otherwise>021A</xsl:otherwise>
         </xsl:choose>
         </xsl:variable>
         <xsl:choose>
         <xsl:when test="datafield[@tag=$title-tag][1]">
         <xsl:for-each select="datafield[@tag=$title-tag][1]">
         <xsl:variable name="title-a" select="translate(./subfield[@code='a'], '@', '')"/>
         <xsl:variable name="title-d" select="./subfield[@code='d']"/>
         <xsl:variable name="title-h" select="./subfield[@code='h']"/>
         <xsl:variable name="title-dx" select="substring-after(./subfield[@code='a'], '@')"/>
         <xsl:variable name="title-8" select="substring-before(./subfield[@code='8'], ' ; ZDB-ID:')"/>
         <xsl:variable name="title-l">
         <xsl:choose>
         <xsl:when test="./subfield[@code='l']">
         <xsl:value-of select="concat(' (', ./subfield[@code='l'], ')')"/>
         </xsl:when>
         <xsl:otherwise/>
         </xsl:choose>
         </xsl:variable>
         <xsl:variable name="title-f">
         <xsl:choose>
         <xsl:when test="./subfield[@code='f']">
         <xsl:value-of select="concat(' = ', ./subfield[@code='f'])"/>
         </xsl:when>
         <xsl:otherwise/>
         </xsl:choose>
         </xsl:variable>
         <xsl:variable name="title-p">
         <xsl:for-each select="../datafield[@tag='021C']">
         <xsl:value-of select="normalize-space(concat(./subfield[@code='l'], ' ', ./subfield[@code='a']))"/>
         <xsl:if test="position() != last()">
         <xsl:value-of select="string('. ')"/>
         </xsl:if>
         </xsl:for-each>
         </xsl:variable>
         <indexTitle>
         <xsl:choose>
         <xsl:when test="$title-dx">
         <xsl:value-of select="normalize-space(concat($title-dx, ' ', $title-d, ' ', $title-h))"/>
         </xsl:when>
         <xsl:otherwise>
         <xsl:value-of select="normalize-space(concat($title-a, ' ', $title-d, ' ', $title-h))"/>
         </xsl:otherwise>
         </xsl:choose>
         </indexTitle>
         <xsl:variable name="main-title">
         <xsl:choose>
         <xsl:when test="string($title-h) and string($title-d) and string($title-p)">
         <xsl:value-of select="concat($title-a, '. ', $title-p, ' : ', $title-d, $title-f, ' / ', $title-h)"/>
         </xsl:when>
         <xsl:when test="string($title-h) and string($title-d)">
         <xsl:value-of select="concat($title-a, ' : ', $title-d, $title-f, ' / ', $title-h)"/>
         </xsl:when>
         <xsl:when test="string($title-d) and string($title-p)">
         <xsl:value-of select="concat($title-a, '. ', $title-p, ' : ', $title-d, $title-f)"/>
         </xsl:when>
         <xsl:when test="string($title-h) and string($title-p)">
         <xsl:value-of select="concat($title-a, $title-f, '. ', $title-p, ' / ', $title-h)"/>
         </xsl:when>
         <xsl:when test="string($title-d)">
         <xsl:value-of select="concat($title-a, ' : ', $title-d, $title-f)"/>
         </xsl:when>
         <xsl:when test="string($title-h)">
         <xsl:value-of select="concat($title-a, $title-f, ' / ', $title-h)"/>
         </xsl:when>
         <xsl:when test="string($title-p)">
         <xsl:value-of select="concat($title-a, $title-f, '. ', $title-p)"/>
         </xsl:when>
         <xsl:when test="string($title-8)">
         <xsl:value-of select="$title-8"/>
         </xsl:when>
         <xsl:otherwise>
         <xsl:value-of select="concat($title-a, $title-f)"/>
         </xsl:otherwise>
         </xsl:choose>
         </xsl:variable>
         <title>
         <xsl:value-of select="concat($main-title,$title-l)"/>
         </title>
         </xsl:for-each>
         </xsl:when>
         <xsl:otherwise>
         <indexTitle>KEIN TITEL, IN K10plus PRÜFEN</indexTitle>
         <title>KEIN TITEL, IN K10plus PRÜFEN</title>
         </xsl:otherwise>
         </xsl:choose>  -->
    
    <!-- Alternative titles -->
    
    <!-- hebis: added missing tags: 021A + 036C (Non Latin script), 021M, 021N + 046D -->
    <alternativeTitles>
      <arr>
        <xsl:if test="datafield[@tag='047C' or @tag='027A' or @tag='021F' or @tag='046C' or @tag='046D' or @tag='026C' or @tag='036C' or @tag='021A'] or datafield[@tag='022A'][@occurrence='00']">
          
          <xsl:if test="not($title-021A-ori = '') or not($title-036C-ori = '') ">
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">
                    <xsl:value-of select="normalize-space(substring-after($title-036C-ori, '. '))"/>
                    <xsl:if test="$title-021A and boolean(substring($title-021A-ori, 1, 1) != ' ')">
                      <xsl:value-of select="concat(' ; ', $title-021A)"/>
                    </xsl:if>
                    <xsl:if test="$title-021A-ori  != '' and boolean(substring($title-021A-ori, 1, 1) = ' ')">
                      <xsl:value-of select="$title-021A-ori"/>
                    </xsl:if>
                  </xsl:when> 
                  <!-- TBD: need for adjustment at GBV
                       <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036E']">036E</xsl:when> 
                       <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'v') and datafield[@tag='036F']/subfield[@code='8']">036F</xsl:when> -->
                  <xsl:otherwise>
                    <xsl:value-of select="concat($title-021A-ori, $title-021C-ori)"/>
                    <!-- hebis: ZDB special feature since the RDA switch:
                         Edition Statement instead of subseries -->
                    <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'b') or boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'd')">
                      <xsl:if test="datafield[@tag='032@']/subfield[@code='a'] != ''">
                        <xsl:value-of select="concat('. ', datafield[@tag='032@']/subfield[@code='a'])"/>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="$title-021M-ori">
                      <xsl:value-of select="$title-021M-ori"/>
                    </xsl:if>
                    <xsl:choose>
                      <xsl:when test="boolean(substring($title-021N-ori, 1, 1) = '/')">
                        <xsl:value-of select="concat(' ', $title-021N-ori)"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat(' | ', $title-021N-ori)"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Sonstiger Titel</alternativeTitleTypeId>
            </i>
          </xsl:if>
          
          <xsl:for-each select="datafield[@tag='047C' or @tag='027A' or @tag='026C']">
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="concat(substring-before(./subfield[@code='a'], '@'), substring-after(./subfield[@code='a'], '@'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>
                <xsl:choose>
                  <xsl:when test="./@tag='027A'">Abweichender Titel</xsl:when>
                  <xsl:when test="./@tag='047C'">Teil des Titels</xsl:when>
                  <xsl:when test="./@tag='026C'">Spezifischer Titel</xsl:when>
                  <xsl:otherwise>Sonstiger Titel</xsl:otherwise>
                </xsl:choose>
              </alternativeTitleTypeId>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='021F']">
            <xsl:variable name="pta" select="./subfield[@code='a']"/>
            <xsl:variable name="ptd" select="./subfield[@code='d']"/>
            <xsl:variable name="pth" select="./subfield[@code='h']"/>
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="$ptd and $pth">
                    <xsl:value-of select="concat($pta, ' : ', $ptd, ' / ', $pth)"/>
                  </xsl:when>
                  <xsl:when test="$ptd">
                    <xsl:value-of select="concat($pta, ' : ', $ptd)"/>
                  </xsl:when>
                  <xsl:when test="$pth">
                    <xsl:value-of select="concat($pta, ' / ', $pth)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$pta"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Paralleltitel</alternativeTitleTypeId>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='046C']">
            <xsl:variable name="vti" select="./subfield[@code='i']"/>
            <xsl:variable name="vta">
              <xsl:if test="./subfield[@code='a']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="concat(substring-before(./subfield[@code='a'], '@'), substring-after(./subfield[@code='a'], '@'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:variable>
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="$vti and $vta">
                    <xsl:value-of select="concat($vti, ': ', $vta)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$vta"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Sonstiger Titel</alternativeTitleTypeId> 
            </i>
          </xsl:for-each>
          
          <!-- hebis: added missing tag -->
          <xsl:for-each select="datafield[@tag='046D']">
            <xsl:variable name="vti" select="./subfield[@code='i']"/>
            <xsl:variable name="vta">
              <xsl:if test="./subfield[@code='a']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="concat(substring-before(./subfield[@code='a'], '@'), substring-after(./subfield[@code='a'], '@'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:variable>
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="$vti and $vta">
                    <xsl:if test="./subfield[@code='z'] = 'e'">Frühester </xsl:if>
                    <xsl:value-of select="concat($vti, ': ', $vta)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$vta"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Sonstiger Titel</alternativeTitleTypeId>
            </i>
          </xsl:for-each>
          
          <!-- hebis: added missing subfields -->
          <xsl:for-each select="datafield[@tag='022A']">
            <i>
              <alternativeTitle>
                <xsl:variable name="con-name">
                  <xsl:choose>
                    <!-- TBD: need for discussion: Expansion
                         $8 solution won't work at GBV if there is a creator! -->
                    <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')] and ./subfield[@code='8'][contains(., '@')]">
                      <xsl:value-of select="substring-before(concat(substring-before(./subfield[@code='8'], '@'), substring-after(./subfield[@code='8'], '@')), ' ; ID:')"/>
                    </xsl:when>
                    <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')] and ./subfield[@code='8'][not(contains(., '@'))]">
                      <xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
                    </xsl:when>
                    <xsl:when test="./subfield[@code='8'][not(contains(., ' ; ID:'))] and ./subfield[@code='8'][contains(., '@')]">
                      <xsl:value-of select="concat(substring-before(./subfield[@code='8'], '@'), substring-after(./subfield[@code='8'], '@'))"/>
                    </xsl:when>
                    <xsl:when test="./subfield[@code='8'][not(contains(., ' ; ID:'))] and ./subfield[@code='8'][not(contains(., '@'))]">
                      <xsl:value-of select="./subfield[@code='8']"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="subfield">
                        <xsl:choose>
                          <xsl:when test="@code='a'">
                            <xsl:choose>
                              <xsl:when test="contains(., '@')">
                                <xsl:value-of select="concat(substring-before(., '@'), substring-after(., '@'))"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="."/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                          <xsl:when test="@code='f' or @code='g'">
                            <xsl:value-of select="concat(' (',.,')')"/>
                          </xsl:when>
                          <xsl:when test="@code='m' or @code='n'or @code='l' or @code='r' or @code='x'">
                            <xsl:value-of select="concat(', ',.)"/>
                          </xsl:when>
                          <xsl:when test="@code='p' or @code='s'">
                            <xsl:value-of select="concat('. ',.)"/>
                          </xsl:when>
                        </xsl:choose> 
                      </xsl:for-each>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:for-each select="subfield">
                    <xsl:choose>
                      <xsl:when test="@code='k' or @code='h'">
                        <xsl:value-of select="concat('. ',.)"/>
                      </xsl:when>
                      <xsl:when test="@code='o'">
                        <xsl:value-of select="concat('; ',.)"/>
                      </xsl:when>
                    </xsl:choose> 
                  </xsl:for-each>
                </xsl:variable>
                <xsl:value-of select="$con-name"/>
              </alternativeTitle>
              <alternativeTitleTypeId>Werktitel/Einheitssachtitel</alternativeTitleTypeId>
            </i>
          </xsl:for-each>
        </xsl:if>
      </arr>
    </alternativeTitles>
    
    <!-- Contributors -->
    <contributors>
      <xsl:if test="datafield[@tag='028A' or @tag='028B' or @tag='028C' or @tag='028G' or @tag='029A' or @tag='029F']">
        <arr>
          <xsl:for-each select="datafield[@tag='028A' or @tag='028B' or @tag='028C' or @tag='028G']">
            <xsl:if test="./subfield[@code='a' or @code='A' or @code='P' or @code='8']">
              <xsl:variable name="con-name">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')]">
                    <xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='8']">
                    <xsl:value-of select="./subfield[@code='8']"/>
                  </xsl:when>
                  <!-- hebis: added subfields and changed ISBD punctuation -->
                  <!-- hebis: removed capital letters D, C, N, L -->
                  <xsl:when test="./subfield[@code='a' or @code='P']">
                    <xsl:value-of select="./subfield[@code='a' or @code='P']"/>
                    <xsl:if test="./subfield[@code='d']">
                      <xsl:value-of select="concat(', ', ./subfield[@code='d'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='c']">
                      <xsl:value-of select="concat(' ', ./subfield[@code='c'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='n']">
                      <xsl:value-of select="concat(' ', ./subfield[@code='n'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='l']">
                      <xsl:value-of select="concat(', ', ./subfield[@code='l'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='h']">
                      <xsl:value-of select="concat(' *', ./subfield[@code='h'],'*')"/>
                    </xsl:if>
                  </xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($con-name) &gt; 0">
                <i>
                  <name>
                    <xsl:value-of select="$con-name"/>
                  </name>
                  <contributorNameTypeId>Personenname</contributorNameTypeId>
                  <!-- personal name -->
                  <xsl:if test="@tag='028A'">
                    <primary>true</primary>
                  </xsl:if>
                  <xsl:if test="./subfield[@code='4']">
                    <contributorTypeId>
                      <xsl:value-of select="./subfield[@code='4']"/>
                    </contributorTypeId>
                  </xsl:if>
                  <xsl:if test="./subfield[@code='B']">
                    <contributorTypeText>
                      <xsl:value-of select="./subfield[@code='B']"/>
                    </contributorTypeText>
                  </xsl:if>
                </i>
              </xsl:if>
            </xsl:if>
          </xsl:for-each>
          <!-- Corporate authors-->
          <!-- hebis: added subfields and changed ISBD punctuation -->
          <!-- hebis: removed capital letters A, B, D, G, N, X  -->
          <xsl:for-each select="datafield[@tag='029A' or @tag='029F']">
            <xsl:if test="./subfield[@code='a' or @code='8']">
              <xsl:variable name="con-name">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')]">
                    <xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='8']">
                    <xsl:value-of select="./subfield[@code='8']"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:when test="@code='x' or @code='g'">
                          <xsl:value-of select="concat(', ',.)"/>
                        </xsl:when>
                        <xsl:when test="@code='b'">
                          <xsl:value-of select="concat('. ',.)"/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                    <xsl:choose>
                      <xsl:when test="./subfield[@code='n']">
                        <xsl:value-of select="concat(' (',./subfield[@code='n'])"/>
                        <xsl:if test="./subfield[@code='d']">
                          <xsl:value-of select="concat(' : ',./subfield[@code='d'])"/>
                        </xsl:if>
                        <xsl:if test="./subfield[@code='c']">
                          <xsl:value-of select="concat(' : ',./subfield[@code='c'])"/>
                        </xsl:if>
                        <xsl:value-of select="')'"/>
                      </xsl:when>
                      <xsl:when test="./subfield[@code='d']">
                        <xsl:value-of select="concat(' (',./subfield[@code='d'])"/>
                        <xsl:if test="./subfield[@code='c']">
                          <xsl:value-of select="concat(' : ',./subfield[@code='c'])"/>
                        </xsl:if>
                        <xsl:value-of select="')'"/>
                      </xsl:when>
                      <xsl:when test="./subfield[@code='c']">
                        <xsl:value-of select="concat(' (',./subfield[@code='c'], ')')"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($con-name) &gt; 0">
                <i>
                  <name>
                    <xsl:value-of select="$con-name"/>
                  </name>
                  <contributorNameTypeId>Körperschaftsname</contributorNameTypeId>
                  <xsl:if test="./subfield[@code='4']">
                    <contributorTypeId>
                      <xsl:value-of select="./subfield[@code='4']"/>
                    </contributorTypeId>
                  </xsl:if>
                  <xsl:if test="./subfield[@code='B']">
                    <contributorTypeText>
                      <xsl:value-of select="./subfield[@code='B']"/>
                    </contributorTypeText>
                  </xsl:if>
                </i>
              </xsl:if>
            </xsl:if>
          </xsl:for-each>
        </arr>
      </xsl:if>
    </contributors>
    
    <!-- Publication -->
    <publication>
      <arr>
        <xsl:for-each select="datafield[@tag='033A' or @tag='033E' or @tag='033C']">
          <i>
            <place>
              <xsl:call-template name="join">
                <xsl:with-param name="list" select="./subfield[@code='p']"/>
                <xsl:with-param name="separator" select="' ; '"/>
              </xsl:call-template>
            </place>
            <publisher>
              <xsl:for-each select="./subfield[@code='n']">
                <xsl:variable name="pos" select="position()"/>
                <xsl:if test="../subfield[@code='z'][$pos] = 'e'">erster: </xsl:if>
                <xsl:if test="../subfield[@code='z'][$pos] = 'f'">früher: </xsl:if>
                <xsl:if test="../subfield[@code='z'][$pos] = 's'">später: </xsl:if>
                <xsl:value-of select="."/>
                <xsl:if test="../subfield[@code='h'][$pos]">
                  <xsl:value-of select="concat(' (', ../subfield[@code='h'][$pos], ')')"/>
                </xsl:if>
                <xsl:if test="$pos != last()"> ; </xsl:if>
              </xsl:for-each>
            </publisher>
            <xsl:if test="..//datafield[@tag='011@']">
              <dateOfPublication>
                <xsl:variable name="date-a" select="../datafield[@tag='011@']/subfield[@code='a']"/>
                <xsl:variable name="date-b" select="../datafield[@tag='011@']/subfield[@code='b']"/>
                <xsl:variable name="date-c" select="../datafield[@tag='011@']/subfield[@code='c']"/>
                <xsl:variable name="date-d" select="../datafield[@tag='011@']/subfield[@code='d']"/>
                <xsl:variable name="date-n" select="../datafield[@tag='011@']/subfield[@code='n']"/>
                <xsl:variable name="date-ab" select="concat($date-a, '-', $date-b)"/>
                <xsl:variable name="date-cd" select="concat($date-c, '-', $date-d)"/>
                <xsl:variable name="date-ac" select="concat($date-a, ' (', $date-c, ')')"/>
                <xsl:variable name="date-abcd" select="concat($date-ab, ' (', $date-cd, ')')"/>
                <xsl:choose>
                  <!-- hebis: If $n is present then only show $n -->
                  <xsl:when test="$date-n">
                    <xsl:value-of select="$date-n"/>
                  </xsl:when>
                  <xsl:when test="$date-d and $date-n">
                    <xsl:value-of select="concat($date-abcd, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:when test="$date-d">
                    <xsl:value-of select="$date-abcd"/>
                  </xsl:when>
                  <xsl:when test="$date-c and $date-n">
                    <xsl:value-of select="concat($date-ac, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:when test="$date-c">
                    <xsl:value-of select="$date-ac"/>
                  </xsl:when>
                  <xsl:when test="$date-b and $date-n">
                    <xsl:value-of select="concat($date-ab, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:when test="$date-b">
                    <xsl:value-of select="$date-ab"/>
                  </xsl:when>
                  <xsl:when test="$date-a and $date-n">
                    <xsl:value-of select="concat($date-a, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$date-a"/>
                  </xsl:otherwise>
                </xsl:choose>
              </dateOfPublication>
            </xsl:if>
            <role>
              <xsl:choose>
                <xsl:when test="./@tag = '033C'">Manufacturer</xsl:when>
                <xsl:when test="./@tag = '033E'">Distributor</xsl:when>
                <xsl:otherwise>Publisher</xsl:otherwise>
              </xsl:choose>
            </role>
          </i>
        </xsl:for-each>
      </arr>
    </publication>
    <!-- Publication frequency -->
    <xsl:if test="datafield[@tag='018@']">
      <publicationFrequency>
        <arr>
          <xsl:for-each select="datafield[@tag='018@']">
            <i>
              <xsl:choose>
                <xsl:when test="./subfield[@code='a']='d'">täglich</xsl:when>
                <xsl:when test="./subfield[@code='a']='t'">drei- bis fünfmal wöchentlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='c'">zweimal wöchentlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='w'">wöchentlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='j'">dreimal im Monat</xsl:when>
                <xsl:when test="./subfield[@code='a']='e'">vierzehntägig</xsl:when>
                <xsl:when test="./subfield[@code='a']='s'">halbmonatlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='m'">monatlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='b'">alle zwei Monate</xsl:when>
                <xsl:when test="./subfield[@code='a']='q'">vierteljährlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='i'">dreimal im Jahr</xsl:when>
                <xsl:when test="./subfield[@code='a']='f'">halbjährlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='a'">jährlich</xsl:when>
                <xsl:when test="./subfield[@code='a']='g'">alle zwei Jahre</xsl:when>
                <xsl:when test="./subfield[@code='a']='h'">alle drei Jahre</xsl:when>
                <xsl:when test="./subfield[@code='a']='z'">unregelmäßig</xsl:when>
                <xsl:otherwise/>
              </xsl:choose>
            </i>
          </xsl:for-each>
        </arr>
      </publicationFrequency>
    </xsl:if>
    <!-- Publication range -->
    <xsl:if test="datafield[@tag='031@']">
      <publicationRange>
        <arr>
          <i>
            <xsl:value-of select="datafield[@tag='031@']/subfield[@code='a']"/>
          </i>
        </arr>
      </publicationRange>
    </xsl:if>
    <!-- Electronic access -->
    <electronicAccess>
      <arr>
        <xsl:for-each select="datafield[@tag='009P' or @tag='017C' or @tag='109R']">
          <xsl:if test="./@tag='009P' and ./subfield[@code='a']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='a']"/>
              </uri>
              <materialsSpecification>
                <xsl:value-of select="./subfield[@code='3']"/>
              </materialsSpecification>
              <publicNote>
                <xsl:value-of select="./subfield[@code='4']"/>
              </publicNote>
              <relationshipId>Ressource</relationshipId>
              <!-- Resource -->
            </i>
          </xsl:if>
          <xsl:if test="./@tag='017C' and ./subfield[@code='u']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='u']"/>
              </uri>
              <materialsSpecification>
                <xsl:value-of select="./subfield[@code='3']"/>
              </materialsSpecification>
              <publicNote>
                <xsl:value-of select="./subfield[@code='4']"/>
              </publicNote>
              <relationshipId>Ressource</relationshipId>
              <!-- Resource -->
            </i>
          </xsl:if>
          <!-- Remove 017R from URL and move to instance notes
               <xsl:if test="./@tag='017R' and ./subfield[@code='u']">
               <i>
               <uri>
               <xsl:value-of select="./subfield[@code='u']"/>
               </uri>
               <materialsSpecification>
               <xsl:value-of select="./subfield[@code='g']"/>
               </materialsSpecification>
               <linkText>
               <xsl:value-of select="./subfield[@code='a']"/>
               </linkText>
               <relationshipId>0ce08069-8f5f-411b-b622-46674aa66a45</relationshipId>
               </i>
               </xsl:if>
          -->
          <!-- Remove 017M from URL and move to instance notes
               <xsl:if test="./@tag='017M' and ./subfield[@code='u']">
               <i>
               <uri>
               <xsl:value-of select="./subfield[@code='u']"/>
               </uri>
               <materialsSpecification>
               <xsl:value-of select="./subfield[@code='g']"/>
               </materialsSpecification>
               <linkText>
               <xsl:value-of select="./subfield[@code='a']"/>
               </linkText>
               <relationshipId>f781cb3d-af16-40f6-9d02-c24204ac6fdc</relationshipId>
               </i>
               </xsl:if>
          -->
          <xsl:if test="./@tag='109R' and ./subfield[@code='u']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='u']"/>
              </uri>
              <relationshipId>URL für Volltext und Kataloganreicherung (3433)</relationshipId>
              <!-- EZB-Frontpage (3433) -->
            </i>
          </xsl:if>
        </xsl:for-each>
      </arr>
    </electronicAccess>
    <!-- Notes -->
    <!-- hebis: added tags: 013E, 017M, 017R, 032X, 032Y, 032Z, 035E, 037C, 039B, 039C, 039D, 039E, 046K, 046M, 046S, 046U, 047I, 048H -->
    <xsl:if test="datafield[@tag='011B' or @tag='013E' or @tag='017M' or @tag='017R' or @tag='032X' or @tag='032Y' or @tag='032Z' or @tag='035E' or @tag='037A' or @tag='037C' or @tag='037I' or @tag='039B' or @tag='039C' or @tag='039D' or @tag='039E' or @tag='046P' or @tag='046L' or @tag='046K' or @tag='046M' or @tag='046S' or @tag='046U' or @tag='047I' or @tag='048H']">
      <notes>
        <arr>
          <xsl:for-each select="datafield[@tag='011B' or @tag='013E' or @tag='017M' or @tag='017R' or @tag='032X' or @tag='032Y' or @tag='032Z' or @tag='035E' or @tag='037A' or @tag='037C' or @tag='037I' or @tag='039B' or @tag='039C' or @tag='039D' or @tag='039E' or @tag='046P' or @tag='046K' or @tag='046L' or @tag='046M' or @tag='046S' or @tag='046U' or @tag='047I' or @tag='048H']">
            <i>
              <xsl:choose>
                <xsl:when test="./@tag='011B'">
                  <note>
                    <xsl:if test="./subfield[@code='b']">
                      <xsl:value-of select="concat(./subfield[@code='a'], '-', ./subfield[@code='b'])"/>
                    </xsl:if>
                    <xsl:if test="not(./subfield[@code='b'])">
                      <xsl:value-of select="./subfield[@code='a']"/>
                    </xsl:if>
                  </note>
                  <instanceNoteTypeId>Reproduction note</instanceNoteTypeId>
                </xsl:when>
                <xsl:when test="./@tag='037A'">
                  <note>
                    <xsl:choose>
                      <xsl:when test="./subfield[@code='A']">
                        <xsl:value-of select="concat(./subfield[@code='a'], ' (Quelle: ', ./subfield[@code='A'], ')')"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./subfield[@code='a']"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </note>
                  <instanceNoteTypeId>General note</instanceNoteTypeId>
                </xsl:when>
                <!-- hebis: added new tags for relations as text in order to depict introductory phrases, other qualifying information and horizontal relationships-->
                <!-- TBD: Need for discussion: Expansion -->
                <xsl:when test="./@tag='039B' or @tag='039C' or @tag='039D' or @tag='039E'">
                  <note>
                    <xsl:if test="./subfield[@code='i']">
                      <xsl:value-of select="./subfield[@code='i']"/>
                      <xsl:if test="./subfield[@code='n']">
                        <xsl:value-of select="concat(' ', ./subfield[@code='n'])"/>
                      </xsl:if>
                      <xsl:value-of select=" ': ' "/>
                    </xsl:if>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='8'">
                          <xsl:choose>
                            <xsl:when test="contains(., ' ; ID:') and contains(., '@')">
                              <xsl:value-of select="substring-before(concat(substring-before(., '@'), substring-after(., '@')), ' ; ID:')"/>
                            </xsl:when>
                            <xsl:when test="contains(., ' ; ID:') and not(contains(., '@'))">
                              <xsl:value-of select="substring-before(., ' ; ID:')"/>
                            </xsl:when>
                            <xsl:when test="not(contains(., ' ; ID:')) and contains(., '@')">
                              <xsl:value-of select="concat(substring-before(., '@'), substring-after(., '@'))"/>
                            </xsl:when>
                            <xsl:when test="not(contains(., ' ; ID:')) and not(contains(., '@'))">
                              <xsl:value-of select="."/>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:choose>
                            <xsl:when test="@code='a' or @code='t'">
                              <xsl:choose>
                                <xsl:when test="contains(., '@')">
                                  <xsl:value-of select="concat(substring-before(., '@'), substring-after(., '@'))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="."/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:when>
                            <xsl:when test="@code='l'">
                              <xsl:value-of select="concat( . , '. ' )"/>
                            </xsl:when>
                            <xsl:when test="@code='d' or @code='g' or @code='h' or @code='p'">
                              <xsl:value-of select="concat('. - ', . )"/>
                            </xsl:when>
                            <xsl:when test="@code='e'">
                              <xsl:value-of select="concat(' : ', . )"/>
                            </xsl:when>
                            <xsl:when test="@code='f'">
                              <xsl:value-of select="concat(', ', . )"/>
                            </xsl:when>
                            <xsl:when test="@code='C'">
                              <xsl:choose>
                                <xsl:when test="preceding-sibling::*[1]/@code='i' or preceding-sibling::*[1]/@code='n'">
                                  <xsl:if test=". = 'ISBN' or . = 'ISMN' or . = 'ISSN' or . = 'DOI' or . = 'URN'">
                                    <xsl:value-of select="concat(. ,' ',following-sibling::*[1])"/>
                                  </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:if test=". = 'ISBN' or . = 'ISMN' or . = 'ISSN' or . = 'DOI' or . = 'URN'">
                                    <xsl:value-of select="concat('. - ',  . ,' ',following-sibling::*[1])"/>
                                  </xsl:if>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:when>
                          </xsl:choose> 
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </note>
                  <xsl:choose>
                    <xsl:when test="./@tag='039C'">
                      <instanceNoteTypeId>Supplement note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='039D'">
                      <instanceNoteTypeId>Additional Physical Form Available note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:otherwise>
                      <instanceNoteTypeId>General note</instanceNoteTypeId>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                
                <!-- hebis: added new tag for "Dissertation note" -->
                <xsl:when test="./@tag='037C'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a' or @code='d'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:when test="@code='e' or @code='f'">
                          <xsl:value-of select="concat(', ',.)"/>
                        </xsl:when>
                        <xsl:when test="@code='g'">
                          <xsl:value-of select="concat(' (',.,')')"/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>Dissertation note</instanceNoteTypeId>
                </xsl:when>
                
                <!-- hebis: added new tag for "Format of notated music" -->
                <xsl:when test="./@tag='013E'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='8'">
                          <xsl:choose>
                            <xsl:when test="contains(., ' ; ID:')">
                              <xsl:value-of select="substring-before(., ' ; ID:')"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="."/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:when>
                        <xsl:when test="@code='a'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>Musikalische Ausgabeform</instanceNoteTypeId>
                </xsl:when> 
                
                <!-- hebis: added new tag for "Medium of Performance" -->
                <!-- TBD: authorities at GBV" -->
                <xsl:when test="./@tag='032X'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='8'">
                          <xsl:value-of select="substring-before(., ' ; ID:')"/>
                        </xsl:when>  
                        <xsl:when test="@code='s'">
                          <xsl:value-of select="concat('Instrumente/Solisten: ',.)"/>
                        </xsl:when>
                        <xsl:when test="@code='t'">
                          <xsl:value-of select="concat('Ensembles: ',.)"/>
                        </xsl:when>
                        <xsl:when test="@code='a' or @code='p'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:when test="@code='e' or @code='n'">
                          <xsl:value-of select="concat(' (',.,')')"/>
                        </xsl:when>
                        <xsl:when test="@code='v'">
                          <xsl:value-of select="concat(', ',.)"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>Besetzung</instanceNoteTypeId>
                </xsl:when> 
                
                <!-- hebis: added new tag for "Numeric Designation of Musical Work" -->
                <xsl:when test="./@tag='032Y'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a' or @code='b' or @code='c' or @code='d' or @code='e'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>Numerische Bezeichnung eines Musikwerks</instanceNoteTypeId>
                </xsl:when> 
                
                <!-- hebis: added new tag for "Key" -->
                <xsl:when test="./@tag='032Z'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a'">
                          <xsl:value-of select="concat(., ' (Original)')"/>
                        </xsl:when>
                        <xsl:when test="@code='b'">
                          <xsl:value-of select="concat(., ' (Fassung)')"/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>Tonart</instanceNoteTypeId>
                </xsl:when> 
                
                <!-- hebis: added new tag for "With note" -->
                <xsl:when test="./@tag='046M'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='u' or @code='a'">
                          <xsl:choose>
                            <xsl:when test="contains(., '@')">
                              <xsl:value-of select="concat(substring-before(., '@'), substring-after(., '@'))"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="."/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:when>
                        <xsl:when test="@code='h'">
                          <xsl:value-of select="concat(' / ',.)"/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>With note</instanceNoteTypeId>
                </xsl:when> 
                
                <xsl:otherwise>
                  <note>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </note>
                  <xsl:choose>
                    <xsl:when test="./@tag='046K'">
                      <instanceNoteTypeId>Voraussichtlicher Erscheinungstermin</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='046L'">
                      <instanceNoteTypeId>Language note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='046P'">
                      <instanceNoteTypeId>Numbering peculiarities note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='047I'">
                      <instanceNoteTypeId>Summary</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='037G'">
                      <instanceNoteTypeId>Reproduction note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='048H'">
                      <instanceNoteTypeId>System Details note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='017M'">
                      <instanceNoteTypeId>Terms Governing Use and Reproduction note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='017R'">
                      <instanceNoteTypeId>Restrictions on Access note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:otherwise>
                      <instanceNoteTypeId>General note</instanceNoteTypeId>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </i>
          </xsl:for-each>
        </arr>
      </notes>
    </xsl:if>
    <!-- Nature of contents -->
    <xsl:if test="datafield[@tag='013D']">
      <natureOfContentTermIds>
        <arr>
          <xsl:for-each select="datafield[@tag='013D']">
            <i>
              <xsl:choose>
                <xsl:when test="./subfield[@code='9']='10566491X'">Ausstellungskatalog</xsl:when>
                <xsl:when test="./subfield[@code='9']='106388258'">Autobiografie</xsl:when>
                <xsl:when test="./subfield[@code='9']='104814519'">Bibliografie</xsl:when>
                <xsl:when test="./subfield[@code='9']='104450835'">Bildband</xsl:when>
                <xsl:when test="./subfield[@code='9']='104213493'">Biografie</xsl:when>
                <xsl:when test="./subfield[@code='9']='104377402'">Comic</xsl:when>
                <xsl:when test="./subfield[@code='9']='104400986'">Festschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='105825778'">Hochschulschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='132098628'">Hörbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='826484824'">Konferenzschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='104628669'">Monografische Reihe</xsl:when>
                <xsl:when test="./subfield[@code='9']='104383704'">Schulbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='32609296X'">Website</xsl:when>
                <xsl:when test="./subfield[@code='9']='10454466X'">Zeitschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='106108832'">Zeitung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104589043'">Adressbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='326360107'">Altkarte</xsl:when>
                <xsl:when test="./subfield[@code='9']='105614165'">Amtliche Publikation</xsl:when>
                <xsl:when test="./subfield[@code='9']='104450878'">Anleitung</xsl:when>
                <xsl:when test="./subfield[@code='9']='106394134'">Anthologie</xsl:when>
                <xsl:when test="./subfield[@code='9']='105610909'">Antiquariatskatalog</xsl:when>
                <xsl:when test="./subfield[@code='9']='10466861X'">Anzeigenblatt</xsl:when>
                <xsl:when test="./subfield[@code='9']='105606529'">Atlas</xsl:when>
                <xsl:when test="./subfield[@code='9']='105605913'">Aufgabensammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='105605727'">Aufsatzsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='105605212'">Auktionskatalog</xsl:when>
                <xsl:when test="./subfield[@code='9']='104107030'">Autograf</xsl:when>
                <xsl:when test="./subfield[@code='9']='826646603'">Backbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104798521'">Beispielsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104616091'">Bericht</xsl:when>
                <xsl:when test="./subfield[@code='9']='105594474'">Bestimmungsbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='106376977'">Bild</xsl:when>
                <xsl:when test="./subfield[@code='9']='105591246'">Bilderbogen</xsl:when>
                <xsl:when test="./subfield[@code='9']='106376934'">Bilderbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='106376888'">Bildnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='105590614'">Bildwörterbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104159588'">Blindendruck</xsl:when>
                <xsl:when test="./subfield[@code='9']='104675365'">Brief</xsl:when>
                <xsl:when test="./subfield[@code='9']='104269936'">Briefsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='19167821X'">Checkliste</xsl:when>
                <xsl:when test="./subfield[@code='9']='106354256'">Datenbank</xsl:when>
                <xsl:when test="./subfield[@code='9']='105565431'">Datensammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='106350188'">Diagramm</xsl:when>
                <xsl:when test="./subfield[@code='9']='826489532'">Diskografie</xsl:when>
                <xsl:when test="./subfield[@code='9']='105720747'">Drehbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='10554731X'">Einblattdruck</xsl:when>
                <xsl:when test="./subfield[@code='9']='104450460'">Einführung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104713054'">Entscheidungssammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104675322'">Enzyklopädie</xsl:when>
                <xsl:when test="./subfield[@code='9']='105681490'">Erlebnisbericht</xsl:when>
                <xsl:when test="./subfield[@code='9']='10553059X'">Fachkunde</xsl:when>
                <xsl:when test="./subfield[@code='9']='105530085'">Fahrplan</xsl:when>
                <xsl:when test="./subfield[@code='9']='104339624'">Faksimile</xsl:when>
                <xsl:when test="./subfield[@code='9']='105529699'">Fallsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='251636593'">Fallstudiensammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='82648378X'">Fiktionale Darstellung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104559683'">Film</xsl:when>
                <xsl:when test="./subfield[@code='9']='826486371'">Filmografie</xsl:when>
                <xsl:when test="./subfield[@code='9']='106098284'">Flugblatt</xsl:when>
                <xsl:when test="./subfield[@code='9']='104535164'">Flugschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='105518972'">Formelsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='105518786'">Formularsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='10467444X'">Forschungsbericht</xsl:when>
                <xsl:when test="./subfield[@code='9']='857755366'">Forschungsdaten</xsl:when>
                <xsl:when test="./subfield[@code='9']='104434880'">Fotografie</xsl:when>
                <xsl:when test="./subfield[@code='9']='10551487X'">Führer</xsl:when>
                <xsl:when test="./subfield[@code='9']='105514314'">Fundstellenverzeichnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='104516127'">Genealogische Tafel</xsl:when>
                <xsl:when test="./subfield[@code='9']='106317032'">Gespräch</xsl:when>
                <xsl:when test="./subfield[@code='9']='105499242'">Globus</xsl:when>
                <xsl:when test="./subfield[@code='9']='106311913'">Grafik</xsl:when>
                <xsl:when test="./subfield[@code='9']='739426095'">Graphzine</xsl:when>
                <xsl:when test="./subfield[@code='9']='10457187X'">Handschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='104279907'">Haushaltsplan</xsl:when>
                <xsl:when test="./subfield[@code='9']='106293516'">Hörspiel</xsl:when>
                <xsl:when test="./subfield[@code='9']='105475025'">Humoristische Darstellung</xsl:when>
                <xsl:when test="./subfield[@code='9']='106286269'">Inkunabel</xsl:when>
                <xsl:when test="./subfield[@code='9']='104767812'">Interview</xsl:when>
                <xsl:when test="./subfield[@code='9']='106284274'">Inventar</xsl:when>
                <xsl:when test="./subfield[@code='9']='123203171'">Jugendbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='10627645X'">Jugendsachbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104559594'">Kalender</xsl:when>
                <xsl:when test="./subfield[@code='9']='10627340X'">Karikatur</xsl:when>
                <xsl:when test="./subfield[@code='9']='104321792'">Karte</xsl:when>
                <xsl:when test="./subfield[@code='9']='105454966'">Katalog</xsl:when>
                <xsl:when test="./subfield[@code='9']='121618285'">Kinderbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='10545169X'">Kindersachbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='105823643'">Kochbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='826486541'">Kolumnensammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104500719'">Kommentar</xsl:when>
                <xsl:when test="./subfield[@code='9']='104766174'">Konkordanz</xsl:when>
                <xsl:when test="./subfield[@code='9']='104492910'">Kunstführer</xsl:when>
                <xsl:when test="./subfield[@code='9']='10495146X'">Künstlerbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='152615393'">Laudatio</xsl:when>
                <xsl:when test="./subfield[@code='9']='104270187'">Lehrbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='10542739X'">Lehrerhandbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104279885'">Lehrmittel</xsl:when>
                <xsl:when test="./subfield[@code='9']='106249312'">Lehrplan</xsl:when>
                <xsl:when test="./subfield[@code='9']='104331259'">Lernsoftware</xsl:when>
                <xsl:when test="./subfield[@code='9']='106247700'">Lesebuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='105423793'">Liederbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104712805'">Literaturbericht</xsl:when>
                <xsl:when test="./subfield[@code='9']='153776951'">Loseblattsammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='241186285'">Mehrsprachiges Wörterbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='10455827X'">Mitgliederverzeichnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='106226576'">Modell</xsl:when>
                <xsl:when test="./subfield[@code='9']='104106743'">Musikhandschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='105716634'">Nachruf</xsl:when>
                <xsl:when test="./subfield[@code='9']='213941864'">Norm</xsl:when>
                <xsl:when test="./subfield[@code='9']='106107208'">Ortsverzeichnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='106204971'">Papyrus</xsl:when>
                <xsl:when test="./subfield[@code='9']='105379174'">Patentschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='104141603'">Plakat</xsl:when>
                <xsl:when test="./subfield[@code='9']='104773596'">Plan</xsl:when>
                <xsl:when test="./subfield[@code='9']='511931980'">Podcast</xsl:when>
                <xsl:when test="./subfield[@code='9']='10619643X'">Postkarte</xsl:when>
                <xsl:when test="./subfield[@code='9']='10572517X'">Praktikum</xsl:when>
                <xsl:when test="./subfield[@code='9']='10536293X'">Predigthilfe</xsl:when>
                <xsl:when test="./subfield[@code='9']='105488402'">Pressendruck</xsl:when>
                <xsl:when test="./subfield[@code='9']='104798122'">Pressestimme</xsl:when>
                <xsl:when test="./subfield[@code='9']='184283949'">Programmheft</xsl:when>
                <xsl:when test="./subfield[@code='9']='105750921'">Puzzle</xsl:when>
                <xsl:when test="./subfield[@code='9']='105661236'">Quelle</xsl:when>
                <xsl:when test="./subfield[@code='9']='104637234'">Ratgeber</xsl:when>
                <xsl:when test="./subfield[@code='9']='10459859X'">Rede</xsl:when>
                <xsl:when test="./subfield[@code='9']='105349437'">Referateorgan</xsl:when>
                <xsl:when test="./subfield[@code='9']='106188771'">Regest</xsl:when>
                <xsl:when test="./subfield[@code='9']='104189037'">Reisebericht</xsl:when>
                <xsl:when test="./subfield[@code='9']='826486789'">Reportagensammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='106186019'">Rezension</xsl:when>
                <xsl:when test="./subfield[@code='9']='10564725X'">Richtlinie</xsl:when>
                <xsl:when test="./subfield[@code='9']='104962674'">Röntgenbild</xsl:when>
                <xsl:when test="./subfield[@code='9']='105339881'">Rückläufiges Wörterbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='105006653'">Sachbilderbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='106175300'">Satzung</xsl:when>
                <xsl:when test="./subfield[@code='9']='10533328X'">Schematismus</xsl:when>
                <xsl:when test="./subfield[@code='9']='106080849'">Schulprogramm</xsl:when>
                <xsl:when test="./subfield[@code='9']='106158368'">Software</xsl:when>
                <xsl:when test="./subfield[@code='9']='106155369'">Spiel</xsl:when>
                <xsl:when test="./subfield[@code='9']='106154761'">Sprachatlas</xsl:when>
                <xsl:when test="./subfield[@code='9']='105705721'">Sprachführer</xsl:when>
                <xsl:when test="./subfield[@code='9']='104321571'">Stadtplan</xsl:when>
                <xsl:when test="./subfield[@code='9']='106152955'">Statistik</xsl:when>
                <xsl:when test="./subfield[@code='9']='105296104'">Tabelle</xsl:when>
                <xsl:when test="./subfield[@code='9']='105295841'">Tafel</xsl:when>
                <xsl:when test="./subfield[@code='9']='104364149'">Tagebuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104755989'">Technische Zeichnung</xsl:when>
                <xsl:when test="./subfield[@code='9']='105293547'">Telefonbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104622822'">Testmaterial</xsl:when>
                <xsl:when test="./subfield[@code='9']='121632903'">Theaterstück</xsl:when>
                <xsl:when test="./subfield[@code='9']='104417544'">Thesaurus</xsl:when>
                <xsl:when test="./subfield[@code='9']='105003867'">Übungssammlung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104768029'">Umfrage</xsl:when>
                <xsl:when test="./subfield[@code='9']='104362839'">Unterrichtseinheit</xsl:when>
                <xsl:when test="./subfield[@code='9']='104675098'">Urkunde</xsl:when>
                <xsl:when test="./subfield[@code='9']='105269557'">Verkaufskatalog</xsl:when>
                <xsl:when test="./subfield[@code='9']='105266639'">Verzeichnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='10526279X'">Vorlesungsverzeichnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='344907406'">Weblog</xsl:when>
                <xsl:when test="./subfield[@code='9']='104321709'">Weltkarte</xsl:when>
                <xsl:when test="./subfield[@code='9']='104464909'">Werkverzeichnis</xsl:when>
                <xsl:when test="./subfield[@code='9']='104688165'">Werkzeitschrift</xsl:when>
                <xsl:when test="./subfield[@code='9']='104682620'">Wörterbuch</xsl:when>
                <xsl:when test="./subfield[@code='9']='104725044'">Zeichnung</xsl:when>
                <xsl:when test="./subfield[@code='9']='104105143'">Zeittafel</xsl:when>
                <xsl:when test="./subfield[@code='9']='105797022'">Zitatensammlung</xsl:when>
                <xsl:otherwise/>
              </xsl:choose>
            </i>
          </xsl:for-each>
        </arr>
      </natureOfContentTermIds>
    </xsl:if>
    <!-- languages -->
    <xsl:if test="datafield[@tag='010@']/subfield[@code='a']">
      <languages>
        <arr>
          <xsl:for-each select="datafield[@tag='010@']/subfield[@code='a']">
            <i>
              <xsl:value-of select="."/>
            </i>
          </xsl:for-each>
        </arr>
      </languages>
    </xsl:if>
    <!-- series -->
    <series>
      <xsl:if test="datafield[@tag='036E']/subfield[@code='a']">
        <arr>
          <xsl:for-each select="datafield[@tag='036E']">
            <i>
              <value>
                <xsl:for-each select="subfield">
                  <xsl:choose>
                    <xsl:when test="@code='a'">
                      <xsl:choose>
                        <xsl:when test="contains(., '@')">
                          <xsl:value-of select="concat(substring-before(., '@'), substring-after(., '@'))"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@code='l'">
                      <xsl:value-of select="concat(' ; ',.)"/>
                    </xsl:when>
                  </xsl:choose> 
                </xsl:for-each>
              </value>
            </i>
          </xsl:for-each>
        </arr>
      </xsl:if>
      <!-- hebis: added series statement for parts of multipart resources with independent title -->
      <xsl:choose>
        <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) != 'f') and datafield[@tag='036C']">
          <arr>
            <i>
              <value>
                <xsl:value-of select="normalize-space(substring-after($title-036C, '. '))"/>
              </value>
            </i>
          </arr>
        </xsl:when>
      </xsl:choose>
    </series>
    <!-- physicalDescriptions -->
    <xsl:if test="datafield[@tag='034D' or @tag='034M' or @tag='034I' or @tag='034K']">
      <xsl:variable name="phd">
        <xsl:value-of select="datafield[@tag='034D']/subfield[@code='a']"/>
      </xsl:variable>
      <xsl:variable name="phm">
        <xsl:value-of select="datafield[@tag='034M']/subfield[@code='a']"/>
      </xsl:variable>
      <xsl:variable name="phi">
        <xsl:value-of select="datafield[@tag='034I']/subfield[@code='a']"/>
      </xsl:variable>
      <xsl:variable name="phk">
        <xsl:value-of select="datafield[@tag='034K']/subfield[@code='a']"/>
      </xsl:variable>
      <physicalDescriptions>
        <arr>
          <i>
            <xsl:choose>
              <xsl:when test="$phd and string($phm) and string($phi) and string($phk)">
                <xsl:value-of select="concat($phd, ' : ', $phm, ' ; ', $phi, ' + ', $phk)"/>
              </xsl:when>
              <xsl:when test="$phd and string($phm) and string($phi)">
                <xsl:value-of select="concat($phd, ' : ', $phm, ' ; ', $phi)"/>
              </xsl:when>
              <xsl:when test="$phd and string($phm)">
                <xsl:value-of select="concat($phd, ' : ', $phm)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$phd"/>
              </xsl:otherwise>
            </xsl:choose>
          </i>
        </arr>
      </physicalDescriptions>
    </xsl:if>
    <!-- Edition -->
    <xsl:if test="datafield[@tag='032@']/subfield[@code='a']">
      <xsl:variable name="eda" select="datafield[@tag='032@']/subfield[@code='a']"/>
      <xsl:variable name="edh" select="datafield[@tag='032@']/subfield[@code='h']"/>
      <editions>
        <arr>
          <i>
            <xsl:choose>
              <xsl:when test="$edh">
                <xsl:value-of select="concat($eda, ' / ', $edh)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$eda"/>
              </xsl:otherwise>
            </xsl:choose>
          </i>
        </arr>
      </editions>
    </xsl:if>
    <!-- Administrative notes -->
    <administrativeNotes>
      <arr>
        <xsl:for-each select="datafield[@tag='002@']">
          <i>
            <xsl:value-of select="concat(./subfield[@code='0'], ' (0500: Bibliografische Gattung)')"/>
          </i>
        </xsl:for-each>
        <xsl:for-each select="datafield[@tag='001B']">
          <i>
            <xsl:value-of select="concat(translate(substring-after(./subfield[@code='0'], ':'), '-', '.'),', ', substring(./subfield[@code='t'],1,5), ' (0210: Datum der letzten Änderung)')"/>
          </i>
        </xsl:for-each>
      </arr>
    </administrativeNotes>
    
  </xsl:template>
  <xsl:template match="text()"/>
  <xsl:template name="join">
    <xsl:param name="list"/>
    <xsl:param name="separator"/>
    <xsl:for-each select="$list">
      <xsl:value-of select="."/>
      <xsl:if test="position() != last()">
        <xsl:value-of select="$separator"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="pica-to-iso-date">
    <xsl:param name="input"/>
    <xsl:param name="suffix"/>
    <xsl:variable name="rawdate" select="substring-after($input, ':')"/>
    <xsl:variable name="day" select="substring-before($rawdate, '-')"/>
    <xsl:variable name="moyr" select="substring-after($rawdate, '-')"/>
    <xsl:variable name="month" select="substring-before($moyr, '-')"/>
    <xsl:variable name="shortyear" select="substring-after($moyr, '-')"/>
    <xsl:if test="$shortyear &gt; 50">
      <xsl:variable name="year" select="concat('19', $shortyear)"/>
      <xsl:value-of select="concat($year, '-', $month, '-', $day, $suffix)"/>
    </xsl:if>
    <xsl:if test="$shortyear &lt; 51">
      <xsl:variable name="year" select="concat('20', $shortyear)"/>
      <xsl:value-of select="concat($year, '-', $month, '-', $day, $suffix)"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
