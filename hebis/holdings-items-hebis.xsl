<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <!-- ILN specific processing -->
  <xsl:template name="lcode"><xsl:value-of select="@epn"/></xsl:template>
  <xsl:template name="loantype"><xsl:value-of select="@epn"/></xsl:template>

  <xsl:template match="collection">
    <collection>
        <xsl:apply-templates/>
    </collection>
  </xsl:template>

  <xsl:template match="record">
    <record>
        <xsl:for-each select="@* | node()">
            <xsl:copy-of select="."/>
        </xsl:for-each>
        <xsl:apply-templates/>
    </record>
  </xsl:template>

  <xsl:template match="original">
    <xsl:if test="item/datafield[@tag='203@']/subfield[@code='0']">
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
      <!-- TBD ILN-abhängig  -->    
      <xsl:variable name="cnprefix">
        <xsl:choose>
          <xsl:when test="contains(datafield[@tag='209A']/subfield[@code='a'],'°')">
            <xsl:value-of select="concat(normalize-space(translate(substring-before(datafield[@tag='209A']/subfield[@code='a'],'°'),'@','')),'°')"/>
          </xsl:when>
          <xsl:when test="contains(datafield[@tag='209A']/subfield[@code='a'],'@')">
              <xsl:value-of select="normalize-space(substring-before(datafield[@tag='209A']/subfield[@code='a'],'@'))"/> 
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="cn">
        <xsl:choose>
          <xsl:when test="contains(datafield[@tag='209A']/subfield[@code='a'],'°')">
            <xsl:value-of select="normalize-space(translate(substring-after(datafield[@tag='209A']/subfield[@code='a'],'°'),'@',''))"/>
          </xsl:when>
          <xsl:when test="contains(datafield[@tag='209A']/subfield[@code='a'],'@')">
            <xsl:value-of select="normalize-space(translate(substring-after(datafield[@tag='209A']/subfield[@code='a'],'@'),'@',''))"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(datafield[@tag='209A']/subfield[@code='a'])"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <!-- Ende ILN -->
      <!-- Note! There is no 109R in hebis, see $electronicholding -->
 <!--     <xsl:variable name="electronicholding" select="(substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'l') or (substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'o') or (datafield[@tag='209A']/subfield[@code='f']='001') or (datafield[@tag='209A']/subfield[@code='f']='900')"/> -->
      <xsl:variable name="electronicholding" select="(substring(../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
      <xsl:if test="not($electronicholding) and (substring(datafield[@tag='208@']/subfield[@code='b'],1,1) != 'd')">
         <xsl:if test="string-length($cnprefix)>0">
          <callNumberPrefix>
            <xsl:value-of select="$cnprefix"/>
            <xsl:message>Debug: Prefix "<xsl:value-of select="$cnprefix"/>"</xsl:message>
          </callNumberPrefix>
         </xsl:if>
         <callNumber>
           <xsl:value-of select="$cn"/>
           <xsl:message>Debug: Call Number "<xsl:value-of select="$cn"/>"</xsl:message>
         </callNumber>
      </xsl:if>
	    <holdingsTypeId>
	    <xsl:variable name="holType" select="../datafield[@tag='002@']/subfield[@code='0']"/>
		  <xsl:variable name="holType1" select="substring($holType, 1, 1)"/>
		  <xsl:choose>
		     <xsl:when test="$holType1 = 'O'">electronic</xsl:when>
		     <xsl:otherwise>physical</xsl:otherwise>
		  </xsl:choose>
	    </holdingsTypeId>
      <holdingsStatements>
      <xsl:if test="datafield[(@tag='209E') and (subfield[@code='x']='02')]/subfield[@code='a']">
		  <arr>
		    <xsl:for-each select="datafield[(@tag='209E') and (subfield[@code='x']='02')]/subfield[@code='a']">
			  <i>
			    <statement>
				  <xsl:value-of select="."/>
				</statement>
              </i>
			</xsl:for-each>
		  </arr>
	    </xsl:if>
      </holdingsStatements>
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
                  <xsl:with-param name="cnprefix" select="$cnprefix"/>
                  <xsl:with-param name="cn" select="$cn"/>
                  </xsl:apply-templates>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="." mode="make-item">
                  <xsl:with-param name="hhrid" select="$hhrid"/>
                  <xsl:with-param name="cnprefix" select="$cnprefix"/>
                  <xsl:with-param name="cn" select="$cn"/>
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
            <xsl:for-each select="datafield[@tag='204P']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='0']"/>
                </uri>
              </i>
            </xsl:for-each>
            <xsl:for-each select="datafield[@tag='204U']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='0']"/>
                </uri>
              </i>
            </xsl:for-each>
            <xsl:for-each select="datafield[@tag='204R']">
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
          <xsl:for-each select="datafield[(@tag='209B') and ((subfield[@code='a']='00015') or (subfield[@code='a']='00016') or (subfield[@code='a']='BASIS'))]">
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
    <xsl:param name="cnprefix"/>
    <xsl:param name="cn"/>
    <xsl:message>Debug: <xsl:value-of select="concat($hhrid,'#',$bcode,'#',$copy)"/></xsl:message>
    <i>
      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
      
      <!-- Hebis -->  <!-- TBD GBV-Materialtypen -->
      <materialTypeId>
        <xsl:variable name="type1" select="substring(../datafield[@tag='002@']/subfield[@code='0'], 1, 1)"/>
        <xsl:variable name="pd" select="../datafield[@tag='013H']/subfield[@code='0']"/>
        <xsl:choose>
          <xsl:when test="($type1 = 'A') or ($type1 = 'H') or ($type1 = 'I') or ($type1 = 'L')">Druckschrift</xsl:when> <!-- pd bild type1 B statt type1 I -->
          <xsl:when test="$type1 = 'B'">Audiovisuelles Material</xsl:when> <!-- pd vide type1 B -->
          <xsl:when test="$type1 = 'C'">Blindenschriftträger</xsl:when>
          <xsl:when test="$type1 = 'E'">Mikroformen</xsl:when>
          <xsl:when test="$type1 = 'G'">Tonträger</xsl:when> <!-- pd soto type1 B -->
          <xsl:when test="$type1 = 'K'">Karten</xsl:when> <!-- pd kart type1 A -->
          <xsl:when test="$type1 = 'M'">Noten</xsl:when> <!-- pd muno type1 A -->
          <!-- <xsl:when test="$type1 = 'O'">E-Ressource</xsl:when> --> <!-- no items -->
          <xsl:when test="$type1 = 'S'">Computerlesbares Material</xsl:when>
          <xsl:when test="$type1 = 'V'">Objekt</xsl:when>
          <xsl:otherwise>Sonstiges</xsl:otherwise>
        </xsl:choose>
      </materialTypeId>
 
       <!-- GBV Style
      <materialTypeId>
        <xsl:variable name="type" select="../datafield[@tag='002@']/subfield[@code='0']"/>
        <xsl:variable name="type1" select="substring($type, 1, 1)"/>
        <xsl:variable name="type12" select="substring($type, 1, 2)"/>
        <xsl:variable name="type2" select="substring($type, 2, 1)"/>
        <xsl:variable name="pd" select="../datafield[@tag='013H']/subfield[@code='0']"/>
        <xsl:variable name="mt" select="../datafield[@tag='002D']/subfield[@code='b']"/>
        <xsl:choose>
          <xsl:when test="$type12 = 'Ab'">
            <xsl:choose>
              <xsl:when test="$pd = 'zt'">Zeitung</xsl:when>
              <xsl:otherwise>Zeitschrift</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$type2 = 's'">Aufsatz</xsl:when>
          <xsl:when test="$type2 = 'c'">Mehrteilige Monografie</xsl:when>
          <xsl:when test="$type2 = 'd'">Serie</xsl:when>
          <xsl:when test="$type1 = 'A'">
            <xsl:choose>
              <xsl:when test="$pd = 'kart'">Karte(nwerk)</xsl:when>
              <xsl:when test="$pd = 'lo'">Loseblattwerk</xsl:when>
              <xsl:when test="$pd = 'muno'">Musiknote</xsl:when>
              <xsl:otherwise>Buch</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$type1 = 'B'">
            <xsl:choose>
              <xsl:when test="$pd = 'vide' or $mt = 'v'">Film (DVD/Video)</xsl:when>
              <xsl:when test="$mt = 'g' or $mt = 'n'">Bild(ersammlung)</xsl:when>
              <xsl:when test="$mt = 'muno'">Musiknote</xsl:when>
              <xsl:otherwise>Tonträger</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$type1 = 'C'">Blindenschriftträger</xsl:when>
          <xsl:when test="$type1 = 'E'">Mikroform</xsl:when>
          <xsl:when test="$type1 = 'H'">Handschrift</xsl:when>
          <xsl:when test="$type1 = 'O'">E-Ressource</xsl:when>
          <xsl:when test="$type1 = 'S'">E-Ressource auf Datenträger</xsl:when>
          <xsl:when test="$type1 = 'V'">Objekt</xsl:when>
          <xsl:when test="$type = 'Lax'">Lax</xsl:when>
          <xsl:otherwise>Nicht spezifiziert</xsl:otherwise>
        </xsl:choose>
      </materialTypeId> -->
 
      <permanentLoanTypeId>
        <xsl:call-template name="loantype"/>
      </permanentLoanTypeId>
      <!-- ILN TBD? Item status -->   
      <status>
        <name>
          <xsl:choose>
            <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">Intellectual item</xsl:when>
            <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'p'">Intellectual item</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='a'">On order</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='e'">Missing</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='z'">Withdrawn</xsl:when>
      	 		<xsl:when test="datafield[@tag='209A']/subfield[@code='d']='g'">Unavailable</xsl:when>
            <xsl:otherwise>Available</xsl:otherwise>
          </xsl:choose>
        </name>
      </status>
      <!-- ILN Ende -->   
      <xsl:if test="string-length($cnprefix)>0">
        <itemLevelCallNumberPrefix> 
          <xsl:value-of select="$cnprefix"/>
        </itemLevelCallNumberPrefix>
      </xsl:if>
      <itemLevelCallNumber>
        <xsl:value-of select="$cn"/>
      </itemLevelCallNumber>
      <barcode>
        <xsl:value-of select="$bcode"/>
      </barcode>
      <copyNumber>
        <xsl:value-of select="$copy"/>
      </copyNumber>
      <volume>
        <xsl:for-each select="datafield[@tag='231@']/subfield[@code='d' or @code='n']">
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
      <enumeration>
        <xsl:value-of select="datafield[@tag='231B']/subfield[@code='a']"/>
      </enumeration>
      <numberOfPieces>
        <xsl:value-of select="datafield[@tag='208F']/subfield[@code='a']"/>
      </numberOfPieces>
      <xsl:if test="datafield[@tag='220B' or @tag='237A' or @tag='244Z' or @tag='209O' or @tag='206X' or @tag='206W']">
        <notes>
          <arr>
            <xsl:for-each select="datafield[@tag='220B' or @tag='237A' or @tag='209O' or @tag='206X' or @tag='206W']">
              <xsl:if test="./subfield[@code='a'] or ./subfield[@code='0']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='a'] | ./subfield[@code='0']"/>
                  </note>
                  <itemNoteTypeId>Note</itemNoteTypeId>
                  <staffOnly>
                    <xsl:choose>
                      <xsl:when test="./@tag='237A'">false</xsl:when>
                      <xsl:otherwise>true</xsl:otherwise>
                    </xsl:choose>
                  </staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="datafield[@tag='244Z']">
              <xsl:variable name="expansion" select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
              <i>
                <note>
                  <xsl:choose>
                    <xsl:when test="./subfield[@code='S']">
                      <xsl:choose>
                        <xsl:when test="$expansion">
                          <xsl:value-of select="concat(./subfield[@code='S'], ' ', $expansion)"/>
                        </xsl:when>
                        <xsl:when test="./subfield[@code='8']">
                          <xsl:value-of select="concat(./subfield[@code='S'], ' ', ./subfield[@code='8'])"/>
                        </xsl:when>
                        <xsl:when test="./subfield[@code='a']">
                          <xsl:value-of select="concat(./subfield[@code='S'], ' ', ./subfield[@code='a'])"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="$expansion">
                          <xsl:value-of select="$expansion"/>
                        </xsl:when>
                        <xsl:when test="./subfield[@code='8']">
                          <xsl:value-of select="./subfield[@code='8']"/>
                        </xsl:when>
                        <xsl:when test="./subfield[@code='a']">
                          <xsl:value-of select="./subfield[@code='a']"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                </note>
                <itemNoteTypeId>Note</itemNoteTypeId>
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
      <!-- ILN-abhängig TBD  (TBD Kat. 4850?) ILN3: (substring($selectioncode, 1, 1) = 'g') -->   
    	 <discoverySuppress>
      	 <xsl:variable name="selectioncode" select="datafield[@tag='208@']/subfield[@code='b']"/>
      	 <xsl:message>Debug: selection code <xsl:value-of select="$selectioncode"/></xsl:message>
            <xsl:choose>
              <xsl:when test="(substring($selectioncode, 1, 1) = 'g') or (substring($selectioncode, 2, 1) = 'y') or (substring($selectioncode, 2, 1) = 'z')">true</xsl:when>           
              <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose> 
    	</discoverySuppress>
      <!-- ILN Ende -->   
    </i>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
