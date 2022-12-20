<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common" version="1.1" exclude-result-prefixes="exsl">

  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 204 UB Gießen: holding-items-hebis-iln204.xsl -->
  <!-- ================================================= -->

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original', .)"/>
    <!-- 209A$f/209G$a ? -->
    <xsl:variable name="abt" select="$i/datafield[@tag = '209A' and subfield[@code = 'x'] = '00']/subfield[@code = 'f']/text()"/>
    <xsl:variable name="signature"
      select="$i/datafield[@tag = '209A' and subfield[@code = 'x'] = '00']/subfield[@code = 'a']/text()"/>
    <xsl:variable name="signature-lowercase" select="
        translate($signature,
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        'abcdefghijklmnopqrstuvwxyz')"/>
    <permanentLocationId>
      <xsl:variable name="ranges-list">
        <ranges>
          <department code="000">
            <prefix location="ILN204/CG/UB/Freihand1OG">/</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 </prefix>
            <prefix location="ILN204/CG/UB/UBMagPhil1">064 </prefix>
            <range from="1 1" to="1 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="1600" to="1899" location="ILN204/CG/UB/UBSLS"/>
            <range from="1900" to="1990" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="2 1" to="2 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="20.000.00" to="24.999.99" location="ILN204/CG/UB/UBMag3"/>
            <range from="27.000.00" to="27.999.99" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="2o 1 1" to="2o 1 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="2o 2 1" to="2o 2 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="2o 20.000.00" to="2o 24.999.99" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o 3 1" to="2o 3 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="2o 4 1" to="2o 4 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="2o 4/1" to="2o 4/9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="2o 40.000.00" to="2o 44.999.99" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="2o a 49" to="2o a 56" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o b 49" to="2o b 73" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o bt 1/1" to="2o bt 9/9" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o bt 1" to="2o bt 9" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o erk 1" to="2o erk 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">2o hass</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o kt a</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">2o kt b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o kt-a</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">2o kt-b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o landesk</prefix>
            <range from="2o ma" to="2o mz" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">2o ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">2o ztg</prefix>
            <range from="2o zz 1" to="2o zz 48" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o zz 49" to="2o zz 99" location="ILN204/CG/UB/UBMag3"/>
            <range from="3/1" to="3/9" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagPhil1">350</prefix>
            <range from="4 b 49" to="4 b 73" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">4 ss</prefix>
            <range from="4/1" to="4/9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="47.000.00" to="47.999.99" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="4o 1/1" to="4o 1/9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="4o 2/1" to="4o 2/9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="4o 20.000.00" to="4o 24.999.99" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o 3/1" to="4o 3/9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="4o 4/1" to="4o 4/9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="4o a 49" to="4o a 56" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o a 49" to="4o a 56" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMagAltbau">4o azz</prefix>
            <range from="4o b 49" to="4o b 73" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o bt 1/1" to="4o bt 9/9" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o erk 1" to="4o erk 999999" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">4o hass</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o kr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o kt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o landesk</prefix>
            <range from="4o ma" to="4o mz" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">4o pap</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">4o ztg</prefix>
            <range from="4o zz 1" to="4o zz 20" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o zz 21" to="4o zz 48" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o zz 49" to="4o zz 65" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="4o zz 66" to="4o zz 99" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o zz 1" to="4o zz 20" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o zz 21" to="4o zz 48" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o zz 49" to="4o zz 65" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="4o zz 66" to="4o zz 99" location="ILN204/CG/UB/UBMag3"/>
            <range from="5 1" to="5 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="a 1" to="a 48" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="a 49" to="a 56" location="ILN204/CG/UB/UBMag3"/>
            <range from="a 57" to="a 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagAltbau">abw</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">adk</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">ags</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">al</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">an</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">ap</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">aro</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">azz</prefix>
            <range from="b 1" to="b 48" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="b 49" to="b 73" location="ILN204/CG/UB/UBMag3"/>
            <range from="b 74" to="b 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="bap 1" to="bap 10" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="bap 13" to="bap 26" location="ILN204/CG/UB/UBMagAltbau"/>
            <prefix location="ILN204/CG/UB/UBMag3">bap 27</prefix>
            <range from="bap 28" to="bap 99" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="bap a" to="bap z" location="ILN204/CG/UB/UBMagAltbau"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">bel</prefix>
            <range from="bt 1/1" to="bt 9/9" location="ILN204/CG/UB/UBMag3"/>
            <range from="c 1" to="c 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="cd 1" to="cd 999999" location="ILN204/CG/UB/UBMag3"/>
            <range from="d 0" to="d 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="da 0" to="da 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="e 0" to="e 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="e 10" to="e 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">erk</prefix>
            <range from="f 1" to="f 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">fd</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh agr</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh all</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh altege</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ang</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh arb</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bap</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bio</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bliz</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bot</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh che</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh didge</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh eden</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ern</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh fil</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh geo</prefix>
            <range from="fh ger a" to="fh ger z" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="fh germ /" to="fh germ z" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ggr</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh he</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh his</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh hsh</prefix>
            <range from="fh jur a" to="fh jur y" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh jur z</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kid</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kla</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kun</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kup</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kyb</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh lit</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh mat</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh nat</prefix>
            <range from="fh ori aa" to="fh ori zz" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="fh orient /" to="fh orient wl" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="fh orient wn" to="fh orient z" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ostge</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh pap</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh phi</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh psy</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh rom</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sla</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sls 20</prefix>
            <range from="fh sls 28" to="fh sls 30" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh spo</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh spr</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ssl</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sta</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sued</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh tea</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh tec</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh umw</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh vol</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh vsp</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh zeitung</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh zoo</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh zp1</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">fk</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fp</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">frsla</prefix>
            <range from="g 1" to="g 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">gb</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">ges</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">giso</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">gr 2o 2/</prefix>
            <range from="gr 2o 20.00" to="gr 2o 49.99" location="ILN204/CG/UB/UBMag3"/>
            <range from="gr 2o a 49" to="gr 2o a 56" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o hass</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o kt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">gr 2o ztg</prefix>
            <range from="gr 2o zz 1" to="gr 2o zz 20" location="ILN204/CG/UB/UBMag3"/>
            <range from="gr 2o zz 49" to="gr 2o zz 99" location="ILN204/CG/UB/UBMag3"/>
            <range from="h 1" to="h 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">hass</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">hr</prefix>
            <range from="hs 1" to="hs 9999" location="ILN204/CG/UB/UBSLS"/>
            <prefix location="ILN204/CG/UB/UBSLS">hs nf</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">hs sg sg</prefix>
            <range from="i 0" to="i 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="i 10" to="i 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">in</prefix>
            <range from="k 1" to="k 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">kr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">kt a</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">kt b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">kt-a</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">kt-b</prefix>
            <range from="l 1" to="l 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">landesk</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">les</prefix>
            <range from="m 0" to="m 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">mag og</prefix>
            <range from="mag ug 0" to="mag ug 999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">msla</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mus</prefix>
            <range from="n 1" to="n 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBSLS">nachl</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">nl</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">no</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">nr</prefix>
            <range from="o 1" to="o 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/Freihand1OG">osr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">ott</prefix>
            <range from="p 1" to="p 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">pl</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">progr</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">q</prefix>
            <range from="r 0" to="r 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBSLS">rara</prefix>
            <range from="s 1" to="s 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">sap</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">sch</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">ss</prefix>
            <range from="t 1" to="t 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBSLS">thaer</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">theo</prefix>
            <range from="u 1" to="u 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="v 1" to="v 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">vorl</prefix>
            <prefix location="ILN204/CG/UB/UBMagAltbau">vuf</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">vv</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">w</prefix>
            <range from="x 0" to="x 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="y 1" to="y 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="z 1" to="z 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">z nr</prefix>
            <range from="z.nr 1" to="z.nr 999999" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">ztg</prefix>
            <range from="zz 1" to="zz 20" location="ILN204/CG/UB/UBMag3"/>
            <range from="zz 21" to="zz 30" location="ILN204/CG/UB/UBMag3"/>
            <range from="zz 49" to="zz 65" location="ILN204/CG/UB/UBMagAltbau"/>
            <range from="zz 66" to="zz 99" location="ILN204/CG/UB/UBMag3"/>
          </department>
          <department code="002" default-location="ILN204/CG/ZNL/Freihand">
            <prefix location="ILN204/CG/ZNL/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 agr</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 all</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 bio</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 bot</prefix>
            <range from="002 che a" to="002 che e" location="ILN204/CG/ZNL/Freihand"/>
            <range from="002 che fa 0.1" to="002 che fa 0.3" location="ILN204/CG/ZNL/Freihand"/>
            <prefix location="ILN204/CG/ZNL/Magazin">002 che fa 0.40</prefix>
            <range from="002 che fa 0.41" to="002 che fa 0.49" location="ILN204/CG/ZNL/Freihand"/>
            <range from="002 che fa 0.5" to="002 che fa 0.9" location="ILN204/CG/ZNL/Freihand"/>
            <range from="002 che fa 1" to="002 che fa 9" location="ILN204/CG/ZNL/Freihand"/>
            <range from="002 che fb" to="002 che fz" location="ILN204/CG/ZNL/Freihand"/>
            <range from="002 che g" to="002 che z" location="ILN204/CG/ZNL/Freihand"/>
            <prefix location="ILN204/CG/ZNL/Freihand">002 ern</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 geo</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 ggr</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 kyb</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 mat</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 med</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 nat</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 phy</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 tec</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 umw</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 vet</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 zoo</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">130</prefix>
            <prefix location="ILN204/CG/ZNL/Magazin">140</prefix>
            <range from="49.000.00" to="49.999.99" location="ILN204/CG/ZNL/Magazin"/>
            <range from="4o 20.000.00" to="4o 21.999.99" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o 22.000.00" to="4o 22.999.99" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o 49.000.00" to="4o 49.999.99" location="ILN204/CG/ZNL/Magazin"/>
            <range from="4o zz 1" to="4o zz 20" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o zz 49" to="4o zz 99" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o zz 49" to="4o zz 65" location="ILN204/CG/ZNL/Freihand"/>
            <range from="bap 11,1" to="bap 12,9" location="ILN204/CG/ZNL/Freihand"/>
            <prefix location="ILN204/CG/ZNL/Freihand">in</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">ss</prefix>
            <range from="zeitschriftenraum" to="zeitschriftenraum b"
              location="ILN204/CG/ZNL/Freihand"/>
            <prefix location="ILN204/CG/ZNL/Magazin">zeitschriftenraum chemie</prefix>
            <range from="zz 1" to="zz 20" location="ILN204/CG/ZNL/Freihand"/>
            <range from="zz 49" to="zz 99" location="ILN204/CG/ZNL/Freihand"/>
          </department>
          <department code="005" default-location="ILN204/CG/ZHB/Freihand">
            <prefix location="ILN204/CG/ZHB/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZHB/Freihand">005</prefix>
            <prefix location="ILN204/CG/ZHB/Magazin">205</prefix>
            <prefix location="ILN204/CG/ZHB/Freihand">wand</prefix>
          </department>
          <department code="009" default-location="ILN204/CG/ZP2/Freihand">
            <prefix location="ILN204/CG/ZP2/Freihand">/</prefix>
            <range from="009 aa" to="009 az" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ba" to="009 bh" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 bio</prefix>
            <range from="009 bk" to="009 bo 9730" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 bot a" to="009 bot z" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 bp" to="009 bw" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ca" to="009 ck" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 cl" to="009 cz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 da" to="009 di 49" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did bio</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did ggr</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did mat</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did phy</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did z</prefix>
            <range from="009 dipl 1" to="009 dipl 9" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 dk" to="009 dz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ea" to="009 ex 970" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 exam 1" to="009 exam 9" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ey" to="009 ez" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 fa" to="009 fz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ga" to="009 gf" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 gg 421" to="009 gg 91" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 ggr</prefix>
            <range from="009 gh" to="009 gz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 hc" to="009 hu" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ia" to="009 ix" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ka" to="009 kx" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ky 10" to="009 ky 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 kyb</prefix>
            <range from="009 kz 10" to="009 kz 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 la" to="009 lc" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ld 10" to="009 ld 2999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ld 30" to="009 ld 8699" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ld 870" to="009 ld 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 le" to="009 lg" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 lh" to="009 lo" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 lp" to="009 ly" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ma 10" to="009 ma 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 mag 1" to="009 mag 9" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 mat</prefix>
            <range from="009 mb" to="009 ml" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 mn" to="009 ms" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 mus</prefix>
            <range from="009 mx" to="009 mz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 na 10" to="009 na 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 nat</prefix>
            <range from="009 nb" to="009 nz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 pa 10" to="009 pa 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 pae</prefix>
            <range from="009 pb" to="009 pg" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ph 10" to="009 ph 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 phi</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 phy</prefix>
            <range from="009 pi" to="009 pz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 qa" to="009 qy" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ra" to="009 rd" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 re 10" to="009 re 99999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 rel</prefix>
            <range from="009 rf" to="009 rz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 sa" to="009 sp" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 sq" to="009 su" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ta" to="009 td" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 te 10" to="009 te 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 tea</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 tec</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 teo</prefix>
            <range from="009 tf" to="009 tz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ua" to="009 ux" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 va" to="009 vx" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 wa" to="009 wx" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 xa" to="009 yv" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 za" to="009 ze" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zg" to="009 zn" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zo 1" to="009 zo 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zoo a" to="009 zoo z" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zx" to="009 zy" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 010" to="009 999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">zeit</prefix>
          </department>
          <department code="010" default-location="ILN204/CG/ZRW/Freihand"/>
<!--            <range from="/" to="z" location="ILN204/CG/ZRW/Freihand"/>
          </department>-->
          <department code="015" default-location="ILN204/CG/DezFB/Fachbibliotheken"/>
<!--            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>-->
          <department code="020" default-location="ILN204/CG/ZRW/Freihand">
            <range from="/" to="j" location="ILN204/CG/ZRW/Freihand"/>
            <prefix location="ILN204/CG/ZRW/Freihand">lbs</prefix>
            <range from="mag a" to="mag z" location="ILN204/CG/ZRW/Freihand"/>
            <range from="n" to="s 9" location="ILN204/CG/ZRW/Freihand"/>
            <range from="x" to="z" location="ILN204/CG/ZRW/Freihand"/>
          </department>
          <department code="021" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="030" default-location="ILN204/CG/ZP2/Freihand">
            <prefix location="ILN204/CG/ZP2/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">03.</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 diplom</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 kup</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 mag</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 mus</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 pol</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 soz</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">z</prefix>
          </department>
          <department code="061" default-location="ILN204/CG/DezFB/Fachbibliotheken"/>
          <department code="082" default-location="ILN204/CG/DezFB/Fachbibliotheken"/>
          <department code="084" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="090" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="092" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="100" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="111" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <prefix location="ILN204/CG/DezFB/Fachbibliotheken">/</prefix>
            <prefix location="ILN204/CG/DezFB/Fachbibliotheken">0</prefix>
            <prefix location="ILN204/CG/DezFB/Fachbibliotheken">bestellt</prefix>
            <range from="gr a" to="gr z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="i 0" to="i 6999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="ii 1" to="ii 999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="iii 1 1" to="iii 9 99999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="iv 1 1" to="iv 4 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="ix 1 1" to="ix 6 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="lat a" to="lat z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <prefix location="ILN204/CG/DezFB/Fachbibliotheken">pap</prefix>
            <range from="v 1 1" to="v 9 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="vi 1 1" to="vi 9 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="vii 1 1" to="vii 3 99999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="viii 1 1" to="viii 7 9999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="x 1 1" to="x 4 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xi 1 1" to="xi 9 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xii 1 1" to="xii 9 99999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xiii 1 1" to="xiii 1 9999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xiv 1 1" to="xiv 9 99999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xv 3 1" to="xv 5 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xvi 1" to="xvi 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="xvii 1" to="xvii 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
            <range from="zs 0" to="zs 999999" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="112" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="116" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="sla a" to="sla z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="117" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="zzzz" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="120" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="122" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="138" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="151" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="172" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="192" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="28" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="230" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="290" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="320" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="331" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="/" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="351" default-location="ILN204/CG/DezFB/Fachbibliotheken">
            <range from="0" to="z" location="ILN204/CG/DezFB/Fachbibliotheken"/>
          </department>
          <department code="992" default-location="ILN204/E/E/Onlinemedien">
            <prefix location="ILN204/E/E/Onlinemedien">/</prefix>
          </department>
          <department code="993" default-location="ILN204/E/E/Onlinemedien">
            <prefix location="ILN204/E/E/Onlinemedien">/</prefix>
            <range from="0" to="z" location="ILN204/E/E/Onlinemedien"/>
          </department>
          <department code="994" default-location="ILN204/E/E/Onlinemedien">
            <prefix location="ILN204/E/E/Onlinemedien">/</prefix>
            <range from="0" to="z" location="ILN204/E/E/Onlinemedien"/>
          </department>
        </ranges>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="
            exsl:node-set($ranges-list)/ranges/department[@code = $abt]/prefix or
            exsl:node-set($ranges-list)/ranges/department[@code = $abt]/range">
          <xsl:variable name="location-prefix-match">
            <xsl:call-template name="get-location-by-prefix">
              <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
              <xsl:with-param name="prefix-list"
                select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/prefix"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$location-prefix-match = ''">
              <xsl:call-template name="get-location-by-range">
                <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
                <xsl:with-param name="range-list"
                  select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/range"/>
                <xsl:with-param name="default-location"
                  select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/@default-location"
                />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$location-prefix-match"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of
            select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/@default-location"/>
        </xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <xsl:template match="permanentLoanTypeId">
    <xsl:variable name="loantype"
      select="key('original', .)/datafield[@tag = '209A']/subfield[@code = 'd']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=". = 'u'">0 u Ausleihbar</xsl:when>
        <xsl:when test=". = 'b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test=". = 'c'">2 c Lehrbuchsammlungsausleihe</xsl:when>
        <xsl:when test=". = 's'">3 s Präsenzbestand</xsl:when>
        <xsl:when test=". = 'd'">4 d Passive Fernleihe</xsl:when>
        <xsl:when test=". = 'i'">5 i Nur für den Lesesaal</xsl:when>
        <xsl:when test=". = 'f'">6 f nur Kopie möglich</xsl:when>
        <!-- ILN 8: in LBS3 nicht genutzt -->
        <!-- Status 7 mit 237A/481 Semesterausleihe erzeugen? = vertagt, da unklar, ob in Folio nutzbar und fuer CBS-Saetze nicht relevant -->
        <xsl:when test=". = 'e'">8 e Vermisst</xsl:when>
        <xsl:when test=". = 'a'">9 a Zur Erwerbung bestellt</xsl:when>
        <xsl:when test=". = 'g'">9 g Nicht ausleihbar</xsl:when>
        <xsl:when test=". = 'o'">9 o Ausleihstatus unbekannt</xsl:when>
        <xsl:when test=". = 'z'">9 z Verlust</xsl:when>
        <!-- <xsl:otherwise>0 u Ausleihbar</xsl:otherwise>  wg. Zs ohne $d? -->
        <xsl:otherwise>9 o Ausleihstatus unbekannt</xsl:otherwise>
        <!-- damit Sonderfaelle auffallen -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <xsl:template match="discoverySuppress">
    <!-- uses 208@$b (und/oder Kat. 247E/XY ?) -->
    <discoverySuppress>
      <xsl:value-of select="(substring(., 1, 1) = 'g') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/> 
      <!-- Sind die Einstellungen von MZ. Pos1 g passt aus meiner Sicht. MB für den Rest fragen. RH -->
    </discoverySuppress>
  </xsl:template>

  <!-- Parsing call number for prefix - optional -->

  <xsl:template name="prefix">
    <!-- default, nutzt °,@  -->
    <xsl:param name="cn"/>
    <xsl:param name="cnprefixelement"/>
    <xsl:param name="cnelement"/>
    <xsl:variable name="cnprefix">
      <xsl:choose>
        <xsl:when test="contains($cn, '°')">
          <xsl:value-of select="concat(substring-before($cn, '°'), '°')"/>
        </xsl:when>
        <xsl:when test="contains($cn, '@')">
          <xsl:value-of select="substring-before($cn, '@')"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:message>Debug: <xsl:value-of select="$cnelement"/> Prefix "<xsl:value-of select="$cnprefix"
      />"</xsl:message>
    <xsl:if test="string-length($cnprefix) > 0">
      <xsl:element name="{$cnprefixelement}">
        <xsl:value-of select="normalize-space(translate($cnprefix, '@', ''))"/>
      </xsl:element>
    </xsl:if>
    <xsl:element name="{$cnelement}">
      <xsl:value-of select="normalize-space(translate(substring-after($cn, $cnprefix), '@', ''))"/>
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

  <xsl:template name="check-range">
    <!-- Checks if the string signature-short-lowercase is in the range defined
      by the strings range-start and range-end.
      
      The three strings are getting sorted by comparing char by char with a
      predefined sort key. If each char of signature-short-lowercase
      is between the corresponding char of range-start and range-end, the
      template returns 1, otherwise 0.
      
      Inspired by https://weinert-automation.de/pub/XSLT1.0RangeFilter.pdf        
    -->

    <xsl:param name="signature-short-lowercase"/>
    <xsl:param name="range-start"/>
    <xsl:param name="range-end"/>
    <xsl:param name="i" select="1"/>
    <xsl:param name="o" select="1"/>
    <xsl:variable name="sortChar">'0123456789aäbcdefghijklmnoöpqrsßtuüvwxyz'</xsl:variable>
    <xsl:variable name="frmFrst">
      <xsl:value-of select="substring($range-start, $i, 1)"/>
    </xsl:variable>
    <xsl:variable name="befFrst">
      <xsl:value-of select="substring($range-end, $i, 1)"/>
    </xsl:variable>
    <xsl:variable name="frmCmp">
      <xsl:value-of select="
          string-length(
          substring-before($sortChar, $frmFrst))"/>
    </xsl:variable>
    <xsl:variable name="befTmp">
      <xsl:value-of select="
          string-length(
          substring-before($sortChar, $befFrst))"/>
    </xsl:variable>
    <xsl:variable name="befCmp">
      <xsl:choose>
        <xsl:when test="$befTmp = 0">99</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$befTmp"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when
        test="$i > string-length($signature-short-lowercase) and $o > string-length($signature-short-lowercase)">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="idFrst">
          <xsl:value-of select="substring($signature-short-lowercase, $i, 1)"/>
        </xsl:variable>
        <xsl:variable name="idCmp">
          <xsl:value-of select="string-length(substring-before($sortChar, $idFrst))"/>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$idCmp >= $frmCmp and $befCmp >= $idCmp">
            <xsl:call-template name="check-range">
              <xsl:with-param name="signature-short-lowercase" select="$signature-short-lowercase"/>
              <xsl:with-param name="range-start" select="$range-start"/>
              <xsl:with-param name="range-end" select="$range-end"/>
              <xsl:with-param name="i" select="$i + 1"/>
              <xsl:with-param name="o" select="$o + 1"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="0"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="compare-tokens">
    <xsl:param name="signature-lowercase-trimmed"/>
    <xsl:param name="range-from"/>
    <xsl:param name="range-to"/>
    <xsl:param name="in-range"/>

    <xsl:variable name="range-from-tokens">
      <xsl:call-template name="tokenize">
        <xsl:with-param name="text" select="translate($range-from, ' /.', '|||')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="range-to-tokens">
      <xsl:call-template name="tokenize">
        <xsl:with-param name="text" select="translate($range-to, ' /.', '|||')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="signature-tokens">
      <xsl:call-template name="tokenize">
        <xsl:with-param name="text" select="translate($signature-lowercase-trimmed, ' /.', '|||')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="comparison-token-position">
      <xsl:call-template name="get-first-non-identical-token">
        <xsl:with-param name="range-from-tokens" select="$range-from-tokens"/>
        <xsl:with-param name="range-to-tokens" select="$range-to-tokens"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="identical-prefix">
      <xsl:call-template name="concat-items">
        <xsl:with-param name="items"
          select="exsl:node-set($range-from-tokens)/item[position() &lt; $comparison-token-position]"
        />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="signature-prefix">
      <xsl:call-template name="concat-items">
        <xsl:with-param name="items"
          select="exsl:node-set($signature-tokens)/item[position() &lt; $comparison-token-position]"
        />
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="
          $identical-prefix = $signature-prefix or
          $comparison-token-position = 1">
        <xsl:variable name="range-from-comparison-token">
          <xsl:value-of
            select="exsl:node-set($range-from-tokens)/item[position() = $comparison-token-position]"
          />
        </xsl:variable>
        <xsl:variable name="range-to-comparison-token">
          <xsl:value-of
            select="exsl:node-set($range-to-tokens)/item[position() = $comparison-token-position]"/>
        </xsl:variable>
        <xsl:variable name="signature-comparison-token">
          <xsl:choose>
            <xsl:when
              test="string(number(exsl:node-set($signature-tokens)/item[position() = $comparison-token-position])) != 'NaN'">
              <xsl:value-of select="
                  substring(string(number(exsl:node-set($signature-tokens)/item[position() = $comparison-token-position])),
                  1, string-length($range-to-comparison-token))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="
                  substring(exsl:node-set($signature-tokens)/item[position() = $comparison-token-position],
                  1, string-length($range-to-comparison-token))"/>
            </xsl:otherwise>
          </xsl:choose>

        </xsl:variable>
        <xsl:choose>
          <xsl:when test="
              string(number($signature-comparison-token)) != 'NaN' and
              string(number($range-from-comparison-token)) != 'NaN' and
              string(number($range-to-comparison-token)) != 'NaN'">
            <!-- The current signature token and the comparison tokens, e.g. the from token and the to token
              can be converted to a number. Therefore a numeric comparison decides whether the signature
              token fits in the range. -->
            <xsl:choose>
              <xsl:when test="
                  number($range-from-comparison-token) &lt;= number($signature-comparison-token) and
                  number($signature-comparison-token) &lt;= number($range-to-comparison-token)">
                <xsl:value-of select="1"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="0"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="check-range">
              <xsl:with-param name="signature-short-lowercase" select="$signature-comparison-token"/>
              <xsl:with-param name="range-start" select="$range-from-comparison-token"/>
              <xsl:with-param name="range-end" select="$range-to-comparison-token"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="concat-items">
    <xsl:param name="items"/>
    <xsl:for-each select="$items">
      <xsl:value-of select="."/>
      <xsl:if test="position() != last()">
        <xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="get-first-non-identical-token">
    <xsl:param name="range-from-tokens"/>
    <xsl:param name="range-to-tokens"/>
    <xsl:param name="current-position" select="1"/>
    <xsl:choose>
      <xsl:when
        test="exsl:node-set($range-from-tokens)/item[1] = exsl:node-set($range-to-tokens)/item[1]">
        <xsl:variable name="range-from-tokens-rest">
          <xsl:for-each select="exsl:node-set($range-from-tokens)/item[position() != 1]">
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="range-to-tokens-rest">
          <xsl:for-each select="exsl:node-set($range-to-tokens)/item[position() != 1]">
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:call-template name="get-first-non-identical-token">
          <xsl:with-param name="range-from-tokens" select="$range-from-tokens-rest"/>
          <xsl:with-param name="range-to-tokens" select="$range-to-tokens-rest"/>
          <xsl:with-param name="current-position" select="$current-position + 1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$current-position"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="get-location-by-prefix">
    <xsl:param name="signature-lowercase"/>
    <xsl:param name="prefix-list"/>
    <xsl:if test="$prefix-list">
      <xsl:variable name="prefix-zeroless">
        <xsl:value-of select="$prefix-list[1]"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="starts-with($signature-lowercase, $prefix-zeroless)">
          <xsl:value-of select="$prefix-list/@location"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="get-location-by-prefix">
            <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
            <xsl:with-param name="prefix-list" select="$prefix-list[position() != 1]"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-location-by-range">
    <xsl:param name="signature-lowercase"/>
    <xsl:param name="range-list"/>
    <xsl:param name="last-range"/>
    <xsl:param name="in-range"/>
    <xsl:param name="default-location" select="'Unbekannter Standort'"/>
    <xsl:choose>
      <xsl:when test="$in-range = 1">
        <xsl:value-of select="$last-range/@location"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$range-list">
            <xsl:call-template name="get-location-by-range">
              <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
              <xsl:with-param name="last-range" select="$range-list[1]"/>
              <xsl:with-param name="range-list" select="$range-list[position() != 1]"/>
              <xsl:with-param name="in-range">
                <xsl:call-template name="compare-tokens">
                  <xsl:with-param name="signature-lowercase-trimmed">
                    <!--<xsl:value-of
                      select="substring($signature-lowercase, 1, string-length($range-list[1]/@to))"
                    />-->
                    <xsl:value-of select="$signature-lowercase"/>
                  </xsl:with-param>
                  <xsl:with-param name="range-from">
                    <xsl:value-of select="$range-list[1]/@from"/>
                  </xsl:with-param>
                  <xsl:with-param name="range-to">
                    <xsl:value-of select="$range-list[1]/@to"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="default-location" select="$default-location"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$default-location"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="remove-leading-zeros">
    <xsl:param name="range-string"/>
    <xsl:choose>
      <xsl:when test="
          string-length($range-string) >= 6 and
          not(contains(substring($range-string, 1, 6), ' '))">
        <xsl:choose>
          <xsl:when test="string(number(substring($range-string, 1, 6))) != 'NaN'">
            <xsl:value-of select="translate(substring($range-string, 1, 6), '0', '')"/>
            <xsl:value-of select="substring($range-string, 7)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring($range-string, 1, 1)"/>
            <xsl:call-template name="remove-leading-zeros">
              <xsl:with-param name="range-string" select="substring($range-string, 2)"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$range-string != ''">
          <xsl:value-of select="substring($range-string, 1, 1)"/>
          <xsl:call-template name="remove-leading-zeros">
            <xsl:with-param name="range-string" select="substring($range-string, 2)"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Tokenize a string that's pipe separated -->
  <!-- Source: https://gist.github.com/rnelson/395bccd30092cedca87f -->
  <xsl:template name="tokenize">
    <xsl:param name="text"/>
    <xsl:param name="separator" select="'|'"/>
    <xsl:choose>
      <xsl:when test="not(contains($text, $separator))">
        <item>
          <xsl:value-of select="normalize-space($text)"/>
        </item>
      </xsl:when>
      <xsl:otherwise>
        <item>
          <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
        </item>
        <xsl:call-template name="tokenize">
          <xsl:with-param name="text" select="substring-after($text, $separator)"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
