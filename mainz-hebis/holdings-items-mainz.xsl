<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
<!-- Mainz/Hebis-Anpassungen 10.8.21-11.8.21 -->

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
    <xsl:if test="item/datafield[@tag='203@']/subfield[@code='0'] | datafield[@tag='109R']">
      <holdingsRecords>
        <arr>
          <xsl:apply-templates select="item"/>
          <!-- Electronic access -->
          <xsl:if test="datafield[@tag='109R']/subfield[@code='u']">
            <i>
              <hrid>
                <xsl:value-of select="datafield[@tag='003@']/subfield[@code='0']"/>
              </hrid>
              <permanentLocationId>Online</permanentLocationId>
              <!-- hardcoded : where to find in item record? -->
              <electronicAccess>
                <arr>
                  <xsl:for-each select="datafield[@tag='109R']">
                    <i>
                      <uri>
                        <xsl:value-of select="./subfield[@code='u']"/>
                      </uri>
                    </i>
                  </xsl:for-each>
                </arr>
              </electronicAccess>
            </i>
          </xsl:if>
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
<!-- Mainz/Hebis 209A$f/209G$a -->
      <xsl:variable name="lcode">
        <xsl:choose>
          <xsl:when test="datafield[@tag='209A']/subfield[@code='f']='000'">
          <xsl:choose>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='FREIHAND'">FREI</xsl:when>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='LBS'">LBS</xsl:when>
            <xsl:when test="datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']='LESESAAL'">LS</xsl:when>
            <xsl:when test="contains(datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a'],'RARA')">RARA</xsl:when>
            <xsl:otherwise>MAG</xsl:otherwise>
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
          <xsl:otherwise>UNKNOWN</xsl:otherwise>
        </xsl:choose>
       </xsl:variable>
      <xsl:message>Debug: Location "<xsl:value-of select="$lcode"/>"</xsl:message>
      <permanentLocationId>
        <xsl:value-of select="$lcode"/>
      </permanentLocationId>
      <callNumber>
        <xsl:value-of select="datafield[@tag='209A']/subfield[@code='a']"/>
      </callNumber>
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
                </xsl:apply-templates>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="." mode="make-item">
                <xsl:with-param name="hhrid" select="$hhrid"/>
              </xsl:apply-templates>
            </xsl:otherwise>
          </xsl:choose>          
        </arr>
      </items>
    </i>
  </xsl:template>
 
  <xsl:template match="item" mode="make-item">
    <xsl:param name="hhrid"/>
<!-- Hebis 209G$a -->   
    <xsl:param name="bcode" select="substring-before(concat(datafield[(@tag='209G') and (subfield[@code='x']='00')]/subfield[@code='a'],' '),' ')"/>
    <xsl:param name="copy" select="''"/> <!-- oder kann hier eine copy-Information kommen? -->
    <xsl:message>Debug: <xsl:value-of select="concat($hhrid,'#',$bcode,'#',$copy)"/></xsl:message>
    <i>
      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
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
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='a'">On order</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='z'">Missing</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='g'">Withdrawn</xsl:when>
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
      <xsl:if test="datafield[@tag='209R']">
        <electronicAccess>
          <arr>
            <xsl:for-each select="datafield[@tag='209R']">
              <xsl:if test="./subfield[@code='u']">
                <i>
                  <uri>
                    <xsl:value-of select="./subfield[@code='u']"/>
                  </uri>
                  <relationshipId>f5d0068e-6272-458e-8a81-b85e7b9a14aa</relationshipId>
                  <!-- Resource -->
                  <xsl:if test="../datafield[@tag='209K']">
                    <publicNote>
                      <xsl:variable name="enote" select="../datafield[@tag='209K'][1]/subfield[@code='a']"/>
                      <xsl:variable name="bnote" select="../datafield[@tag='209K'][1]/subfield[@code='b']"/>
                      <xsl:variable name="cnote" select="../datafield[@tag='209K'][1]/subfield[@code='c']"/>
                      <xsl:choose>
                        <xsl:when test="$enote='a'">Zugriffsrechte: domain, der Zugriff ist nur hausintern möglich</xsl:when>
                        <xsl:when test="$enote='b'">Zugriffsrechte: free, der Zugriff ist unbeschränkt möglich</xsl:when>
                        <xsl:when test="$enote='c'">Zugriffsrechte: blocked, der Zugriff ist gar nicht möglich</xsl:when>
                        <xsl:when test="$enote='d'">Zugriffsrechte: domain+, der Zugriff ist hausintern und für bestimmte zugelassene, andere Benutzer möglich</xsl:when>
                        <xsl:when test="$bnote">
                          <xsl:value-of select="concat('Zahl der parallelen Zugriffe: ', $bnote)"/>
                        </xsl:when>
                      </xsl:choose>
                      <xsl:choose>
                        <xsl:when test="$cnote and ($enote or $bnote)">
                          <xsl:value-of select="concat(' ; ', $cnote)"/>
                        </xsl:when>
                        <xsl:when test="$cnote">
                          <xsl:value-of select="$cnote"/>
                        </xsl:when>
                      </xsl:choose>
                    </publicNote>
                  </xsl:if>
                </i>
              </xsl:if>
            </xsl:for-each>
          </arr>
        </electronicAccess>
      </xsl:if>
      <accessionNumber>
        <xsl:for-each select="datafield[@tag='209C']">
          <xsl:value-of select="./subfield[@code='a']"/>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </accessionNumber>
      <discoverySuppress>
        <xsl:choose>
          <xsl:when test="datafield[@tag='208@']/subfield[@code='b']='d'">true</xsl:when>
          <xsl:when test="datafield[@tag='208@']/subfield[@code='b']='i'">true</xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </discoverySuppress>
    </i>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
