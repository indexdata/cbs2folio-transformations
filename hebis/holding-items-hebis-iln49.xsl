<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <!-- ILN 49 HS Mainz -->

  <xsl:template match="record[delete]">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="record">
    <xsl:if test="not(substring(original/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O')"> <!-- Bingen keine Online-Ressourcen -->
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
          <!--  TBD: lokale Sacherschließung?
            <subjects>  TBD: lokale Sacherschließung?
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
    </xsl:if>
  </xsl:template>
  
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
    <xsl:variable name="standort" select="upper-case(($i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'])[1])"/>
    <xsl:variable name="signatur" select="($i/datafield[@tag='209A']/subfield[@code='a'])[1]"/>
    <xsl:variable name="selectionscode" select="$i/datafield[@tag='208@']/subfield[@code='b']"/>
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <xsl:variable name="onorder" select="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a'"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="($selectionscode = 'da') or ($selectionscode = 'dummy')">DUMMY</xsl:when>
           <xsl:when test="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],2,1) = 'o') and not($i/datafield[@tag='209A']/subfield[@code='d'])">AUFSATZ</xsl:when>
           <xsl:when test="$selectionscode = 'a'">ZEB</xsl:when>
           <xsl:when test="starts-with($standort,upper-case('Große Bücher'))">GROSS</xsl:when>
           <xsl:when test="starts-with($standort,'SEMESTERAPPARAT')">SEMAPP</xsl:when>
           <xsl:when test="starts-with($standort,'BÜRO') or $standort='EXTERN'">FBVW</xsl:when>
           <xsl:when test="contains($standort,'THEKE') or contains($standort,'VITRINE') or contains($standort,'ZEITUNGSAUSLAGE')">THEKE</xsl:when>
           <xsl:when test="$abt='000'">
             <xsl:choose>
               <xsl:when test="starts-with($signatur,'G')">UGG</xsl:when>
               <xsl:when test="starts-with($signatur,'K') and contains($standort,'MEDIENRAUM')">UGMED</xsl:when>
               <xsl:when test="starts-with($signatur,'K')">UGK</xsl:when>
               <xsl:when test="starts-with($signatur,'V')">UGV</xsl:when>
               <xsl:when test="starts-with($signatur,'Z')">UGZS</xsl:when>
               <xsl:otherwise>NZ</xsl:otherwise>
             </xsl:choose>
           </xsl:when>
           <xsl:when test="$abt='001'">
             <xsl:choose>
               <xsl:when test="starts-with($signatur,'A') and starts-with($standort,'ARCHITEKTUR')">OGARCH</xsl:when>
               <xsl:when test="starts-with($signatur,'A') and starts-with($standort,'ALLGEMEINES')">OGALLG</xsl:when>
               <xsl:when test="starts-with($signatur,'B') and starts-with($standort,'BETRIEBSWIRTSCHAFT')">OGBWL</xsl:when>
               <xsl:when test="starts-with($signatur,'B') and starts-with($standort,'BAU')">OGBAU</xsl:when>
               <xsl:when test="starts-with($signatur,'G')">OGG</xsl:when>
               <xsl:when test="starts-with($signatur,'L')">OGL</xsl:when>
               <xsl:when test="starts-with($signatur,'N')">OGN</xsl:when>
               <xsl:when test="starts-with($signatur,'R')">OGR</xsl:when>
               <xsl:when test="starts-with($signatur,'S')">OGS</xsl:when>
               <xsl:when test="starts-with($signatur,'V')">OGV</xsl:when>
               <xsl:when test="starts-with($signatur,'Z')">UGZS</xsl:when>
               <xsl:otherwise>NZ</xsl:otherwise>
             </xsl:choose>
           </xsl:when>
           <xsl:when test="$abt='002'">MAG</xsl:when>
           <xsl:otherwise>NZ</xsl:otherwise>
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
     <xsl:if test="not(($abt='001' and (./note='Allgemeines' or ./note='Architektur' or ./note='Bau' or ./note='Betriebswirtschaft' or ./note='Freihand')) or
	  ($abt='000' and (./note='Freihand' or ./note='Medienraum')) or
	  ($abt='002' and (./note='MAG')))">	  
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
  
</xsl:stylesheet>
