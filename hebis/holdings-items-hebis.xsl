<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <!-- Dummies -->
  <xsl:template name="lcode">UNKNOWN</xsl:template>
  <xsl:template name="loantype">unknown</xsl:template>

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
      <!-- Electronic access -->
      <!-- Note! There is no 109R in hebis. There are always Level-2-Data (EPN)
		       There are Two Cases for permanentLocation "online": 
		        1.) "datafield[@tag='209A']/subfield[@code='a'] = '/'"
			         AND "datafield[@tag='209A']/subfield[@code='f']='001'"> 
			        (MAA: Obv and knz: p) = eigenkatalogisierte E-Journals
			   2.) There is no datafield[@tag='209A']. 
			       Tags for electronic addresses, like
			       209S Subfield u (URL)
			       204P Subfield 0 (DOI)
			       204U Subfield 0 (URN)
  				   204R Subfield 0 (handle)
				  (MAA: O* and knz: l*) = Lizenzexemplare (MAA: O* and knz: o*) = Eigenkatalogisate ebooks
			   Hrid should be EPN from "datafield[@tag='203@']/subfield[@code='0']" in both cases
		   -->
      <!-- ILN -->
      <xsl:variable name="electronicholding" select="(substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'l') or (substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'o') or (datafield[@tag='209A']/subfield[@code='f']='001')"/>
      <xsl:message>Debug: Electronic <xsl:value-of select="$electronicholding"/></xsl:message>
      <!-- Mainz/Hebis 209A$f/209G$a -->
      <xsl:variable name="lcode">
        <xsl:call-template name="lcode"/>
       </xsl:variable>
      <xsl:message>Debug: Location "<xsl:value-of select="$lcode"/>"</xsl:message>
      <!-- Ende ILN -->
      <permanentLocationId>
        <xsl:choose>
          <xsl:when test="$electronicholding">ONLINE</xsl:when>
          <xsl:otherwise><xsl:value-of select="$lcode"/></xsl:otherwise>
        </xsl:choose>
      </permanentLocationId>
      <!-- ILN -->    
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
      <!-- Ende ILN -->
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
       <xsl:if test="not($electronicholding) and ($lcode!='DUMMY')">
         <xsl:if test="string-length($cnprefix)>0">
          <callNumberPrefix> <!-- TBD: Element Name: OK -->
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
<!-- Hebis 209E$a -->
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
<!-- Hebis 209G$a -->
            <xsl:message>Debug: 209G - Hebis</xsl:message>
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
<!-- Hebis 209G$a -->   
    <xsl:param name="bcode" select="substring-before(concat(datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'],' '),' ')"/>
    <xsl:param name="copy" select="''"/> <!-- oder kann hier eine copy-Information kommen? -->
    <xsl:param name="cnprefix"/>
    <xsl:param name="cn"/>
    <xsl:message>Debug: <xsl:value-of select="concat($hhrid,'#',$bcode,'#',$copy)"/></xsl:message>
    <i>
      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
      <materialTypeId>
 <!--  Mainz/Hebis 002@$0  --> 
        <!-- Hebis/GBV? -->   
        <xsl:variable name="type1" select="substring(../datafield[@tag='002@']/subfield[@code='0'], 1, 1)"/>
        <xsl:choose>
          <xsl:when test="($type1 = 'A') or ($type1 = 'H') or ($type1 = 'I')">0 Druckschrift</xsl:when>
          <xsl:when test="$type1 = 'B'">1 Audiovisuelles Material</xsl:when>
          <!-- <xsl:when test="$type1 = 'C'">Blindenschriftträger</xsl:when> -->
          <xsl:when test="$type1 = 'E'">6 Mikroformen</xsl:when>
          <xsl:when test="$type1 = 'G'">2 Tonträger</xsl:when>
          <xsl:when test="$type1 = 'K'">4 Karten</xsl:when>
          <xsl:when test="$type1 = 'M'">5 Noten</xsl:when>
          <!-- <xsl:when test="$type1 = 'O'">E-Ressource</xsl:when> --> <!-- no items -->
          <xsl:when test="$type1 = 'S'">3 Computerlesbares Material</xsl:when>
          <!-- <xsl:when test="$type1 = 'V'">Objekt</xsl:when> -->
          <xsl:otherwise>9 Sonstiges</xsl:otherwise>
        </xsl:choose>
      </materialTypeId>
      <!-- ILN Ausleihindikator -->   
      <permanentLoanTypeId>
        <xsl:call-template name="loantype"/>
      </permanentLoanTypeId>
      <!-- ILN Ende -->   
      <!-- ILN ? Ausleihindikator  -->   
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
        <itemLevelCallNumberPrefix> <!-- TBD: Element Name: OK -->
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
 	  <!-- Mainz 208@$b Pos 1 = 'g' OR Pos 2 = 'y' OR Pos 2 = 'z'-->
      <!-- ILN -->   
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
