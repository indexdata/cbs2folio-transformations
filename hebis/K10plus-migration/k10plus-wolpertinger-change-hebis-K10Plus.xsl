<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <xsl:variable name="version" select="'v9'"/>
  
  <!-- 
   - Von dubletten Bestände mit identischer 203H$0 wird nur der erste gemappt. 
   - Bestände ohne 203H$0 bekommen zunächst eine hrid mit KXP-Präfix, später die K10plus-EPN.
   - Beim Wolpertingern wird immer die erste PPN in der 003H$0 als Gewinner genommen, die 006H$0 wird dedupliziert und
     als Verlierer ausgespielt. Fehlt die 003H$0 wird zunächst ein KXP-hrid erzeugt und später gegen die K10plus-PPN
     getauscht. Gravierendere Identifier-Fehler erzeugen eine Warnung in den Verwaltungsnotizen.
   -->

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="record[delete]"/> <!-- no delete -->
 
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
          <matchesPattern>.*</matchesPattern>
        </retainOmittedRecord>
      </item>
      <holdingsRecord>
        <retainExistingValues>
          <forOmittedProperties>true</forOmittedProperties>
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

  <xsl:template match="record">
    <xsl:variable name="currentrecord" select="."/>
    <xsl:variable name="electronicholding" select="substring(original/datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'"/>
    <xsl:variable name="hebppns-dist" select="distinct-values(original/datafield[@tag='006H']/subfield[@code='0'])"/> <!-- weitere Hebis-PPN -->
    <xsl:variable name="hebppn" select="(original/datafield[@tag='003H']/subfield[@code='0'])[1]"/> <!-- 003H Primäre Hebis-PPN -->
    <xsl:variable name="hebgewinner" select="($hebppn,$hebppns-dist,concat('KXP',$currentrecord/instance/hrid))[1]"/>
    <xsl:variable name="hebppns" select="if (index-of($hebppns-dist,$hebgewinner)) then remove($hebppns-dist,index-of($hebppns-dist,$hebgewinner)) else $hebppns-dist" />
    <xsl:variable name="epns-ohne-hebis" select="distinct-values($currentrecord/holdingsRecords/arr/i[starts-with(formerIds/arr/i[2],'KXP')]/hrid)"/>
    <xsl:variable name="hebepns" select="distinct-values($currentrecord/holdingsRecords/arr/i/formerIds/arr/i[2])"/>
    <xsl:variable name="nohoxlokal" select="distinct-values(original/item/datafield[@tag='206X']/subfield[(@code='0') and not(starts-with(.,'hox'))])"/>
    
    <record>
      <xsl:choose>
        <xsl:when test="$electronicholding">
          <xsl:copy-of select="$currentrecord/processing"/>
        </xsl:when>
        <xsl:when test="($currentrecord/instance/source='ZDB') or not(exists($nohoxlokal))">
          <xsl:call-template name="processingzdb"></xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="processingmono"></xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
      <instance>
        <hrid><xsl:value-of select="$hebgewinner"/></hrid>
        <xsl:apply-templates select="$currentrecord/instance/*[not(self::hrid or self::administrativeNotes)]"/>
        <administrativeNotes>
          <arr>
            <xsl:apply-templates select="$currentrecord/instance/administrativeNotes/arr/*"/>
            <i>
              <xsl:text>Wolpertinger </xsl:text><xsl:value-of select="$version"/>
              <xsl:if test="$hebppns">
                <xsl:text> - Dubletten-PPN (Hebis): </xsl:text><xsl:value-of select="$hebppns" separator=", "/>
              </xsl:if>
            </i>
            <xsl:if test="not(empty($epns-ohne-hebis)) and not($electronicholding)">
              <i>
                <xsl:text>Uffbasse! K10plus-EPNs ohne Hebis-EPN: KXP... </xsl:text><xsl:value-of select="$epns-ohne-hebis" separator=", "/>
              </i> 
            </xsl:if>
          </arr>
        </administrativeNotes>
      </instance>
      <!-- instance relations entfallen und kommen mit K10plus wieder -->
      <!-- Gewinner: Holding und Items -->
      <holdingsRecords>           
         <arr>
           <xsl:for-each select="$currentrecord/holdingsRecords/arr/i[not(formerIds/arr/i[2])]">
             <xsl:apply-templates select="."/>
           </xsl:for-each>
           <xsl:for-each select="$hebepns">
             <xsl:apply-templates select="($currentrecord/holdingsRecords/arr/i[formerIds/arr/i[2]=current()])[1]"/>
           </xsl:for-each>
         </arr>
       </holdingsRecords>
    </record>
    <xsl:for-each select="$hebppns"> <!-- Verlierer -->
      <record>
        <xsl:copy-of select="$currentrecord/processing"/>
          <instance>
            <hrid><xsl:value-of select="."/></hrid>
            <identifiers>
              <arr>
                <xsl:apply-templates select="$currentrecord/instance/identifiers/arr/i[not((identifierTypeId='PPN-K10plus') or (identifierTypeId='PPN-Hebis'))]"/>
              </arr>
            </identifiers>
            <xsl:apply-templates select="$currentrecord/instance/*[not(self::hrid or self::administrativeNotes or self::identifiers or self::statisticalCodeIds)]"/>
            <administrativeNotes>
              <arr>
                <xsl:apply-templates select="$currentrecord/instance/administrativeNotes/arr/*"/>
                <i>
                  <xsl:text>Wolpertinger </xsl:text><xsl:value-of select="$version"/><xsl:text> für Hebis-PPN: </xsl:text><xsl:value-of select="."/>
                </i>
                <i>
                  <xsl:text>Dublette - wird gelöscht. Bestände verschoben nach Hebis-PPN: </xsl:text><xsl:value-of select="$hebgewinner"/>
                </i>
                <i>
                  <xsl:text>(ZDB-Bestände </xsl:text><xsl:value-of select="if (exists($hebepns)) then $hebepns else 'keine'" separator=", "/>
                  <xsl:text>; lokale Bestände </xsl:text><xsl:value-of select="if (exists($currentrecord/holdingsRecords/arr/i[not(formerIds/arr/i[2])]/hrid))
                    then $currentrecord/holdingsRecords/arr/i[not(formerIds/arr/i[2])]/hrid else 'keine' " separator=", "/><xsl:text>)</xsl:text>
                </i>
              </arr>
            </administrativeNotes>
            <statisticalCodeIds>
              <arr>
                <i>Dublettenbereinigung</i>
              </arr>
            </statisticalCodeIds>
          </instance>
          <!-- instance relations entfallen und kommen mit K10plus wieder -->
          <!-- Verlierer: keine Holdings, kein K10plus PPN -->
      </record>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="holdingsRecords/arr/i[not(formerIds/arr/i[2])]/hrid">
    <hrid><xsl:value-of select="if (starts-with(.,'HEB')) then substring-after(.,'HEB') else ."/></hrid>
  </xsl:template>

  <xsl:template match="holdingsRecords/arr/i[formerIds/arr/i[2]]/hrid">
    <hrid><xsl:value-of select="if (starts-with(../formerIds/arr/i[2],'HEB')) then substring-after(../formerIds/arr/i[2],'HEB') else ../formerIds/arr/i[2]"/></hrid>
  </xsl:template>

  <xsl:template match="items/arr/i[not(formerIds/arr/i[2])]/hrid">
    <hrid><xsl:value-of select="if (starts-with(.,'HEB')) then substring-after(.,'HEB') else ."/></hrid>
  </xsl:template>

  <xsl:template match="items/arr/i[formerIds/arr/i[2]]/hrid">
    <hrid><xsl:value-of select="if (starts-with(../formerIds/arr/i[2],'HEB')) then substring-after(../formerIds/arr/i[2],'HEB') else ../formerIds/arr/i[2]"/></hrid>
  </xsl:template>

</xsl:stylesheet>