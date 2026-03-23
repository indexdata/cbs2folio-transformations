<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <xsl:variable name="version" select="'v10'"/>
  
  <!-- 
  
  Diese Prinzipien sind notwendig, damit nichts zerbröselt:
  - Alle Holdings einer Instanz mit mindestens einem ZDB-Holding werden aus dem CBS synchronisiert, alle Holdings der anderen Instanzen werden
    über Genloc synchronisiert.
  - Es gibt keine FOLIO-lokalen Holdings. Alle Holdings werden in die eine oder andere Richtung synchronisiert. Also werden auch ho...-Holdings
    synchronisiert.
  - Beim CBS2FOLIO werden immer alle Holdings einer Instanz synchronisiert. (außer bei Online-Instanzen)
  
  Das Mapping arbeitet jetzt mit vier Fällen:
  - ZDB-Instanzen, bestehend aus ZDB-Holdings, Holding-hrids werden getauscht - eigentlich ein Spezialfall des folgenden Falls
  - ZDB/Mono-Mischfälle, deren Holdings beim Wolpertingern im Gewinnersatz zusammengeführt werden: Die enthaltenen ZDB-Bestände bekommen immer ein Update. 
    Die enthaltenen lokalen Bestände bekommen ein Minimal-Update, d.h. nur die permanentLocationId und die holdingsTypeId (beides Pflichtfelder für MIU),
    die ja immer im K10plus-Satz stimmen sollten. Auch die administrativeNotes und formerId werden entsprechend gefüllt. Alles andere wird über
    retainExistingValues/forOmittedProperties erhalten. Genloc darf deshalb nicht tätig werden, sonst brauchen wir die Blockade aller Felder wie bei den Monographien.
    Und das geht nicht, wegen der ZDB-Bestände. Alle anderen Felder bleiben dann erhalten, also auch die Anmerkungen etc.
  - Online-Fälle, soweit nicht ZDB, alle Holding-hrids werden getauscht und alle Holdings bekommen Updates
  - Mono-Fälle, die nur eine Verwaltungsnotiz in den Holdings bekommen und sonst unangetastet bleiben, die Holdings-hrids werden nicht getauscht
     
  Umgang mit den Identifiern:  
  - Lokale Bestände ohne 206X$0 werden nicht gemappt, weder in den ZDB-Mischfällen, noch in den Mono-Fällen.
  - Von dubletten Bestände mit identischer 206X$0 wird nur der erste gemappt. Bestände ohne 206X$0 entfallen, da sie im Datenmodell nicht funktionieren können.
  - Bei ZDB-Beständen gibt es da keine Probleme, da EPNs nicht dublett auftreten können. Alle werden 1:1 gemappt.
  - Gravierendere Identifier-Fehler erzeugen eine Warnung in den Verwaltungsnotizen.
  
  -->

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template name="processingzdb">
    <processing> <!-- updates holdings data -->
      <item>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
          <forTheseProperties>
            <arr>
              <i>permanentLoanTypeId</i>
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
      </item>
      <holdingsRecord>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
        </retainExistingValues>
        <retainOmittedRecord>
          <ifField>hrid</ifField>
          <matchesPattern>\D.*</matchesPattern>
        </retainOmittedRecord>
        <statisticalCoding>
          <arr>
            <i>
              <if>deleteSkipped</if>
              <becauseOf>HOLDINGS_RECORD_PATTERN_MATCH</becauseOf>
              <setCode>HOLDINGS_RECORD_PATTERN_MATCH</setCode>
            </i> 
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

  <xsl:template name="processingmono">
    <processing> <!-- preserves holdings data -->
      <item>
        <retainOmittedRecord>
          <ifField>hrid</ifField>
          <matchesPattern>.*</matchesPattern>
        </retainOmittedRecord>
      </item>
      <holdingsRecord>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
          <forTheseProperties>
            <arr>
              <i>holdingsTypeId</i>
              <i>permanentLocationId</i>
            </arr>
          </forTheseProperties>
        </retainExistingValues>
        <retainOmittedRecord>
          <ifField>hrid</ifField>
          <matchesPattern>.*</matchesPattern>
        </retainOmittedRecord>
        <statisticalCoding>
          <arr>
            <i>
              <if>deleteSkipped</if>
              <becauseOf>HOLDINGS_RECORD_PATTERN_MATCH</becauseOf>
              <setCode>HOLDINGS_RECORD_PATTERN_MATCH</setCode>
            </i> 
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
  
  <xsl:template name="classifications">
    <classifications>
      <arr>
        <xsl:variable name="rvk" as="xs:string *"> <!-- RVK -->
          <xsl:for-each select="original/(datafield[@tag='045R']/subfield[@code='8']|datafield[@tag='045R']/subfield[@code='a'])">
            <xsl:sequence select="normalize-space(substring-before(concat(.,':'),':'))"/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="distinct-values($rvk)[. != '']">
          <xsl:sort/>
          <i>
            <classificationNumber><xsl:value-of select="."/></classificationNumber>
            <classificationTypeId>RVK</classificationTypeId>
          </i>
        </xsl:for-each>
        <xsl:variable name="ddc" as="xs:string *"> <!-- DDC -->
          <xsl:for-each select="original/(datafield[@tag='045F']/subfield[@code='a'][.!='B']|datafield[@tag='045H']/subfield[@code='a'][.!='B'])">
            <xsl:sequence select="normalize-space(translate(.,'/',''))"/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="distinct-values($ddc)[. != '']">
          <xsl:sort/>
          <i>
            <classificationNumber><xsl:value-of select="."/></classificationNumber>
            <classificationTypeId>DDC</classificationTypeId>
          </i>
        </xsl:for-each>
        <xsl:variable name="fachfacette" as="xs:string *"> <!-- Fachfacette -->
          <xsl:for-each select="original/(datafield[(@tag='045X') and (subfield[@code='i']='mzub')]/subfield[@code='j'])">
            <xsl:sequence select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="distinct-values($fachfacette)[. != '']">
          <xsl:sort/>
          <i>
            <classificationNumber><xsl:value-of select="."/></classificationNumber>
            <classificationTypeId>Fachfacette</classificationTypeId>
          </i>
        </xsl:for-each>
      </arr>
    </classifications>
  </xsl:template>

  <xsl:template name="permanentLocationId">
    <xsl:param name="itemrec" select="."/>
    <xsl:param name="datafield002at" select="../datafield[@tag='002@']/subfield[@code='0']"/>
    <xsl:variable name="abt" select="($itemrec/datafield[@tag='209A']/subfield[@code='B']/text())[1]"/>
    <xsl:variable name="standort" select="upper-case(($itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='f'],
      $itemrec/datafield[(@tag='209A') and (subfield[@code='x']='01')]/subfield[@code='f'])[1])"/> 
    <xsl:variable name="electronicholding" select="substring($datafield002at,1,1) = 'O'"/>
    <xsl:choose>
      <xsl:when test="$electronicholding">ONLINE</xsl:when>
      <xsl:when test="(substring($datafield002at,2,1) = 'o') and not($itemrec/datafield[@tag='209A']/subfield[@code='d'])">AUFSATZ</xsl:when>
      <xsl:when test="$abt='77/XXX'">DUMMY</xsl:when>
      <xsl:when test="$abt='77'">
        <xsl:choose>
          <xsl:when test="contains($standort,'FREIHAND')">ZBFREI</xsl:when>
          <xsl:when test="contains($standort,'LESESAAL') or contains($standort,'RVK') or contains($standort,'AUSGELAGERTE ZEITSCHRIFTEN')">ZBLS</xsl:when>
          <xsl:when test="contains($standort,'LBS')">ZBLBS</xsl:when>
          <xsl:when test="contains($standort,'RARA')">ZBRARA</xsl:when>
          <xsl:otherwise>ZBMAG</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/002'">
        <xsl:choose>
          <xsl:when test="contains($standort,'ERZIEHUNGSWISSENSCHAFT')">GFGPÄD</xsl:when>
          <xsl:when test="contains($standort,'FILMWISSENSCHAFT')">GFGFILM</xsl:when>
          <xsl:when test="contains($standort,'JOURNALISTIK')">GFGJOUR</xsl:when>
          <xsl:when test="contains($standort,'POLITIKWISSENSCHAFT')">GFGPOL</xsl:when>
          <xsl:when test="contains($standort,'PSYCHOLOGIE')">GFGPSYCH</xsl:when>
          <xsl:when test="contains($standort,'PUBLIZISTIK')">GFGPUB</xsl:when>
          <xsl:when test="contains($standort,'SOZIOLOGIE')">GFGSOZ</xsl:when>
          <xsl:when test="contains($standort,'RVK')">GFGZEB</xsl:when>
          <xsl:when test="contains($standort,'SPORT')">GFGSPO</xsl:when>
          <xsl:when test="contains($standort,'USA')">GFGUSA</xsl:when>
          <xsl:when test="contains($standort,'GEOWISSENSCHAFTEN') or contains($standort,'GEOGRAPHIE')">GFGGEO</xsl:when>
          <xsl:when test="contains($standort,'KUNSTGESCHICHTE')">GFGKUN</xsl:when>
          <xsl:otherwise>UNKNOWN</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/004'"> 
        <xsl:choose>
          <xsl:when test="contains($standort,'SEPARIERTE')">PHMAG</xsl:when> 
          <xsl:when test="contains($standort,'NUMERUS')">PHNC</xsl:when>
          <xsl:when test="contains($standort,'THEATERWISSENSCHAFT')">PHTHW</xsl:when> 
          <xsl:when test="contains($standort,'OSTEUROPÄISCHE')">PHOEG</xsl:when> 
          <xsl:when test="contains($standort,'ALTE GESCHICHTE')">PHALG</xsl:when> 
          <xsl:when test="contains($standort,'BYZANTINISTIK')">PHBYZ</xsl:when> 
          <xsl:when test="contains($standort,'MITTLERE UND NEUERE GESCHICHTE')">PHMNG</xsl:when> 
          <xsl:when test="contains($standort,'BUCHWISSENSCHAFT')">PHBUW</xsl:when> 
          <xsl:when test="contains($standort,'KULTURWISSENSCHAFTEN')">PHKLW</xsl:when> 
          <xsl:when test="contains($standort,'GERMANISTIK')">PHGER</xsl:when> 
          <xsl:when test="contains($standort,'LITERATURWISSENSCHAFT')">PHAVL</xsl:when> 
          <xsl:when test="contains($standort,'ANGLISTIK') or contains($standort,'AMERIKANISTIK')">PHANG</xsl:when> 
          <xsl:when test="contains($standort,'SPRACHWISSENSCHAFT')">PHAVS</xsl:when> 
          <xsl:when test="contains($standort,'ROMANISTIK')">PHROM</xsl:when> 
          <xsl:when test="contains($standort,'SLAVISTIK')">PHSLAV</xsl:when> 
          <xsl:when test="contains($standort,'POLONICUM')">PHPOL</xsl:when> 
          <xsl:when test="contains($standort,'KLASSISCHE PHILOLOGIE')">PHKLP</xsl:when> 
          <xsl:when test="contains($standort,'KLASSISCHE ARCHÄOLOGIE')">PHKLA</xsl:when> 
          <xsl:when test="contains($standort,'PHILOSOPHIE')">PHPHI</xsl:when>
          <xsl:when test="contains($standort,'RVK')">PHRVK</xsl:when>
          <xsl:otherwise>UNKNOWN</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/005'">
        <xsl:choose>
          <xsl:when test="contains($standort,'LESESAAL')">UMLS</xsl:when>
          <xsl:when test="contains($standort,'LBS')">UMLBS</xsl:when>
          <xsl:otherwise>UMFH</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/006'">
        <xsl:choose>
          <xsl:when test="contains($standort,'LEHRBUCH')">MINTLBS</xsl:when>
          <xsl:when test="contains($standort,'HANDAPPARAT')">MINTFAK</xsl:when>
          <xsl:otherwise>MINT</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='Mz 116'">FBMPI</xsl:when>	
      <xsl:when test="$abt='77/016'">
        <xsl:choose>
          <xsl:when test="$standort='EVANGELISCHE THEOLOGIE'">THEV</xsl:when>
          <xsl:when test="$standort='KATHOLISCHE THEOLOGIE'">THKT</xsl:when>
          <xsl:when test="contains($standort,'MAGAZIN') or contains($standort,'Rara')">THRARA</xsl:when>
          <xsl:when test="contains($standort,'LEHRBUCH')">THLBS</xsl:when>
          <xsl:when test="contains($standort,'BÜRO') or contains($standort,'büro')">THFAK</xsl:when>
          <xsl:when test="contains($standort,'PSYCHOLOGIE')">THPSYCH</xsl:when>
          <xsl:otherwise>TH</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/018'">
        <xsl:choose>
          <xsl:when test="contains($standort,'LEHRBUCH')">RWLBS</xsl:when>
          <xsl:when test="contains($standort,'MAGAZIN')">RWMAG</xsl:when>
          <xsl:when test="contains($standort,'RECHT')">RWR</xsl:when>
          <xsl:when test="contains($standort,'MEDIZIN')">RWM</xsl:when>
          <xsl:when test="contains($standort,'VWL') or contains($standort,'BWL') or contains($standort,'WIPÄD')">RWW</xsl:when>
          <xsl:when test="contains($standort,'LEHRSTÜHLE')">RWFAK</xsl:when>
          <xsl:otherwise>RW</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='Mz 19'">
        <xsl:choose>
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
      <xsl:when test="$abt='77/034'">FBGTEM</xsl:when>
      <xsl:when test="$abt='77/035'">UMRMED</xsl:when>
      <xsl:when test="$abt='77/043'">UMPSY</xsl:when>
      <xsl:when test="$abt='77/054'">UMZMK</xsl:when>
      <xsl:when test="$abt='77/066'">
        <xsl:choose>
          <xsl:when test="contains($standort,'AMA')">RWAMA</xsl:when>
          <xsl:when test="contains($standort,'JAHN')">RWJAHN</xsl:when>
          <xsl:otherwise>RWETH</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/069'">FBPSY</xsl:when>
      <xsl:when test="$abt='77/080'">RWTURK</xsl:when>
      <xsl:when test="$abt='77/082'">FBÄGYPT</xsl:when>
      <xsl:when test="$abt='77/085'">FBAVFGA</xsl:when>
      <xsl:when test="$abt='77/091'">
        <xsl:choose>
          <xsl:when test="contains($standort,upper-case('Separiert'))">PHMUWMAG</xsl:when>
          <xsl:otherwise>PHMUW</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/094'">FBIGL</xsl:when>
      <xsl:when test="$abt='77/111'">FBKUNST</xsl:when>
      <xsl:when test="$abt='77/112'">
        <xsl:choose>
          <xsl:when test="contains($standort,'FREIHAND')">PHHFMFREI</xsl:when>
          <xsl:otherwise>PHHFMMAG</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$abt='77/124'">FBGESANG</xsl:when>
      <xsl:otherwise>UNKNOWN</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="record">
    <xsl:if test="not((substring(original/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') 
           or (original/datafield[@tag='002@']/subfield[@code='0'] = 'amy')) 
        or exists(original/item[datafield[(@tag='209B') and (subfield[@code='x']='12')]/subfield[@code='a']='ctof'])
        or exists(original/item/datafield[(@tag='209R') and contains(subfield[@code='u'],'anchor=Einzelkauf_')])
        or exists(original/item/datafield[(@tag='245G') and (subfield[@code='c']='ctof')])">
      <!-- UB Mainz: keine Online-Ressourcen, keine Mailboxen, aber Online-Einzelkauf Mono/ZS-->
      <xsl:variable name="ppn" select="(original/datafield[@tag='003@']/subfield[@code='0'])[1]"/>
      <xsl:variable name="altppn" select="if (original/datafield[@tag='003H']/subfield[@code='0']) then concat('HEB',(original/datafield[@tag='003H']/subfield[@code='0'])[1])
        else concat('KXP',$ppn)"/>
      <record>
        <xsl:copy-of select="original"/>
        <xsl:choose>

          <xsl:when test="not(exists(original/item[not(starts-with(datafield[@tag='208@']/subfield[@code='b'],'z'))]))"> <!-- ZDB-Fälle -->
            <xsl:call-template name="processingzdb"/>
            <instance>
              <source>ZDB</source>
              <identifiers>
                <arr>
                  <i>
                    <value><xsl:value-of select="$ppn"/></value>
                    <identifierTypeId>PPN-K10plus</identifierTypeId>
                  </i>
                  <i>
                    <value><xsl:value-of select="$altppn"/></value>
                    <identifierTypeId>PPN-Hebis</identifierTypeId>
                  </i>
                  <xsl:copy-of select="instance/identifiers/arr/i"/>
                </arr>
              </identifiers>
              <xsl:copy-of select="instance/*[not(self::source or self::administrativeNotes or self::identifiers)]"/>
              <xsl:call-template name="classifications"/>
                <statisticalCodeIds>
                  <arr/>                
                </statisticalCodeIds>
              <administrativeNotes>
                <arr>
                  <xsl:copy-of select="instance/administrativeNotes/arr/*"/>
                  <i>
                    <xsl:value-of select="concat('ZDB/K10Plus-Instanz+Bestand aus PPN: ',original/datafield[@tag='003@']/subfield[@code='0'])"/>
                    <xsl:if test="original/datafield[@tag='003H']/subfield[@code='0']"><xsl:value-of select="concat(' mit Hebis-PPN: ',original/datafield[@tag='003H']/subfield[@code='0'])"></xsl:value-of></xsl:if>
                    <xsl:value-of select="concat(' - ',$version)"/>
                  </i>
                </arr>
              </administrativeNotes>
            </instance>
            <holdingsRecords>
              <arr>
                <xsl:for-each select="original/item">  <!-- alle Holdings -->
                  <xsl:apply-templates select="."/>
                </xsl:for-each>              
              </arr>
            </holdingsRecords>
          </xsl:when>

          <xsl:when test="exists(original/item[starts-with(datafield[@tag='208@']/subfield[@code='b'],'z')])"> <!-- ZDB-Misch-Fälle -->
            <xsl:variable name="originalrec" select="original"/>
            <xsl:variable name="epnslokal" select="distinct-values(original/item[not(starts-with(datafield[@tag='208@']/subfield[@code='b'],'z'))]/datafield[@tag='206X']/subfield[@code='0'])"/>
            <xsl:call-template name="processingzdb"/>
            <instance>
              <source>ZDB</source>
              <identifiers>
                <arr>
                  <i>
                    <value><xsl:value-of select="$ppn"/></value>
                    <identifierTypeId>PPN-K10plus</identifierTypeId>
                  </i>
                  <i>
                    <value><xsl:value-of select="$altppn"/></value>
                    <identifierTypeId>PPN-Hebis</identifierTypeId>
                  </i>
                  <xsl:copy-of select="instance/identifiers/arr/i"/>
                </arr>
              </identifiers>
              <xsl:copy-of select="instance/*[not(self::source or self::administrativeNotes or self::identifiers)]"/>
              <xsl:call-template name="classifications"/>
              <statisticalCodeIds>
                <arr>
                   <i>ZDB-Titel-mit-Mono-EPN</i>
                </arr>
              </statisticalCodeIds>
              <administrativeNotes>
                <arr>
                  <xsl:copy-of select="instance/administrativeNotes/arr/*"/>
                  <i>
                    <xsl:value-of select="concat('ZDB/Lokal-Mischinstanz PPN: ',original/datafield[@tag='003@']/subfield[@code='0'])"/>
                    <xsl:if test="original/datafield[@tag='003H']/subfield[@code='0']"><xsl:value-of select="concat(' mit Hebis-PPN: ',original/datafield[@tag='003H']/subfield[@code='0'])"></xsl:value-of></xsl:if>
                    <xsl:value-of select="concat(' - ',$version)"/>
                  </i>
                  <i>
                    <xsl:text>ZDB-Bestände werden vollständig aktualisiert, lokale Bestände erhalten Updates nur für den Standort - verallgemeinert nach Sigel.</xsl:text>
                  </i>
                </arr>
              </administrativeNotes>
            </instance>
            <holdingsRecords> <!-- alle Holdings -->
              <arr>
                <xsl:for-each select="original/item[starts-with(datafield[@tag='208@']/subfield[@code='b'],'z')]">
                  <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:for-each select="$epnslokal">
                  <i>
                    <formerIds>
                      <arr/>
                    </formerIds>
                    <hrid><xsl:value-of select="."/></hrid>
                    <sourceId>K10plus</sourceId>
                    <administrativeNotes>
                      <arr>
                        <i>
                          <xsl:text>Lokaler ZS-Bestand mit EPN (nur Standort-Update nach Sigel!): </xsl:text>
                          <xsl:value-of select="$originalrec/item[current()=datafield[@tag='206X']/subfield[@code='0']]/datafield[@tag='203@']/subfield[@code='0']" separator=", "/>
                        </i>
                      </arr>
                    </administrativeNotes>
                    <xsl:variable name="itemrec" select="$originalrec/item[(current()=datafield[@tag='206X']/subfield[@code='0'])[1]]"/>
                    <holdingsTypeId>
                        <xsl:choose>
                          <xsl:when test="substring($itemrec/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'">electronic</xsl:when>
                          <xsl:otherwise>physical</xsl:otherwise>
                        </xsl:choose>
                    </holdingsTypeId> 
                    <permanentLocationId>
                      <xsl:call-template name="permanentLocationId">
                        <xsl:with-param name="itemrec" select="$itemrec"/>
                        <xsl:with-param name="datafield002at" select="$originalrec/datafield[@tag='002@']/subfield[@code='0']"/>
                      </xsl:call-template>
                    </permanentLocationId>
                    <statisticalCodeIds>
                      <arr/>                
                    </statisticalCodeIds>
                  </i>
                </xsl:for-each>
              </arr>
            </holdingsRecords>
          </xsl:when>

          <xsl:when test="substring(original/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'"> <!-- Online-Fälle -->
            <xsl:call-template name="processingzdb"/>
            <instance>
              <source>K10plus</source>
              <identifiers>
                <arr>
                  <i>
                    <value><xsl:value-of select="$ppn"/></value>
                    <identifierTypeId>PPN-K10plus</identifierTypeId>
                  </i>
                  <i>
                    <value><xsl:value-of select="$altppn"/></value>
                    <identifierTypeId>PPN-Hebis</identifierTypeId>
                  </i>
                  <xsl:copy-of select="instance/identifiers/arr/i"/>
                </arr>
              </identifiers>
              <xsl:copy-of select="instance/*[not(self::source or self::administrativeNotes or self::identifiers)]"/>
              <xsl:call-template name="classifications"/>
              <statisticalCodeIds>
                <arr/>                
              </statisticalCodeIds>
              <administrativeNotes>
                <arr>
                  <xsl:copy-of select="instance/administrativeNotes/arr/*"/>
                  <i>
                    <xsl:value-of select="concat('E/K10Plus-Instanz+Kaufbestände aus PPN: ',original/datafield[@tag='003@']/subfield[@code='0'])"/>
                    <xsl:if test="original/datafield[@tag='003H']/subfield[@code='0']"><xsl:value-of select="concat(' mit Hebis-PPN: ',original/datafield[@tag='003H']/subfield[@code='0'])"></xsl:value-of></xsl:if>
                    <xsl:value-of select="concat(' - ',$version)"/>
                  </i>
                </arr>
              </administrativeNotes>
            </instance>
            <holdingsRecords>
              <arr>
                <xsl:for-each select="original/item[(datafield[(@tag='209B') and (subfield[@code='x']='12')]/subfield[@code='a']='ctof')
                  or datafield[(@tag='209R') and contains(subfield[@code='u'],'anchor=Einzelkauf_')]
                  or datafield[(@tag='245G') and (subfield[@code='c']='ctof')] ]">  <!-- löscht alle anderen -->
                  <xsl:apply-templates select="."/>
                </xsl:for-each>
              </arr>
            </holdingsRecords>
          </xsl:when>

          <xsl:otherwise> <!-- Mono-Fälle -->
            <xsl:variable name="originalrec" select="original"/>
            <xsl:variable name="epnslokal" select="distinct-values(original/item/datafield[@tag='206X']/subfield[@code='0'])"/>
            <xsl:call-template name="processingmono"/>
            <instance>
              <source>K10plus</source>
              <identifiers>
                <arr>
                  <i>
                    <value><xsl:value-of select="$ppn"/></value>
                    <identifierTypeId>PPN-K10plus</identifierTypeId>
                  </i>
                  <i>
                    <value><xsl:value-of select="$altppn"/></value>
                    <identifierTypeId>PPN-Hebis</identifierTypeId>
                  </i>
                  <xsl:copy-of select="instance/identifiers/arr/i"/>
                </arr>
              </identifiers>
              <xsl:copy-of select="instance/*[not(self::source or self::administrativeNotes or self::identifiers)]"/>
              <xsl:call-template name="classifications"/>
              <statisticalCodeIds>
                <arr/>                
              </statisticalCodeIds>
              <administrativeNotes>
                <arr>
                  <xsl:copy-of select="instance/administrativeNotes/arr/*"/>
                  <i>
                    <xsl:value-of select="concat('K10Plus-Instanz aus PPN: ',original/datafield[@tag='003@']/subfield[@code='0'])"/>
                    <xsl:if test="original/datafield[@tag='003H']/subfield[@code='0']"><xsl:value-of select="concat(' mit Hebis-PPN: ',(original/datafield[@tag='003H']/subfield[@code='0'])[1])"></xsl:value-of></xsl:if>
                    <xsl:value-of select="concat(', Bestände: FOLIO - ',$version)"/>
                  </i>
                  <xsl:if test="(count($epnslokal) != count(original/item/datafield[@tag='206X']/subfield[@code='0']))
                    or (count(original/item/(datafield[@tag='206X']/subfield[@code='0'])[1]) != count(original/item))">
                    <i>
                      <xsl:text>Uffbasse! Anzahl FOLIO-Bestände im CBS nicht korrekt.</xsl:text> 
                    </i>
                  </xsl:if>
                </arr>
              </administrativeNotes>
            </instance>
            <holdingsRecords>
              <arr>
                <xsl:for-each select="$epnslokal">
                  <!--  hrid raussuchen (206X$0) und epn 203@ in administrative notices eintragen -  sonst nichts -->
                  <xsl:variable name="itemrec" select="($originalrec/item[current()=datafield[@tag='206X']/subfield[@code='0']])[1]"/>
                  <i>
                    <formerIds>
                      <arr/>
                    </formerIds>
                    <hrid><xsl:value-of select="."/></hrid>
                    <sourceId>FOLIO</sourceId>
                    <administrativeNotes>
                      <arr>
                        <i>
                          <xsl:variable name="quot">&quot;</xsl:variable>
                          <xsl:text>{ &quot;cbs_callnumber&quot;: </xsl:text>
                          <xsl:value-of select="if ($itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='a'])
                            then concat($quot,$itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='a'],$quot) else 'null'"/>
                          <xsl:text>, &quot;cbs_isil&quot;: </xsl:text>
                          <xsl:value-of select="if ($itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='B'])
                            then concat($quot,'DE-',translate($itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='B'],'/ ','-'),$quot) else 'null'"/>
                          <xsl:text>, &quot;cbs_illcode&quot;: </xsl:text>
                          <xsl:value-of select="if ($itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='J'])
                            then concat($quot,$itemrec/datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='J'],$quot) else 'null'"/>
                          <xsl:text>, &quot;cbs_epn&quot;: </xsl:text>
                          <xsl:value-of select="if ($itemrec/datafield[@tag='203@']/subfield[@code='0'])
                            then concat($quot,$itemrec/datafield[@tag='203@']/subfield[@code='0'],$quot) else 'null'"/>
                          <xsl:text> }</xsl:text>
                        </i>
                        <i>
                          <xsl:text>FOLIO-Bestand mit K10plus-EPN: </xsl:text>
                          <xsl:value-of select="$originalrec/item[current()=datafield[@tag='206X']/subfield[@code='0']]/datafield[@tag='203@']/subfield[@code='0']" separator=", "/>
                        </i>
                        <xsl:if test="starts-with($itemrec/datafield[@tag='206X']/subfield[@code='0'],'hox')">
                          <i>
                            <xsl:text>Bestand bei Migration automatisch erzeugt</xsl:text>
                          </i>
                        </xsl:if>
                      </arr>
                    </administrativeNotes>
                    <statisticalCodeIds>
                      <arr/>                
                    </statisticalCodeIds>
                    <xsl:choose>
                      <xsl:when test="starts-with($itemrec/datafield[@tag='206X']/subfield[@code='0'],'hox')">
                        <holdingsTypeId>physical</holdingsTypeId>
                        <permanentLocationId>DUMMY</permanentLocationId>
                      </xsl:when>
                      <xsl:otherwise>
                        <holdingsTypeId>physical</holdingsTypeId> <!-- retainExistingValues/forTheseProperties -->
                        <permanentLocationId>UNKNOWN</permanentLocationId> <!-- retainExistingValues/forTheseProperties -->
                      </xsl:otherwise>
                     </xsl:choose>
                  </i>
                </xsl:for-each>
              </arr>
            </holdingsRecords>
          </xsl:otherwise>

        </xsl:choose>
        <xsl:apply-templates select="instanceRelations"/>
      </record>
    </xsl:if>
  </xsl:template>

  <xsl:template match="record[delete]">
    <record>
      <delete>
        <xsl:for-each select="delete/*[not(self::processing)]">  <!-- removes any 'processing' element from pica2instance-new.xsl! -->
          <xsl:copy-of select="."/>
        </xsl:for-each>
        <processing> <!-- preserves holdings data -->
          <item>
            <blockDeletion>
              <ifField>hrid</ifField>
              <matchesPattern>\D.*</matchesPattern>
            </blockDeletion>
          </item>
          <holdingsRecord>
            <blockDeletion>
              <ifField>hrid</ifField>
              <matchesPattern>\D.*</matchesPattern>
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
      </delete>
    </record>
  </xsl:template>

  <xsl:template match="provisionalInstance/source">
    <source>Provisional Instance</source>
  </xsl:template>

  <!-- Parsing call number for prefix  -->
  <xsl:template name="callNumber">
    <xsl:param name="cn"/>
    <xsl:param name="abt"/>
    <xsl:param name="standort"/> 
    <xsl:choose>
      <xsl:when test="matches($cn,'^\d{3}\s[A-Z]{2}\s\d{3,6}.*') or matches($cn,'^\d{3}\s[A-Z]\s\d{3}\.\d{3}.*') or starts-with($cn,'INFO ')"> <!-- RVK-Signatur oder Magazin-Signatur -->
        <callNumberPrefix>
          <xsl:value-of select="substring-before($cn,' ')"/>
        </callNumberPrefix>
        <callNumber>
          <xsl:value-of select="substring-after($cn,' ')"/>
        </callNumber>
      </xsl:when>
      <xsl:when test="($abt='77/016' and (starts-with($cn, 'THEMAG ') or starts-with($cn, 'THERARA '))) or 
        ($abt='Mz 19' and (starts-with($cn,'CELA') or starts-with($cn,'CELTRA') or starts-with($cn,'LBS') or starts-with($cn,'MAG') or starts-with($cn,'SSC'))) or
        (($abt='77/004') and (starts-with($cn,'Anglistik'))) or
        ((($abt='77/004') and ($standort='SEPARIERTE BESTÄNDE')) and not(starts-with($cn,'SI ') or starts-with($cn,'SK ')))"> <!-- Leeerzeichen zur Abtrennung -->
        <xsl:choose>
          <xsl:when test="contains($cn,' ')">
            <callNumberPrefix>
              <xsl:value-of select="normalize-space(substring-before($cn,' '))"/>
            </callNumberPrefix>
            <callNumber>
              <xsl:value-of select="normalize-space(substring-after($cn,' '))"/>
            </callNumber>
          </xsl:when>
          <xsl:otherwise>
            <callNumberPrefix/>
            <callNumber>
              <xsl:value-of select="$cn"/>
            </callNumber>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="cnprefix">
          <xsl:choose>
            <xsl:when test="contains($cn,'°')">
              <xsl:value-of select="concat(substring-before($cn,'°'),'°')"/>
            </xsl:when>
            <xsl:when test="starts-with(upper-case($cn),'RARA ')">
              <xsl:value-of select="substring($cn,1,4)"/> 
            </xsl:when>
            <xsl:when test="starts-with(upper-case($cn),'GROSSFORMAT ')">
              <xsl:value-of select="substring($cn,1,11)"/> 
            </xsl:when>
            <xsl:when test="starts-with(upper-case($cn),'OVERSIZE ')">
              <xsl:value-of select="substring($cn,1,8)"/> 
            </xsl:when>
            <xsl:when test="(starts-with($cn,'in RZTG ') or starts-with($cn,'in R ZTG ')) and ($abt='77')">
              <xsl:value-of select="substring($cn,1,4)"/>
            </xsl:when>
            <xsl:when test="(starts-with($cn,'RZTG ') or starts-with($cn,'R ZTG ')) and ($abt='77')">
              <xsl:value-of select="substring($cn,1,1)"/> 
            </xsl:when>
            <xsl:when test="starts-with($cn,'in ') or starts-with($cn,'inZ') or starts-with($cn,'inY')">
              <xsl:value-of select="substring($cn,1,2)"/> 
            </xsl:when>
            <xsl:when test="starts-with($cn,'in: ')">
              <xsl:value-of select="substring($cn,1,3)"/> 
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <callNumberPrefix>
          <xsl:value-of select="normalize-space($cnprefix)"/>
        </callNumberPrefix>
        <callNumber>
          <xsl:value-of select="normalize-space(substring-after($cn,$cnprefix))"/>
        </callNumber>
        <callNumberSuffix/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="item">
    <i>
      <xsl:variable name="epn" select="datafield[@tag='203@']/subfield[@code='0']"/>
      <xsl:variable name="hebepn" select="if (datafield[@tag='203H']/subfield[@code='0']) then concat('HEB',(datafield[@tag='203H']/subfield[@code='0'])[1])
        else (datafield[@tag='206X']/subfield[@code='0'])[1]"/>
      <administrativeNotes>
        <arr>
          <xsl:for-each select="datafield[@tag='201B']">
            <i>
              <xsl:value-of select="concat(./subfield[@code='0'], ', ', substring(./subfield[@code='t'],1,5), ' (Datum und Uhrzeit der letzten Änderung)')"/>
            </i>
          </xsl:for-each>
          <i>
            <xsl:choose>
              <xsl:when test="starts-with(datafield[@tag='208@']/subfield[@code='b'],'z')">
                <xsl:value-of select="concat('ZDB-Bestand aus EPN: ',$epn)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat('Lokaler K10plus-Bestand aus EPN: ',$epn)"/>
              </xsl:otherwise>
            </xsl:choose>
          </i>
        </arr>
      </administrativeNotes>
      <formerIds>
        <arr>
          <i><xsl:value-of select="$epn"/></i>
          <i><xsl:value-of select="if (string-length($hebepn)>0) then $hebepn else concat('KXP',$epn)"/></i>
        </arr>
      </formerIds>
      <hrid>
        <xsl:value-of select="$epn"/>
      </hrid>
      <permanentLocationId>
        <xsl:call-template name="permanentLocationId"/>
      </permanentLocationId>
      <xsl:variable name="electronicholding" select="substring(../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'"/>
      <xsl:if test="not($electronicholding)">
          <xsl:call-template name="callNumber">
            <xsl:with-param name="cn" select="if (datafield[(@tag='209A') and (subfield[@code='x']='01')]/subfield[@code='g'])
              then datafield[(@tag='209A') and (subfield[@code='x']='01')]/subfield[@code='g']
              else datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='a']"/>
            <xsl:with-param name="abt" select="(datafield[@tag='209A']/subfield[@code='B']/text())[1]"/>
            <xsl:with-param name="standort" select="upper-case((datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='f'],
              datafield[(@tag='209A') and (subfield[@code='x']='01')]/subfield[@code='f'])[1])"/> 
          </xsl:call-template>
      </xsl:if>
       
      <holdingsTypeId>
        <xsl:choose>
          <xsl:when test="$electronicholding">electronic</xsl:when>
          <xsl:otherwise>physical</xsl:otherwise>
        </xsl:choose>
      </holdingsTypeId>
      <holdingsStatements>
        <arr>
          <xsl:if test="datafield[index-of(('231B','231C','231D','231E'),@tag)>0]">
            <xsl:for-each select="datafield[index-of(('231B','231C','231E'),@tag)>0]">
                <i>
                  <statement>
                    <xsl:if test="@tag='231C'">
                      <xsl:text>Angaben zur Vollständigkeit: </xsl:text>  
                    </xsl:if>
                    <xsl:value-of select="subfield[@code='a']"/>
                  </statement>
                  <xsl:if test="(@tag='231B') and (../datafield[@tag='231D'])">
                    <note>
                      <xsl:value-of select="../datafield[@tag='231D']/subfield[@code='a']"/>
                    </note>
                  </xsl:if>
                </i>
              </xsl:for-each>
            <xsl:if test="not (datafield[@tag='231B']) and (datafield[@tag='231D'])">
                <i>
                  <note>
                    <xsl:value-of select="datafield[@tag='231D']/subfield[@code='a']"/>
                  </note>
                </i>
              </xsl:if>
           </xsl:if>
        </arr>
      </holdingsStatements>
      
      <notes>
        <arr>
          <xsl:for-each select="datafield[(@tag='220B' or @tag='237A') and subfield[@code='a']]">
              <i>
                <note>
                  <xsl:value-of select="./subfield[@code='a']"/>
                </note>
                <holdingsNoteTypeId>Note</holdingsNoteTypeId>
                <staffOnly>
                  <xsl:value-of select="./@tag!='237A'"/>
                </staffOnly>
              </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[(@tag='209A')]/subfield[@code='f']"> <!-- and (subfield[@code='x']='00') -->
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>Standort (8201)</holdingsNoteTypeId> <!-- TBD 8201 umbenennen? -->
              <staffOnly><xsl:value-of select="if (../subfield[@code='x']='00') then 'true' else 'false'"/></staffOnly>
            </i>             
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='209O']/subfield[@code='a']|datafield[@tag='245G']/subfield[@code='c']">
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>Lokaler Schlüssel</holdingsNoteTypeId>
              <staffOnly>true</staffOnly>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='209B' and (subfield[@code='x']='12')]/subfield[@code='a']">
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>Abrufzeichen</holdingsNoteTypeId>
              <staffOnly>true</staffOnly>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[(@tag='206U') and subfield[@code='0']]">
            <i>
              <note>
                <xsl:value-of select="concat(subfield[@code='0'],' (',subfield[@code='b'],')')"/>
              </note>
              <holdingsNoteTypeId>Produktsigel</holdingsNoteTypeId>
              <staffOnly>true</staffOnly>
            </i>
          </xsl:for-each>
          
          <xsl:if test="datafield[@tag='209A']/subfield[(@code='g') and (../subfield[@code='x']='01')]">
            <i>
              <note>
                <xsl:value-of select="datafield[@tag='209A']/subfield[(@code='a') and (../subfield[@code='x']='00')]"/>
              </note>
              <holdingsNoteTypeId>
                <xsl:text>Magazinsignatur (nur Zeitschriften) (7110)</xsl:text>
              </holdingsNoteTypeId>
              <staffOnly>true</staffOnly>  
            </i>
          </xsl:if>
          <xsl:for-each select="datafield[@tag='209A']/subfield[(((@code='a') or (@code='g')) and (../subfield[@code='x']!='00') and (../subfield[@code='x']!='01'))
            or ((@code='g') and (../subfield[@code='x']='00')) or ((@code='a') and (../subfield[@code='x']='01'))]">
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>
                <xsl:variable name="codex" select="../subfield[@code='x']"/>
                <xsl:choose>
                  <xsl:when test="$codex='00'">
                    <xsl:text>Signatur Ansetzungsform (7100)</xsl:text>
                  </xsl:when>
                  <xsl:when test="($codex='01') or ($codex='02') or ($codex='03') or ($codex='04') or ($codex='05') or ($codex='06') or ($codex='07') or ($codex='08')">
                    <xsl:text>Weitere Signaturen (71</xsl:text><xsl:value-of select="$codex"/><xsl:text>)</xsl:text>
                  </xsl:when>
                  <xsl:when test="$codex='09'">
                    <xsl:text>Magazinsignatur (nur Monografien) (71</xsl:text><xsl:value-of select="$codex"/><xsl:text>)</xsl:text>
                  </xsl:when>
                  <xsl:when test="$codex='10'">
                    <xsl:text>Magazinsignatur (nur Zeitschriften) (71</xsl:text><xsl:value-of select="$codex"/><xsl:text>)</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>Note</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </holdingsNoteTypeId>
              <staffOnly>true</staffOnly>  
            </i>
          </xsl:for-each>
          
        </arr>
      </notes>
      <discoverySuppress>false</discoverySuppress>   
      <sourceId>
        <xsl:choose>
          <xsl:when test="starts-with(datafield[@tag='208@']/subfield[@code='b'],'z')"><xsl:text>ZDB</xsl:text></xsl:when>
          <xsl:otherwise><xsl:text>K10plus</xsl:text></xsl:otherwise>
        </xsl:choose>
      </sourceId>
      <xsl:if test="not($electronicholding) and (datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'] or not(datafield[@tag='209A']/subfield[@code='i']))">
        <items>
          <arr>
            <xsl:for-each select="datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a']"> <!-- keine Barcodes mehr -->
              <!--   <xsl:message>Debug: <xsl:value-of select="."/></xsl:message> -->
              <xsl:variable name="copy">
                <xsl:choose>
                  <xsl:when test="contains(.,'(')">
                    <xsl:value-of select="translate(substring-before(substring-after(.,'('),')'),' .,','')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="position()"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <!--  <xsl:message>Debug: <xsl:value-of select="concat($epn,'-',$copy)"/></xsl:message> -->
              <xsl:apply-templates select="../.." mode="make-item">
                <xsl:with-param name="hhrid" select="concat($epn,'-',$copy)"/>
                <xsl:with-param name="copy">
                  <xsl:if test="last()>1"><xsl:value-of select="$copy"/></xsl:if>
                </xsl:with-param>
                <xsl:with-param name="HEBhhrid" select="if (datafield[@tag='203H']/subfield[@code='0']) then concat('HEB',(datafield[@tag='203H']/subfield[@code='0'])[1],'-',$copy)
                  else if (datafield[@tag='206X']/subfield[@code='0']) then concat((datafield[@tag='206X']/subfield[@code='0'])[1],'-',$copy) else ''"/>
              </xsl:apply-templates>
            </xsl:for-each>
            <xsl:if test="not(datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'])">
              <!--   <xsl:message>Debug: EPN <xsl:value-of select="$epn"/></xsl:message>  -->
              <xsl:apply-templates select="." mode="make-item">
                <xsl:with-param name="hhrid" select="concat($epn,'-1')"/>
                <xsl:with-param name="HEBhhrid" select="if (datafield[@tag='203H']/subfield[@code='0']) then concat('HEB',(datafield[@tag='203H']/subfield[@code='0'])[1],'-1')
                  else if (datafield[@tag='206X']/subfield[@code='0']) then concat((datafield[@tag='206X']/subfield[@code='0'])[1],'-1') else ''"/>
              </xsl:apply-templates>
            </xsl:if>
          </arr>
        </items>
      </xsl:if>
      <electronicAccess>
        <arr>
          <xsl:for-each select="datafield[@tag='209R']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='u']"/>
              </uri>
            </i>
          </xsl:for-each>
        </arr>
      </electronicAccess>
      <statisticalCodeIds>
        <arr/>                
      </statisticalCodeIds>
    </i>
  </xsl:template>

  <xsl:template match="item" mode="make-item">
    <xsl:param name="hhrid"/>
    <xsl:param name="copy"/>
    <xsl:param name="HEBhhrid"/>
    <i>
      <xsl:choose>
        <xsl:when test="string-length($HEBhhrid)>0">
          <formerIds>
            <arr>
              <i><xsl:value-of select="$hhrid"/></i>
              <i><xsl:value-of select="$HEBhhrid"/></i>
            </arr>
          </formerIds>
        </xsl:when>
        <xsl:otherwise>
          <formerIds>
            <arr>
              <i><xsl:value-of select="$hhrid"/></i>
              <i><xsl:value-of select="concat('KXP',$hhrid)"/></i>
            </arr>
          </formerIds>
        </xsl:otherwise>
      </xsl:choose>

      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
      
      <!-- Hebis / K10plus -->  
      <materialTypeId>Zeitschriftenband</materialTypeId>
      
      <permanentLoanTypeId>unbekannt</permanentLoanTypeId>
      
      <status>
        <name>Intellectual item</name>
      </status>
      
      <yearCaption>
        <arr>
          <xsl:for-each select="datafield[@tag='231B']/subfield[@code='a']"> <!-- nicht wiederholbar -->
            <i>
              <xsl:for-each select="../../datafield[@tag='231E']/subfield[@code='a']"><xsl:value-of select="."/><xsl:text>: </xsl:text></xsl:for-each> <!-- nicht wiederholbar -->
              <xsl:value-of select="."/>
            </i>
          </xsl:for-each>
        </arr>
      </yearCaption>
      
      <!-- No item for electronic access -->

      <discoverySuppress>false</discoverySuppress>
      <statisticalCodeIds/>
    </i>
  </xsl:template>

 </xsl:stylesheet>