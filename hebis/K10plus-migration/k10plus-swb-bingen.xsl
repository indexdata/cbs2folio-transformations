<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <xsl:variable name="version" select="'v2'"/>

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
      </holdingsRecord>
      <instance>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
        </retainExistingValues>
      </instance>
    </processing>
  </xsl:template>
  
  <xsl:template name="classifications">  <!-- RVK/DDC -->
    <classifications>
      <arr>
        <xsl:variable name="rvk" as="xs:string *">
          <xsl:for-each select="original/(datafield[@tag='045R']/subfield[@code='8']|datafield[@tag='045R']/subfield[@code='a'])">
            <xsl:sequence select="normalize-space(substring-before(concat(.,':'),':'))"/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="distinct-values($rvk)">
          <xsl:sort/>
          <i>
            <classificationNumber><xsl:value-of select="."/></classificationNumber>
            <classificationTypeId>RVK</classificationTypeId>
          </i>
        </xsl:for-each>
        <xsl:variable name="ddc" as="xs:string *">
          <xsl:for-each select="original/(datafield[@tag='045F']/subfield[@code='a'][.!='B']|datafield[@tag='045H']/subfield[@code='a'][.!='B'])">
            <xsl:sequence select="normalize-space(translate(.,'/',''))"/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="distinct-values($ddc)">
          <xsl:sort/>
          <i>
            <classificationNumber><xsl:value-of select="."/></classificationNumber>
            <classificationTypeId>DDC</classificationTypeId>
          </i>
        </xsl:for-each>
      </arr>
    </classifications>
  </xsl:template>
  
  <xsl:template match="record">
    <xsl:if test="not((substring(original/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') or (original/datafield[@tag='002@']/subfield[@code='0'] = 'amy'))"> <!-- Bingen keine Online-Ressourcen und keine "Mailboxen" -->
      <record>
        <xsl:copy-of select="original"/>
        <xsl:choose>
          <xsl:when test="exists(original/item[starts-with(datafield[@tag='208@']/subfield[@code='b'],'z')])"> <!-- ZDB-Fälle -->
            <xsl:call-template name="processingzdb"/>
            <instance>
              <source>K10plus</source>
              <identifiers>
                <arr>
                  <i>
                    <value><xsl:value-of select="original/datafield[@tag='003@']/subfield[@code='0']"/></value>
                    <identifierTypeId>PPN-K10plus</identifierTypeId>
                  </i>
                  <i>
                    <value><xsl:value-of select="(original/datafield[@tag='003H']/subfield[@code='0']|original/datafield[@tag='006H']/subfield[@code='0'],'nil')[1]"/></value>
                    <identifierTypeId>PPN-Hebis</identifierTypeId>
                  </i>
                  <xsl:copy-of select="instance/identifiers/arr/i"/>
                </arr>
              </identifiers>
              <xsl:copy-of select="instance/*[not(self::source or self::administrativeNotes or self::identifiers)]"/>
              <xsl:call-template name="classifications"/>
                <statisticalCodeIds>
                  <arr>
                    <xsl:if test="exists(original/item[not(starts-with(datafield[@tag='208@']/subfield[@code='b'],'z'))])">
                      <i>ZDB-Titel-mit-Mono-EPN</i>
                    </xsl:if> 
                  </arr>
                </statisticalCodeIds>
              <administrativeNotes>
                <arr>
                  <xsl:copy-of select="instance/administrativeNotes/arr/*"/>
                  <i>
                    <xsl:value-of select="concat('ZDB/K10Plus-Instanz+Holdings aus PPN: ',original/datafield[@tag='003@']/subfield[@code='0'])"/>
                    <xsl:if test="original/datafield[@tag='003H']/subfield[@code='0']"><xsl:value-of select="concat(' mit Hebis-PPN: ',original/datafield[@tag='003H']/subfield[@code='0'])"></xsl:value-of></xsl:if>
                  </i>
                </arr>
              </administrativeNotes>
            </instance>
            <holdingsRecords>
              <arr>
                <xsl:for-each select="original/item[starts-with(datafield[@tag='208@']/subfield[@code='b'],'z')]">  <!-- nur ZDB-Holdings -->
                  <xsl:apply-templates select="."/>
                </xsl:for-each>              
              </arr>
            </holdingsRecords>
          </xsl:when>
          
          <xsl:otherwise> <!-- Mono -->
            <xsl:variable name="originalrec" select="original"/>
            <xsl:variable name="epnslokal" select="distinct-values(original/item/datafield[@tag='206X']/subfield[@code='0'])"/>
            <xsl:call-template name="processingmono"/>
            <instance>
              <source>K10plus</source>
              <identifiers>
                <arr>
                  <i>
                    <value><xsl:value-of select="original/datafield[@tag='003@']/subfield[@code='0']"/></value>
                    <identifierTypeId>PPN-K10plus</identifierTypeId>
                  </i>
                  <i>
                    <value><xsl:value-of select="(original/datafield[@tag='003H']/subfield[@code='0']|original/datafield[@tag='006H']/subfield[@code='0'],'nil')[1]"/></value>
                    <identifierTypeId>PPN-Hebis</identifierTypeId>
                  </i>
                  <xsl:copy-of select="instance/identifiers/arr/i"/>
                </arr>
              </identifiers>
              <xsl:copy-of select="instance/*[not(self::source or self::administrativeNotes or self::identifiers)]"/>
              <xsl:call-template name="classifications"/>
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
                      </arr>
                    </administrativeNotes>
                    <holdingsTypeId>physical</holdingsTypeId> <!-- retainExistingValues/forTheseProperties -->
                    <permanentLocationId>DUMMY</permanentLocationId> <!-- retainExistingValues/forTheseProperties -->
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

  <xsl:template name="permanentLocationId">
    <xsl:variable name="signatur" select="datafield[@tag='209A']/subfield[@code='a']"/>
    <xsl:variable name="electronicholding" select="substring(./../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'"/> 
      <xsl:choose>
        <xsl:when test="$electronicholding">ONLINE</xsl:when> <!-- z.Zt. nicht in FOLIO -->
        <xsl:when test="starts-with($signatur,'Ab/')">ARCH</xsl:when>
        <xsl:when test="starts-with($signatur,'P/') or (substring($signatur,1,1)&lt;='9' and substring($signatur,1,1)&gt;='0') ">FREI</xsl:when> <!-- 0-9 P/ -->
        <xsl:when test="starts-with($signatur,'FB') or starts-with($signatur,'U/')">FB</xsl:when>
        <xsl:when test="starts-with($signatur,'K/') or starts-with($signatur,'KK/')">KP</xsl:when>
        <xsl:when test="starts-with($signatur,'Rara')">RARA</xsl:when>
        <xsl:when test="starts-with($signatur,'VW/')">VW</xsl:when>
        <xsl:otherwise>NZ</xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <xsl:template match="provisionalInstance/source">
    <source>Provisional Instance</source>
  </xsl:template>

  <xsl:template match="item">
    <i>
      <xsl:variable name="epn" select="datafield[@tag='203@']/subfield[@code='0']"/>
      <administrativeNotes>
        <arr>
          <xsl:for-each select="datafield[@tag='201B']">
            <i>
              <xsl:value-of select="concat(./subfield[@code='0'], ', ', substring(./subfield[@code='t'],1,5), ' (Datum und Uhrzeit der letzten Änderung)')"/>
            </i>
          </xsl:for-each>
          <i><xsl:value-of select="concat('K10plus-Holding aus EPN: ',$epn)"/></i>
        </arr>
      </administrativeNotes>
      <formerIds>
        <arr>
          <i><xsl:value-of select="$epn"/></i>
          <i><xsl:value-of select="concat('HEB',datafield[@tag='203H']/subfield[@code='0'])"/></i>
          <!-- <i><xsl:value-of select="datafield[@tag='203H']/subfield[@code='0']"/></i> ohne HEB -->
        </arr>
      </formerIds>
      <hrid>
        <xsl:value-of select="$epn"/>
      </hrid>
      <permanentLocationId>
        <xsl:call-template name="permanentLocationId"/>
      </permanentLocationId>
      <xsl:variable name="electronicholding" select="substring(../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'"/>
      <callNumber>
        <xsl:if test="not($electronicholding)">
          <xsl:value-of select="datafield[(@tag='209A') and (subfield[@code='x']='00')]/subfield[@code='a']"/>
        </xsl:if>
      </callNumber>  
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
          <xsl:for-each select="datafield[@tag='220B' or @tag='237A']">
            <xsl:if test="./subfield[@code='a'] or ./subfield[@code='0']">
              <i>
                <note>
                  <xsl:value-of select="./subfield[@code='a'] | ./subfield[@code='0']"/>
                </note>
                <holdingsNoteTypeId>Note</holdingsNoteTypeId>
                <staffOnly>
                  <xsl:value-of select="./@tag!='237A'"/>
                </staffOnly>
              </i>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="datafield[(@tag='209A')]/subfield[@code='f']"> <!-- and (subfield[@code='x']='00') -->
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>Standort (8201)</holdingsNoteTypeId> <!-- TBD 8201 umbenennen? -->
              <staffOnly>false</staffOnly>
            </i>             
          </xsl:for-each>
          <xsl:if test="datafield[@tag='201B']">
            <i>
              <note>
                <xsl:value-of select="concat(translate(datafield[@tag='201B']/subfield[@code='0'], '-', '.'),' ', substring(datafield[@tag='201B']/subfield[@code='t'],1,5))"/>
              </note>
              <holdingsNoteTypeId>Letzte Änderung CBS</holdingsNoteTypeId>
              <staffOnly>true</staffOnly>
            </i>
          </xsl:if>
          <xsl:for-each select="datafield[@tag='209O']/subfield[@code='a']">
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
          <!-- entfernt, weil über HDS2 angezeigt und sonst gedoppelt
          <xsl:for-each select="datafield[(@tag='244Z') and (subfield[@code='x']&gt;'79') and (subfield[@code='x']&lt;'99')]">
            <i>
              <note>
                <xsl:value-of select="./subfield[(@code='8')]"/>
                <xsl:if test="./subfield[@code='b']">
                  <xsl:text>. </xsl:text><xsl:value-of select="./subfield[@code='b']"/>
                </xsl:if>
              </note>
              <holdingsNoteTypeId>Provenance</holdingsNoteTypeId>
              <staffOnly>false</staffOnly>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[(@tag='244Z') and (subfield[@code='x']='99')]">
            <i>
              <note>
                <xsl:value-of select="./subfield[@code='a']"/>
                <xsl:if test="./subfield[@code='b']">
                  <xsl:text>. </xsl:text><xsl:value-of select="./subfield[@code='b']"/>
                </xsl:if>
              </note>
              <holdingsNoteTypeId>Provenance</holdingsNoteTypeId>
              <staffOnly>false</staffOnly>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[(@tag='220D')]">
            <i>
              <note>
                <xsl:value-of select="./subfield[@code='a']"/>
              </note>
              <holdingsNoteTypeId>Provenance</holdingsNoteTypeId>
              <staffOnly>false</staffOnly>
            </i>
          </xsl:for-each>
                    -->
   
          <xsl:if test="datafield[(@tag='209A') and (subfield[@code='x']='00') and subfield[@code='h']]">
            <i>
              <note>
                <xsl:value-of select="datafield[@tag='209A']/subfield[@code='h']"/>
              </note>
              <holdingsNoteTypeId><xsl:text>Signatur Ansetzungsform (7100)</xsl:text></holdingsNoteTypeId>
              <staffOnly>true</staffOnly>  
            </i>
          </xsl:if>
          <xsl:for-each select="datafield[(@tag='209A') and (subfield[@code='x']!='00')]/subfield[(@code='a') or (@code='h')]">
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>
                <xsl:variable name="codex" select="../subfield[@code='x']"/>
                <xsl:choose>
                  <xsl:when test="$codex='09'">
                    <xsl:text>Magazinsignatur (nur Monografien) (71</xsl:text><xsl:value-of select="$codex"/><xsl:text>)</xsl:text>
                  </xsl:when>
                  <xsl:when test="$codex='10'">
                    <xsl:text>Magazinsignatur (nur Zeitschriften) (71</xsl:text><xsl:value-of select="$codex"/><xsl:text>)</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>Weitere Signaturen (71</xsl:text><xsl:value-of select="$codex"/><xsl:text>)</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </holdingsNoteTypeId>
              <staffOnly>true</staffOnly>  
            </i>
          </xsl:for-each>
        </arr>
      </notes>
      <discoverySuppress>false</discoverySuppress>   
      <sourceId>K10plus</sourceId>
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
                <xsl:with-param name="HEBhhrid" select="concat('HEB',datafield[@tag='203H']/subfield[@code='0'],'-',$copy)"/>
                <!-- <xsl:with-param name="HEBhhrid" select="concat(datafield[@tag='203H']/subfield[@code='0'],'-',$copy)"/> ohne HEB -->
              </xsl:apply-templates>
            </xsl:for-each>
            <xsl:if test="not(datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'])">
              <!--   <xsl:message>Debug: EPN <xsl:value-of select="$epn"/></xsl:message>  -->
              <xsl:apply-templates select="." mode="make-item">
                <xsl:with-param name="hhrid" select="concat($epn,'-1')"/>
                <xsl:with-param name="HEBhhrid" select="concat('HEB',datafield[@tag='203H']/subfield[@code='0'],'-1')"/>
                <!-- <xsl:with-param name="HEBhhrid" select="concat(datafield[@tag='203H']/subfield[@code='0'],'-1')"/> ohne HEB -->
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
      
    </i>
  </xsl:template>

  <xsl:template match="item" mode="make-item">
    <xsl:param name="hhrid"/>
    <xsl:param name="copy"/>
    <xsl:param name="HEBhhrid"></xsl:param>
    <i>
      <formerIds>
        <arr>
          <i><xsl:value-of select="$hhrid"/></i>
          <i><xsl:value-of select="$HEBhhrid"/></i>
        </arr>
      </formerIds>

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
      
      <!-- No item for electronic access in hebis -->

      <discoverySuppress>false</discoverySuppress>
      <statisticalCodeIds/>
    </i>
  </xsl:template>

 </xsl:stylesheet>