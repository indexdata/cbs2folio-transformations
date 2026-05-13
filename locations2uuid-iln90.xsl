<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Map locations -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
        <xsl:variable name="callnumber" select="string(../callNumber)"/>
        <xsl:variable name="itemLevelCallnumber" select="string(../itemLevelCallNumber)"/>
        <xsl:variable name="callnumberLower" select="lower-case(normalize-space($callnumber))"/>
        <xsl:variable name="itemLevelCallnumberLower" select="lower-case(normalize-space($itemLevelCallnumber))"/>
        <xsl:variable name="lower" select="lower-case(normalize-space(.))"/>
        <!-- xsl:variable name="lower" select="lower-case(.)"/>
	    <xsl:variable name="callnumber" select="../callNumber"/>
        <xsl:variable name="itemLevelCallnumber" select="../itemLevelCallNumber"/>
        <xsl:variable name="callnumberLower" select="lower-case($callnumber)"/> 
        <xsl:variable name="itemLevelCallnumberLower" select="lower-case($itemLevelCallnumber)"/ --> 

        <permanentLocationId>
            <xsl:choose>
                <!-- Online -->
                <xsl:when test="$electronicholding='O'">6714a1c7-8215-4841-8b77-d2523b42ff6b</xsl:when>
                <!-- bestellt -->   
                <xsl:when test="$callnumberLower='bestellt'">5efa0567-d253-415c-8c9a-7083dc02b55f</xsl:when>
                <xsl:when test="$itemLevelCallnumberLower='bestellt'">5efa0567-d253-415c-8c9a-7083dc02b55f</xsl:when>
                <!-- ausgesondert -->   
                <xsl:when test="$callnumberLower = 'verlust'
                                    or $itemLevelCallnumberLower = 'verlust'
                                    or starts-with($callnumberLower, 'makuliert')
                                    or starts-with($itemLevelCallnumberLower, 'makuliert')
                                    or starts-with ($lower, 'makuliert')"
                                    >20ab3498-7cc3-4085-a687-3ba1aec3f5cd</xsl:when>
                 <!-- Freihandbestand (FH) kein Eintrag in $f -->   
                <xsl:when test=".=''">5dc16961-7ae5-4bbf-8c18-0adc9e58d32a</xsl:when>	
                <!-- Fernleihe -->
                <xsl:when test="$lower='fl'">3a25464f-4af8-4789-9988-47eb2e0fa832</xsl:when>  
                <!-- Magazin Mediothek (AMI) -->
                <xsl:when test="$lower = 'ami'">3cf4dceb-1432-474b-b63d-75ac500383bc</xsl:when>
                <!-- Arbeitsbibliothek Holthusen (HOLT) -->
                <xsl:when test="$lower = 'holthusen'">a529aa09-1bf2-4efc-a77f-18d4afefff69</xsl:when>
                <!-- Lesesaalnutzung (LS-NUTZUNG) -->
                <xsl:when test="$lower = 'ls-nutzung'">16a12d2a-957d-4798-9047-f16caefcd8ed</xsl:when>
                <!-- Magazin (MAG) -->
                <xsl:when test="$lower = ('magazin', 'alt')">7cecb171-ca65-4bab-b47f-424ed60432a1</xsl:when>                
                <!-- Mediothek (MEDIOTHEK) -->
                <xsl:when test="$lower='mediothek'">e6d8fdcd-65c7-4a9f-82c4-e769108014d4</xsl:when>
                <!-- Rarabestand (RARA) -->
                <xsl:when test="$lower='rara'">a16c96a6-a988-4b7a-a310-80024c7cac87</xsl:when>
                <!-- Semesterapparate (SEMAPP) -->
                <xsl:when test="$lower='semapp'">a5a3e4d1-55b8-4c64-b214-39a9bbfb7e6a</xsl:when>
                <!-- Einbandsammlung (STA) -->
                <xsl:when test="$lower='sta'">a6e772d7-73e4-45b8-8a39-42c97fcf8af8</xsl:when>
                <!--Universitätsverlag (UV) -->
                <xsl:when test="$lower='uv'">b9c827e0-3385-415f-b699-e49ce5fbafad</xsl:when>
                <!--Zeitschriftenmagazin (ZSS-MAG) -->
                <xsl:when test="$lower = 'zss-magazin'">a0dacd6c-4433-4b3d-8d92-4fc41f05a53c</xsl:when>
                <!--Leselounge (ZTG) -->
                <xsl:when test="$lower ='ztg'">8e57f8d5-c00a-4d35-be19-beb64099989f</xsl:when>
                <!--Schulmuseum (SCHUL) -->
                <xsl:when test="$lower = 'schulmuseum'">09b6ac4d-fef5-468e-87dd-be127bddba24</xsl:when>
                <!--AZP-Bibliothek (AZP) -->
                <xsl:when test="$lower ='azp'">dc5238a8-da20-42dd-8436-98989cc2fa95</xsl:when>
                <!--Handapparate (HA) -->
                <xsl:when test="$lower ='ha'">2633c3b4-6643-461a-98c1-e5d07724c4fc</xsl:when>
                <!--Atlantenschrank (ATLANTENSCHRANK) -->
                <xsl:when test="$lower ='atlantenschrank'">afc13080-044f-4630-863e-15039f41410d</xsl:when>
                <!--Sonderformatregal (SONDER)-->
                <xsl:when test="$lower ='sonder'">fd0d3178-da9d-4fe2-b185-0722d393caaf</xsl:when>
                <!-- Keine Zuordnung / Sonstige (SONST) --> 
                <xsl:otherwise>33afca1e-d7e7-43c9-8cb4-5d3fcad8e176</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>