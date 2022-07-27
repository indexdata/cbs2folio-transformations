<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <!-- ILN specific processing -->
  <xsl:template name="lcode"><xsl:value-of select="@epn"/></xsl:template>
  <xsl:template name="loantype">
    <xsl:choose>
      <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='d'">dummy</xsl:when>
      <xsl:otherwise><xsl:value-of select="datafield[@tag='209A']/subfield[@code='d']"/></xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="selectioncode"><xsl:value-of select="datafield[@tag='208@']/subfield[@code='b']"/></xsl:template>

  <xsl:template match="collection">
    <collection>
        <xsl:apply-templates select="record"/>
    </collection>
  </xsl:template>

  <xsl:template match="record">
    <record>
      <xsl:for-each select="*[not(self::processing)]">
            <xsl:copy-of select="."/>
        </xsl:for-each>
        <xsl:apply-templates select="original"/>
    </record>
  </xsl:template>

  <xsl:template match="original">
    <xsl:if test="item/datafield[@tag='203@']/subfield[@code='0']">
      <processing>
        <item>
          <status>
            <policy>retain</policy>
          </status>
        </item>
      </processing>
      <holdingsRecords>
        <arr>
          <xsl:apply-templates select="item"/>
       </arr>
      </holdingsRecords>
    </xsl:if>
  </xsl:template>

  <xsl:template match="item">
    <i>
      <xsl:variable name="hhrid" select="datafield[@tag='203@']/subfield[@code='0']"/>
      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
      <permanentLocationId>
        <xsl:call-template name="lcode"/>
      </permanentLocationId>
      <!-- There is no 109R in hebis, see $electronicholding -->
      <xsl:variable name="electronicholding" select="(substring(../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
      <xsl:if test="not($electronicholding) and (substring(datafield[@tag='208@']/subfield[@code='b'],1,1) != 'd')">
         <callNumber>
           <xsl:value-of select="datafield[@tag='209A']/subfield[@code='a']"/>
         </callNumber>
      </xsl:if>
	    <holdingsTypeId>
  		  <xsl:choose>
  		    <xsl:when test="substring(../datafield[@tag='002@']/subfield[@code='0'], 1, 1) = 'O'">electronic</xsl:when>
  		     <xsl:otherwise>physical</xsl:otherwise>
  		  </xsl:choose>
	    </holdingsTypeId>
      <holdingsStatements>
        <xsl:if test="datafield[(@tag='209E')]/subfield[@code='a']">
          <arr>
            <xsl:for-each select="datafield[(@tag='209E') and (subfield[@code='x']='01' or subfield[@code='x']='02' or subfield[@code='x']='03')]/subfield[@code='a']">
              <i>
                <statement>
                    <xsl:if test="../subfield[@code='x']='03'">
                       <xsl:text>Angaben zur Vollständigkeit: </xsl:text>  
                    </xsl:if>
                  <xsl:value-of select="."/>
                </statement>
                <xsl:if test="(../subfield[@code='x']='02') and (../../datafield[@tag='209E']/subfield[@code='x']='04')">
                  <note>
                    <xsl:value-of select="../../datafield[@tag='209E']/subfield[@code='a']"/>
                  </note>
                </xsl:if>
              </i>
            </xsl:for-each>
            <xsl:if test="not (datafield[@tag='209E']/subfield[@code='x']='02') and (datafield[@tag='209E']/subfield[@code='x']='04')">
              <i>
                <note>
                  <xsl:value-of select="datafield[@tag='209E']/subfield[@code='a']"/>
                </note>
              </i>
            </xsl:if>
          </arr>
  	    </xsl:if>
      </holdingsStatements>
      
      <!-- Lokale Schluessel: moved to holding -->
      <notes>
        <arr>
          <xsl:for-each select="datafield[@tag='209B' and not(subfield[@code='x']='01' or subfield[@code='x']='02')]">
            <i>
              <note>
                <xsl:value-of select="./subfield[@code='a']"/>
              </note>
              <holdingsNoteTypeId>Lokaler Schluessel</holdingsNoteTypeId>
              <staffOnly>false</staffOnly>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[(@tag='244Z') and (subfield[@code='x']&gt;'79') and (subfield[@code='x']&lt;'99')]">
            <i>
              <note>
                <xsl:value-of select="./subfield[(@code='8') or (@code='a')]"/> <!-- Workaround: a or 8 -->
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
          <xsl:for-each select="datafield[@tag='209S']/subfield[@code='S'] | datafield[@tag='204U']/subfield[@code='S'] | datafield[@tag='204P']/subfield[@code='S'] | datafield[@tag='204R']/subfield[@code='S'] ">
            <i>
              <note>
                <xsl:value-of select="."/>
              </note>
              <holdingsNoteTypeId>Lizenzindikator</holdingsNoteTypeId>
              <staffOnly>false</staffOnly>
            </i>
          </xsl:for-each>
        </arr>
      </notes>
      <discoverySuppress>
        <xsl:choose>
          <xsl:when test="datafield[@tag='247E']/subfield[@code='a']"><xsl:text>true</xsl:text></xsl:when> <!-- selectionscode != true -->
          <xsl:otherwise><xsl:call-template name="selectioncode"/></xsl:otherwise>
        </xsl:choose>
      </discoverySuppress>   
      <sourceId>hebis</sourceId>
      <xsl:if test="not($electronicholding)">
         <items>
           <arr>
            <xsl:choose>
              <xsl:when test="(datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'])[2]">
                <xsl:for-each select="datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a']">
                  <xsl:message>Debug: <xsl:value-of select="."/></xsl:message>
                  <xsl:apply-templates select="../.." mode="make-item">
                  <xsl:with-param name="hhrid" select="concat($hhrid, '-', substring-before(.,' '))"/>
                  <xsl:with-param name="bcode" select="substring-before(.,' ')"/>
                  <xsl:with-param name="copy" select="substring-before(substring-after(.,'('),')')"/>
                  </xsl:apply-templates>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="." mode="make-item">
                  <xsl:with-param name="hhrid" select="$hhrid"/> <!-- TBD? -->
                </xsl:apply-templates>
                </xsl:otherwise>
             </xsl:choose>          
           </arr>
         </items>
      </xsl:if>
      <xsl:if test="$electronicholding">
        <electronicAccess>
          <arr>
            <xsl:for-each select="datafield[@tag='209S']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='u']"/>
                </uri>
              </i>
            </xsl:for-each>
            <xsl:for-each select="datafield[@tag='204P'] | datafield[@tag='204U'] | datafield[@tag='204R']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='0']"/>
                </uri>
              </i>
            </xsl:for-each>
          </arr>
        </electronicAccess>
      </xsl:if>
      <statisticalCodeIds>
        <arr>
          <xsl:for-each select="datafield[(@tag='209B') and not(subfield[@code='x']='01' or subfield[@code='x']='02')]">
            <i>
              <xsl:value-of select="./subfield[@code='a']"/>
            </i>
          </xsl:for-each>
        </arr>
      </statisticalCodeIds>
    </i>
  </xsl:template>
 
  <xsl:template match="item" mode="make-item">
    <xsl:param name="hhrid"/>
    <xsl:param name="bcode" select="substring-before(concat(datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'],' '),' ')"/>
    <xsl:param name="copy" select="''"/> <!-- oder kann hier eine copy-Information kommen? -->
    <i>
      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
      
      <!-- Hebis / K10plus -->  
      <materialTypeId>
        <xsl:variable name="type1" select="substring(../datafield[@tag='002@']/subfield[@code='0'], 1, 1)"/>
        <xsl:variable name="pd" select="../datafield[@tag='013H']/subfield[@code='0']"/>
        <xsl:choose>
          <xsl:when test="(($type1 = 'A') and ($pd = 'kart')) or ($type1 = 'K')">Karten</xsl:when> <!-- K10plus: pd kart type1 A / Hebis: type1 K -->
          <xsl:when test="(($type1 = 'A') and ($pd = 'muno')) or ($type1 = 'M')">Noten</xsl:when> <!-- K10plus: pd muno type1 A / Hebis: type1 M -->
          <xsl:when test="($type1 = 'A') or ($type1 = 'H') or ($type1 = 'I') or ($type1 = 'L') or (($type1 = 'B') and ($pd = 'bild'))">Druckschrift</xsl:when> <!-- K10plus: pd bild type1 B / Hebis: type1 I -->
          <xsl:when test="($type1 = 'G') or (($type1 = 'B') and ($pd = 'soto'))">Tonträger</xsl:when> <!-- K10pus: pd soto type1 B / Hebis: type1 G -->
          <xsl:when test="$type1 = 'B'">Audiovisuelles Material</xsl:when> <!-- K10plus: pd vide type1 B / Hebis: type1 B -->
          <xsl:when test="$type1 = 'C'">Blindenschriftträger</xsl:when>
          <xsl:when test="$type1 = 'E'">Mikroformen</xsl:when>
          <!-- <xsl:when test="$type1 = 'O'">E-Ressource</xsl:when> --> <!-- no items -->
          <xsl:when test="$type1 = 'S'">Computerlesbares Material</xsl:when>
          <xsl:when test="$type1 = 'V'">Objekt</xsl:when>
          <xsl:otherwise>Sonstiges</xsl:otherwise>
        </xsl:choose>
      </materialTypeId>
 
      <permanentLoanTypeId>
        <xsl:call-template name="loantype"/>
      </permanentLoanTypeId>
      <status>
        <name>
          <xsl:choose>
            <xsl:when test="(substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd') or 
                            (substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'p') or
                            (substring(datafield[@tag='208@']/subfield[@code='b'],1,2) = 'gp')">Intellectual item</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='a'">On order</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='e'">Missing</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='z'">Withdrawn</xsl:when>
      	 		<xsl:when test="datafield[@tag='209A']/subfield[@code='d']='g'">Unavailable</xsl:when>
            <xsl:otherwise>Available</xsl:otherwise>
          </xsl:choose>
        </name>
      </status>
      <itemLevelCallNumber>
        <xsl:value-of select="datafield[@tag='209A']/subfield[@code='a']"/>
      </itemLevelCallNumber>
      <barcode>
        <xsl:value-of select="$bcode"/>
      </barcode>
      <copyNumber>
        <xsl:value-of select="$copy"/>
      </copyNumber>
      <volume>
        <xsl:for-each select="datafield[@tag='231@']/subfield[@code='d' or @code='n']"> <!-- TBD: check if needed -->
          <xsl:choose>
            <xsl:when test="./@code='n'">
              <xsl:value-of select="concat('-', .)"/>
            </xsl:when>
            <xsl:when test="./@code='d' and position()&gt;1">
              <xsl:value-of select="concat(', ', .)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="position()=last() and ./@code='d' and ../subfield[@code='6']">-</xsl:if>
        </xsl:for-each>
      </volume>
      <chronology>
        <xsl:for-each select="datafield[@tag='231@']/subfield[@code='j' or @code='k']">
          <xsl:choose>
            <xsl:when test="./@code='k'">
              <xsl:value-of select="concat('-', .)"/>
            </xsl:when>
            <xsl:when test="./@code='j' and position()&gt;1">
              <xsl:value-of select="concat(', ', .)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="position()=last() and ./@code='j' and ../subfield[@code='6']">-</xsl:if>
        </xsl:for-each>
      </chronology>
      <xsl:if test="datafield[@tag='220B' or @tag='220C' or @tag='220E' or @tag='237A' or @tag='247D']">
        <notes>
          <arr>
            <xsl:for-each select="datafield[@tag='220B' or @tag='220C' or @tag='220E' or @tag='237A']">
              <xsl:if test="./subfield[@code='a'] or ./subfield[@code='0']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='a'] | ./subfield[@code='0']"/>
                  </note>
                  <itemNoteTypeId>Note</itemNoteTypeId>
                  <staffOnly>
                    <xsl:value-of select="./@tag!='237A'"/>
                  </staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test="datafield[@tag='247D']">
              <i>
                <note>
                  <xsl:value-of select="datafield[@tag='247D']/subfield[@code='a']"/>
                </note>
                <itemNoteTypeId>Text zur Ausleihbarkeit</itemNoteTypeId>
                <staffOnly>false</staffOnly>
              </i>
            </xsl:if>
            <xsl:for-each select="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']">
                <i>
                  <note>
                    <xsl:value-of select="."/>
                  </note>
                  <itemNoteTypeId>Standort (8201)</itemNoteTypeId>
                  <staffOnly>false</staffOnly>
                </i>             
            </xsl:for-each>
          </arr>
        </notes>
      </xsl:if>
      <!-- No item for electronic access in hebis -->
      <accessionNumber>
        <xsl:for-each select="datafield[@tag='209C']">
          <xsl:value-of select="./subfield[@code='a']"/>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </accessionNumber>
    	 <discoverySuppress>
    	   <xsl:choose>
    	     <xsl:when test="datafield[@tag='247E']/subfield[@code='a']"><xsl:text>true</xsl:text></xsl:when>
    	     <xsl:otherwise><xsl:call-template name="selectioncode"/></xsl:otherwise>
    	   </xsl:choose>
    	</discoverySuppress>
    </i>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
