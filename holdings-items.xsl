<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  
  <xsl:template match="collection">
    <collection>
      <xsl:apply-templates/>
    </collection>
  </xsl:template>
  
  <xsl:template match="record">
    <record>
      <xsl:for-each select="*">
        <xsl:copy-of select="."/>
      </xsl:for-each>
      <xsl:apply-templates select="original"/>
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
      <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O'"/>
      <xsl:variable name="lcode" select="datafield[@tag='209A']/subfield[@code='f']"/>
      <permanentLocationId>
        <xsl:value-of select="$lcode"/>
      </permanentLocationId>
      <callNumber>
        <xsl:value-of select="datafield[@tag='209A']/subfield[@code='a']"/>
      </callNumber>
      <callNumberPrefix>
        <xsl:value-of select="datafield[@tag='209A']/subfield[@code='f']"/>
      </callNumberPrefix>
      <holdingsTypeId>
        <xsl:variable name="holType" select="../datafield[@tag='002@']/subfield[@code='0']"/>
        <xsl:variable name="holType1" select="substring($holType, 1, 1)"/>
        <xsl:choose>
          <xsl:when test="$holType1 = 'O'">electronic</xsl:when>
          <xsl:otherwise>physical</xsl:otherwise>
        </xsl:choose>
      </holdingsTypeId>
      <holdingsStatements>
        <xsl:if test="datafield[@tag='231B']/subfield[@code='a']">
          <arr>
            <xsl:for-each select="datafield[@tag='231B']/subfield[@code='a']">
              <i>
                <statement>
                  <xsl:value-of select="."/>
                </statement>
              </i>
            </xsl:for-each>
          </arr>
        </xsl:if>
      </holdingsStatements>
      <sourceId>K10plus</sourceId>
      <administrativeNotes>
        <arr>
          <xsl:for-each select="datafield[@tag='208@']">
            <i>
              <xsl:value-of select="concat(./subfield[@code='a'], ' (E0XX: Neuanlagedatum)')"/>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='201A']">
            <i>
              <xsl:value-of select="concat(./subfield[@code='0'], ' (7902: Datum der Ersterfassung)')"/>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='201B']">
            <i>
              <xsl:value-of select="concat(./subfield[@code='0'], ', ', substring(./subfield[@code='t'],1,5), ' (7903: Datum und Uhrzeit der letzten Änderung)')"/>
            </i>
          </xsl:for-each>
        </arr>
      </administrativeNotes>
      <discoverySuppress>
        <xsl:choose>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='c'">true</xsl:when>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='d'">true</xsl:when>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='e'">true</xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </discoverySuppress>
      <notes>
        <arr>
          <xsl:if test="datafield[@tag='220B' or @tag='237A' or @tag='244Z' or @tag='209O' or @tag='206X' or @tag='206W']">
            <!-- 4801 -->
            <xsl:for-each select="datafield[@tag='237A']">
              <xsl:if test="./subfield[@code='a'] or ./subfield[@code='0']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='a'] | ./subfield[@code='0']"/>
                  </note>
                  <holdingsNoteTypeId>Exemplarbezogener Kommentar - benutzerrelevante Hinweise (4801)</holdingsNoteTypeId>
                  <staffOnly>false</staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
            <!-- 4802 -->
            <xsl:for-each select="datafield[@tag='220B']">
              <xsl:if test="./subfield[@code='a'] or ./subfield[@code='0']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='a'] | ./subfield[@code='0']"/>
                  </note>
                  <holdingsNoteTypeId>Exemplarbezogener Kommentar - bibliotheksinterne Hinweise (4802)</holdingsNoteTypeId>
                  <staffOnly>true</staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
            <!-- 6800 -->
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
                <holdingsNoteTypeId>Lokale Schlagwörter (6800)</holdingsNoteTypeId>
                <staffOnly>false</staffOnly>
              </i>
            </xsl:for-each>
            <!-- 8600 -->
            <xsl:for-each select="datafield[@tag='209O']">
              <xsl:if test="./subfield[@code='a']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </note>
                  <holdingsNoteTypeId>Abrufzeichen exemplarspezifisch (8600)</holdingsNoteTypeId>
                  <staffOnly>true</staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
            <!-- 7811 -->
            <xsl:for-each select="datafield[@tag='206X']">
              <xsl:if test="./subfield[@code='0']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='0']"/>
                  </note>
                  <holdingsNoteTypeId>Lokale Identifikationsnummer anderer Systeme (7811)</holdingsNoteTypeId>
                  <staffOnly>false</staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
            <!-- 7812 -->
            <xsl:for-each select="datafield[@tag='206W']">
              <xsl:if test="./subfield[@code='0']">
                <i>
                  <note>
                    <xsl:value-of select="./subfield[@code='0']"/>
                  </note>
                  <holdingsNoteTypeId>Lokale Identifikationsnummer externer Systeme (7812)</holdingsNoteTypeId>
                  <staffOnly>false</staffOnly>
                </i>
              </xsl:if>
            </xsl:for-each>
          </xsl:if>
        </arr>
      </notes>
      <electronicAccess>
        <arr>
          <xsl:for-each select="datafield[@tag='209R']">
            <xsl:if test="./subfield[@code='u']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='u']"/>
                </uri>
                <relationshipId>Ressource</relationshipId>
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
      <illPolicyId>
        <xsl:variable name="illpolicy" select="datafield[@tag='209B']/subfield[@code='a']"/>
        <xsl:choose>
          <xsl:when test="$illpolicy='nx'">8052 nx - keine Fernleihe</xsl:when>
          <xsl:when test="$illpolicy='nxp'">8052 nxp - keine Fernleihe</xsl:when>
          <xsl:when test="$illpolicy='kx'">8052 kx - Papierkopie an Endnutzer</xsl:when>
          <xsl:when test="$illpolicy='ky'">8052 ky - Papierkopie an Endnutzer, nur im Inland</xsl:when>
          <xsl:when test="$illpolicy='kxp'">8052 kxp - Papierkopie an Endnutzer, Elektronische Übertragung zwischen den Bibliotheken ausgeschlossen</xsl:when>
          <xsl:when test="$illpolicy='kyp'">8052 kyp - Papierkopie an Endnutzer, nur im Inland, Elektronische Übertragung zwischen den Bibliotheken ausgeschlossen</xsl:when>
          <xsl:when test="$illpolicy='ex'">8052 ex - elektronischer Versand an Endnutzer</xsl:when>
          <xsl:when test="$illpolicy='ey'">8052 ey - elektronischer Versand an Endnutzer, nur im Inland</xsl:when>
        </xsl:choose>
      </illPolicyId>
      <xsl:if test="not($electronicholding)">
        <items>
          <arr>
            <xsl:choose>
              <xsl:when test="datafield[@tag='209G']/subfield[@code='a'][2]">
                <xsl:for-each select="datafield[@tag='209G']/subfield[@code='a']">
                  <xsl:apply-templates select="../.." mode="make-item">
                    <xsl:with-param name="hhrid" select="concat($hhrid, '-', .)"/>
                    <xsl:with-param name="bcode" select="."/>
                    <xsl:with-param name="copy" select="./following-sibling::subfield[@code='c'][1]"/>
                  </xsl:apply-templates>
                </xsl:for-each>
              </xsl:when>
              <!-- start implement bound-with case -->
              <xsl:when test="datafield[@tag='209A']/subfield[@code='i']">
                <xsl:if test="datafield[@tag='209G']/subfield[@code='a']">
                  <xsl:apply-templates select="." mode="make-item">
                    <xsl:with-param name="hhrid" select="$hhrid"/>
                  </xsl:apply-templates>             
                </xsl:if>
                <xsl:if test="not(datafield[@tag='209G']/subfield[@code='a'])">
                  <!-- exit and don't create an item -->
                </xsl:if>
              </xsl:when>
              <!-- end implement bound-with case -->
              <xsl:otherwise>
                <xsl:apply-templates select="." mode="make-item">
                  <xsl:with-param name="hhrid" select="$hhrid"/>
                </xsl:apply-templates>
              </xsl:otherwise>
            </xsl:choose>
          </arr>
        </items>
      </xsl:if>
    </i>
  </xsl:template>
  <xsl:template match="item" mode="make-item">
    <xsl:param name="hhrid"/>
    <xsl:param name="bcode" select="datafield[@tag='209G']/subfield[@code='a']"/>
    <xsl:param name="copy" select="datafield[@tag='209G']/subfield[@code='c']"/>
    <i>
      <hrid>
        <xsl:value-of select="$hhrid"/>
      </hrid>
      <materialTypeId>
        <xsl:variable name="type" select="../datafield[@tag='002@']/subfield[@code='0']"/>
        <xsl:variable name="type1" select="substring($type, 1, 1)"/>
        <xsl:variable name="type12" select="substring($type, 1, 2)"/>
        <xsl:variable name="type2" select="substring($type, 2, 1)"/>
        <xsl:variable name="pd" select="../datafield[@tag='013H']/subfield[@code='a']"/>
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
              <xsl:when test="$pd = 'muno'">Musiknote</xsl:when>
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
        <xsl:choose>
          <xsl:when test="$loantype='u'">u - ausleihbar/Fernleihe</xsl:when>
          <xsl:when test="$loantype='b'">b - verkürzt ausleihbar/Fernleihe</xsl:when>
          <xsl:when test="$loantype='c'">c - ausleihbar/keine Fernleihe</xsl:when>
          <xsl:when test="$loantype='s'">s - mit Zustimmung ausleihbar/nur Kopie in die Fernleihe</xsl:when>
          <xsl:when test="$loantype='d'">d - mit Zustimmung ausleihbar/Fernleihe</xsl:when>
          <xsl:when test="$loantype='i'">i - Lesesaalausleihe/keine Fernleihe</xsl:when>
          <xsl:when test="$loantype='f'">f - Lesesaalausleihe/nur Kopie in die Fernleihe</xsl:when>
          <xsl:when test="$loantype='g'">g - für die Ausleihe gesperrt/keine Fernleihe</xsl:when>
          <xsl:when test="$loantype='a'">a - bestellt/keine Fernleihe</xsl:when>
          <xsl:when test="$loantype='o'">o - keine Angabe/keine Fernleihe</xsl:when>
          <xsl:when test="$loantype='z'">z - Verlust/keine Fernleihe</xsl:when>
          <xsl:otherwise>ausleihbar/Fernleihe</xsl:otherwise>
        </xsl:choose>
      </permanentLoanTypeId>
      <status>
        <xsl:variable name="frequency" select="substring(../datafield[@tag='002@']/subfield[@code='0'],2,1)"/>
        <name>
          <xsl:choose>
            <xsl:when test="$frequency='b'">Intellectual item</xsl:when>
            <xsl:when test="$frequency='c'">Intellectual item</xsl:when>
            <xsl:when test="$frequency='d'">Intellectual item</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='a'">On order</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='u'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='b'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='c'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='s'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='d'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='i'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='f'">Available</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='z'">Missing</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='g'">Restricted</xsl:when>
            <xsl:when test="datafield[@tag='209A']/subfield[@code='d']='o'">Unknown</xsl:when>
            <xsl:otherwise>Available</xsl:otherwise>
          </xsl:choose>
        </name>
      </status>
      <xsl:if test="$bcode">
        <barcode>
          <xsl:value-of select="$bcode"/>
        </barcode>
      </xsl:if>
      <!-- Temporarily added until error in MODINVSTOR-1368 is corrected -->
      <itemLevelCallNumberPrefix>
        <xsl:value-of select="datafield[@tag='209A']/subfield[@code='f']"/>
      </itemLevelCallNumberPrefix>
      <!-- Temporarily added until error in MODINVSTOR-1368 is corrected -->
      <itemLevelCallNumber>
        <xsl:value-of select="datafield[@tag='209A']/subfield[@code='a']"/>
      </itemLevelCallNumber>
      <!-- Temporarily added until error in MODINVSTOR-1368 is corrected -->
      <xsl:variable name="lcode" select="datafield[@tag='209A']/subfield[@code='f']"/>
      <permanentLocationId>
        <xsl:value-of select="$lcode"/>
      </permanentLocationId>
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
      <descriptionOfPieces>
        <xsl:value-of select="datafield[@tag='208F']/subfield[@code='a']"/>
      </descriptionOfPieces>
      <accessionNumber>
        <xsl:for-each select="datafield[@tag='209C']">
          <xsl:value-of select="./subfield[@code='a']"/>
          <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </accessionNumber>
      <discoverySuppress>
        <xsl:choose>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='c'">true</xsl:when>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='d'">true</xsl:when>
          <xsl:when test="substring(datafield[@tag='208@']/subfield[@code='b'],1,1)='e'">true</xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </discoverySuppress>
    </i>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
