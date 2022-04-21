<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="holdings-items-hebis.xsl"/>

  <xsl:template name="lcode">
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
  </xsl:template>
   
  <xsl:template name="loantype">
    <!-- Mainz 209A$d -->
    <xsl:variable name="loantype" select="datafield[@tag='209A']/subfield[@code='d']"/>
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
  </xsl:template>

</xsl:stylesheet>
