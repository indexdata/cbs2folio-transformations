<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>
     
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>  

  <!-- ILN 77 HfMDK: holding-items-hebis-iln77.xsl -->

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)"/>
    <!-- 209A$f/209G$a ? -->
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="signatur" select="$i/datafield[@tag = '209A' and subfield[@code = 'x'] = '00']/subfield[@code = 'a']/text()"/>
    <xsl:variable name="signatur-norm" select="normalize-space(translate($signatur,'ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜäöü.:/-','abcdefghijklmnopqrstuvwxyzaouaou    '))"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/> 
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <permanentLocationId>
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="starts-with($signatur-norm, 'a ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'aa ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ad ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ae ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'an ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'antiqua ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'aufs ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'b ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'bb ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'be ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'big ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'bio ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'bl ')">MAG</xsl:when>
<!--         <xsl:when test="starts-with($signatur-norm, 'bläs ')">MAG</xsl:when>   Umlaut-Problematik, vorerst mit "bl" abgefangen -->
             <xsl:when test="starts-with($signatur-norm, 'bl')">MAG</xsl:when>  <!-- temporär -->
             <xsl:when test="starts-with($signatur-norm, 'blockfl ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'bt ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'c ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cascam ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cekm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cello ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'chor ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'chorwerk ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cmm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cmn ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'consort ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'corona ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'cs ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'd ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'da ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'dat ')">KEL</xsl:when> <!-- vorbehaltlich -->
             <xsl:when test="starts-with($signatur-norm, 'dc ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ddt ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'diaphonia ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'dir ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'disc ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'div ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'dmbw ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'drm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'dtb ')">LS</xsl:when>
<!--         <xsl:when test="starts-with($signatur-norm, 'dtö ')">LS</xsl:when>   Umlaut-Problematik, vorerst mit "dt" abgefangen -->
             <xsl:when test="starts-with($signatur-norm, 'dt')">LS</xsl:when> <!-- temporär -->
             <xsl:when test="starts-with($signatur-norm, 'dvd ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'e ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'eb ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'edm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'einzelsignaturen ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'el ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ev ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'f ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'fagott ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'faks ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'fc ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ff ')">LS</xsl:when>
<!--         <xsl:when test="starts-with($signatur-norm, 'flote ')">MAG</xsl:when>  Umlaut-Problematik, vorerst mit "fl" abgefangen -->
             <xsl:when test="starts-with($signatur-norm, 'fl')">MAG</xsl:when> <!-- temporär -->
             <xsl:when test="starts-with($signatur-norm, 'fo ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'fr ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'g ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'gambe ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'gb ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ge ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ges ausg ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ges stud ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'gesang ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'h ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'h disc ')">KEL</xsl:when>  <!-- vorbehaltlich -->
             <xsl:when test="starts-with($signatur-norm, 'h usb ')">KEL</xsl:when>   <!-- vorbehaltlich -->
             <xsl:when test="starts-with($signatur-norm, 'ha ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'harfe ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'hb ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'hort ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'id ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ii ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'imami ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'instr ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ism ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ital ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'jazz ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'kamm ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'kantate ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'kassette ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'kath ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'kg ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'klar ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'klav ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ko ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'kontrab ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'l ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'laute ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'lex ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'lied ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mb ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'md ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mel ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mmh ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mml ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mmma ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mmn ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mmup ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'mus ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'musica ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'n ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'nagels ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'neue ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'o ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'oboe ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ol ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'op ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'orat ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'orch ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'organum ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'orgel ')">MAG</xsl:when>
<!--         <xsl:when test="starts-with($signatur-norm, 'pam ')">LS</xsl:when>   Umlaut-Problematik, vorerst mit "p" abgefangen, Achtung Reihenfolge geändert -->
<!--         <xsl:when test="starts-with($signatur-norm, 'pamw ')">LS</xsl:when>  Umlaut-Problematik, vorerst mit "p" abgefangen, Achtung Reihenfolge geändert -->
             <xsl:when test="starts-with($signatur-norm, 'part ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'pcm ')">KEL</xsl:when>   <!-- vorbehaltlich -->
             <xsl:when test="starts-with($signatur-norm, 'pd ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'pf ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ph ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'pm ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'pos ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ps ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'p')">LS</xsl:when>  <!-- temporär -->
             <xsl:when test="starts-with($signatur-norm, 'rara ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rhau ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rhyth ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rrmb ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rrmc ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rrmm ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rrmr ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'rw ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'sa ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'sax ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'schlagz ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'sl ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'solo ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'squar ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'str ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'symph ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'sz ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 't ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'ta ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'tanz ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'tenorh ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'textb ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'th ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'tonband ')">KEL</xsl:when> <!-- vorbehaltlich -->
             <xsl:when test="starts-with($signatur-norm, 'tromp ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'tuba ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'usb ')">KEL</xsl:when>   <!-- vorbehaltlich -->
             <xsl:when test="starts-with($signatur-norm, 'vhs ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'viol ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'viola ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'waldh ')">MAG</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'weam ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, 'zs ')">LS</xsl:when>
             <xsl:when test="starts-with($signatur-norm, '/')">LS</xsl:when>
             <xsl:otherwise>DEFAULT</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:otherwise>DEFAULT</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>
   
  <xsl:template match="discoverySuppress"> <!-- uses 208@$b (TBD? Kat. 4850 bzw. 247E/XY ?) -->
    <discoverySuppress>
      <xsl:value-of select="(substring(., 1, 4) = 'true') or (substring(., 1, 1) = 'g')"/> 
    </discoverySuppress>
  </xsl:template>

  <!-- Parsing call number for prefix - optional -->
  
  <xsl:template name="prefix"> <!-- ILN 8: Auswirkungen Testen -->
    <xsl:param name="cn"/>
    <xsl:param name="cnprefixelement"/>
    <xsl:param name="cnelement"/>
    <!-- Anpassen -->
    <xsl:variable name="cnprefix">
      <xsl:choose>
        <xsl:when test="contains($cn,'°')">
          <xsl:value-of select="concat(substring-before($cn,'°'),'°')"/>
        </xsl:when>
        <xsl:when test="contains($cn,'@')">
          <xsl:value-of select="substring-before($cn,'@')"/> 
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <!-- Anpassen Ende -->

    <xsl:message>Debug: <xsl:value-of select="$cnelement"/> Prefix "<xsl:value-of select="$cnprefix"/>"</xsl:message>
    <xsl:if test="string-length($cnprefix)>0">
      <xsl:element name="{$cnprefixelement}">
        <xsl:value-of select="normalize-space(translate($cnprefix,'@',''))"/>
      </xsl:element>
    </xsl:if>
    <xsl:element name="{$cnelement}">
      <xsl:value-of select="normalize-space(translate(substring-after($cn,$cnprefix),'@',''))"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="callNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'callNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'callNumber'"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="itemLevelCallNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'itemLevelCallNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'itemLevelCallNumber'"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>