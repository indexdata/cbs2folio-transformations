<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
<!-- Mainz/Hebis-Anpassungen 10.8.21-17.8.21 -->

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
      <xsl:variable name="electronicholding" select="(substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'l') or (substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'o') or (datafield[@tag='209A']/subfield[@code='f']='001')"/>
      <xsl:message>Debug: Electronic <xsl:value-of select="$electronicholding"/></xsl:message>
      <!-- Mainz/Hebis 209A$f/209G$a -->
      <xsl:variable name="lcode">
        <xsl:choose>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='000'">
             <xsl:choose>
               <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='FREIHAND'">ZBFREI</xsl:when>
               <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='LBS'">ZBLBS</xsl:when>
               <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='LESESAAL'">ZBLS</xsl:when>
               <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'RARA')">ZBRARA</xsl:when>
               <xsl:otherwise>ZBMAG</xsl:otherwise>
             </xsl:choose>
		      </xsl:when>
		      <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='002'">
            <xsl:choose>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Erziehungswissenschaft'">GFGPÄD</xsl:when>
			      <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Filmwissenschaft'">GFGFILM</xsl:when>
		      	<xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Journalistik'">GFGJOUR</xsl:when>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Politikwissenschaft'">GFGPOL</xsl:when>
		      	<xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Psychologie'">GFGPSYCH</xsl:when>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Publizistik'">GFGPUB</xsl:when>
		      	<xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='Soziologie'">GFGSOZ</xsl:when>
	      		<xsl:otherwise>GFGPÄD</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='005'">
            <xsl:choose>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'LESESAAL')">UMLS</xsl:when>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'LBS')">UMLBS</xsl:when>
              <xsl:otherwise>UMFH</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='006'">
            <xsl:choose>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'LEHRBUCH')">MINLBS</xsl:when>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'Handapparat')">MINFAK</xsl:when>
              <xsl:otherwise>MIN</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='009'">FBMPI</xsl:when>	
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='016'">
            <xsl:choose>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'Rara')">THRARA</xsl:when>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'LEHRBUCH')">THLBS</xsl:when>
              <xsl:otherwise>TH</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='018'">
            <xsl:choose>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'LEHRBUCH')">RWLBS</xsl:when>
              <xsl:otherwise>RW</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='019'">
            <xsl:choose>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'Handapparat')">GHFAK</xsl:when> <!-- Es gibt auch starts-with(...,...) -->
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'Lehrbuch')">GHLBS</xsl:when>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'Lesesaal')">GHLS</xsl:when>
              <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'Magazin')">GHMAG</xsl:when>
              <xsl:when test="(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='CELA')
                or (datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='CELTRA')
                or (datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='SSC')">GHSEP</xsl:when>
              <xsl:otherwise>GHFREI</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='020'">RWFAK</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='021'">ZBMAG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='034'">FBGTEM</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='043'">UMPSY</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='054'">UMZMK</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='058'">PHPHI</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='066'">RWETH</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='069'">FBPSY</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='070'">PHGER</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='071'">PHAVL</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='072'">PHANG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='073'">PHAVS</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='074'">PHROM</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='075'">PHSLAV</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='076'">PHPOL</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='077'">PHKLP</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='078'">PHKLA</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='079'">GFGKUN</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='080'">ZBTURK</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='082'">FBÄGYPT</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='085'">FBVFGE</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='083'">PHKLW</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='086'">PHALG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='087'">PHBYZ</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='088'">PHMNG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='090'">PHBUW</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='091'">PHMUW</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='092'">PHOEG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='093'">
           <xsl:choose>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='MAG'">ZBMAG</xsl:when>
            <xsl:otherwise>ZBLS</xsl:otherwise>
           </xsl:choose>
		  </xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='094'">FBIGL</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='110'">GFGGEO</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='111'">FBKUNST</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='112'">PHHFM</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='113'">GFGSPO</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='120'">PHTHW</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='124'">FBGESANG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='125'">ZBMAG</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='126'">GFGUSA</xsl:when>
		  <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='127'">PHMAG</xsl:when>
		  <xsl:otherwise>UNKNOWN</xsl:otherwise>
       </xsl:choose>
       </xsl:variable>
      <xsl:message>Debug: Location "<xsl:value-of select="$lcode"/>"</xsl:message>
      <permanentLocationId>
        <xsl:choose>
          <xsl:when test="$electronicholding">ONLINE</xsl:when>
          <xsl:otherwise><xsl:value-of select="$lcode"/></xsl:otherwise>
        </xsl:choose>
      </permanentLocationId>
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
       <xsl:if test="not($electronicholding) and ($lcode!='DUMMY')">
         <xsl:if test="string-length($cnprefix)>0">
          <callNumberPrefix> <!-- TBD: Element Name -->
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
      <permanentLoanTypeId>
        <xsl:variable name="loantype" select="datafield[@tag='209A']/subfield[@code='d']"/>
<!-- Mainz 209A$d -->
          <xsl:choose>
            <xsl:when test="$loantype='u'">0 u ausleihbar</xsl:when>
            <xsl:when test="$loantype='b'">1 b Kurzausleihe</xsl:when>
            <xsl:when test="$loantype='c'">2 c Lehrbuchsammlung</xsl:when>
            <xsl:when test="$loantype='s'">3 s Präsenzbestand Lesesaal</xsl:when>
            <xsl:when test="$loantype='d'">4 d Präsenzbestand Wochenendausleihe</xsl:when>
            <xsl:when test="$loantype='i'">5 i nur für den Lesesaal</xsl:when>
            <xsl:when test="$loantype='e'">8 e vermisst</xsl:when>
            <xsl:when test="$loantype='g'">9 g nicht ausleihbar</xsl:when>
            <xsl:when test="$loantype='a'">9 a bestellt</xsl:when>
            <xsl:when test="$loantype='z'">9 z Verlust</xsl:when>
            <xsl:otherwise>ausleihbar/Fernleihe</xsl:otherwise>
          </xsl:choose>
      </permanentLoanTypeId>
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
      <xsl:if test="string-length($cnprefix)>0">
        <itemLevelCallNumberPrefix> <!-- TBD: Element Name -->
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
	 <discoverySuppress>
	 <xsl:variable name="selectioncode" select="datafield[@tag='208@']/subfield[@code='b']"/>
	 <xsl:message>Debug: selection code <xsl:value-of select="$selectioncode"/></xsl:message>
        <xsl:choose>
          <xsl:when test="(substring($selectioncode, 1, 1) = 'g') or (substring($selectioncode, 2, 1) = 'y') or (substring($selectioncode, 2, 1) = 'z')">true</xsl:when>           
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose> 
	</discoverySuppress>
    </i>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
