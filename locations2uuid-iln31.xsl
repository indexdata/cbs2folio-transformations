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

        <permanentLocationId>
            <xsl:choose>
                <!-- Online -->
                <xsl:when test="$electronicholding='O'">be83badd-72ec-417a-8284-bb2fa58afeb1</xsl:when>
                <!-- bestellt -->   
                <xsl:when test="$callnumberLower = 'bestellt'
                                    or $itemLevelCallnumberLower = 'bestellt'">2cc5a0db-7703-4193-ba85-8e800bd327e4</xsl:when>
                <!-- Bestellung negativ -->   
                <xsl:when test="$callnumberLower = ('vergriffen','erscheint nicht','storniert','nicht lieferbar')
                            or $itemLevelCallnumberLower = ('vergriffen','erscheint nicht','storniert','nicht lieferbar')"
                            >1a430501-3ad0-448e-a366-6666faad2e49</xsl:when>
                <!-- Magazin -->
                <xsl:when test="$lower='mag'">11eab764-df2d-4427-97c1-f2ab75f61509</xsl:when>  
                <!-- TGB Freihand -->
                <xsl:when test="$lower = (
                                    'j 1', 'j 21', 'j 22/or', 'j 22', 'j 23/vkd', 'j 23', 
                                    'j 25', 'j 28', 'j 30', 'j 35', 'j 49', 'j 53', 
                                    'j 84', 'j 135/is', 'j 135/k', 'j 135/m', 'j 135', 
                                    'j 160', 'j 161', 'np')">f08cefcd-9927-4275-a9bb-c1980972ace0</xsl:when>
                <!-- TBNM/Lobeda Freihandd -->
                <xsl:when test="$lower = (
                                    'j 5', 'j 6n', 'j 8', 'j 11', 'j 29', 'j 32', 
                                    'j 39', 'j 40', 'j 43', 'j 44k', 'j 48', 'j 73', 
                                    'j 87', 'j 105', 'j 117', 'j 136', 'j 146')">95f3d17f-ae18-4c06-812b-bc373b1cc8c0</xsl:when>
                <!-- TBRWS Freihand -->
                <xsl:when test="$lower = (
                                    'j 33', 'j 64', 'j 142')">dcb91937-00c4-428e-95d1-9de983987bdd</xsl:when>
                <!-- TBNM Freihand -->
                <xsl:when test="$lower = (
                                    'j 6', 'j 9', 'j 12', 'j 14', 'j 16', 'j 19', 'j 20', 
                                    'j 24', 'j 26', 'j 36', 'j 37', 'j 41', 'j 44', 'j 50', 
                                    'j 66', 'j 71', 'j 76', 'j 144')">c0358575-4010-4ca9-b4d1-bc894cbdbdca</xsl:when>                
                <!-- AHS Magazin -->
                <xsl:when test="starts-with($lower,'hz')">52787593-b4e1-4402-85e4-ff572fe0ad06</xsl:when>
                <!-- Herbarium Haussknecht -->
                <xsl:when test="$lower='j 13'">5f24b8af-c7b8-4834-8316-039205f59b24</xsl:when>
                <!-- Allgemeiner Lesesaal -->
                <xsl:when test="$lower=('ls', 'ls2')">a3ef8ff3-8d94-4af0-8dfe-9016ec47645c</xsl:when>
                <!-- TBRWS Magazin -->
                <xsl:when test="$lower=('mag5', 'j 138')">fe139d88-642c-472a-a8b5-95f079e71b95</xsl:when>
                <!-- TBNM/Lobeda Magazin -->
                <xsl:when test="$lower='mag3'">28393a32-7f0c-4398-9308-2dafd9554c6b</xsl:when>
                <!--TBG Lehrbuchsammlung -->
                <xsl:when test="$lower='lbs'">bfd8966a-686d-4fb9-8648-5e20dddc76a6</xsl:when>
                <!--TBG Handapparat -->
                <xsl:when test="some $p in (
                                    'j 1/', 'j 21/', 'j 22/', 'j 23/', 'j 25/', 'j 28/', 
                                    'j 30/', 'j 35/', 'j 49/', 'j 53/', 'j 84/', 'j 135/',
                                    'j 160/', 'j 161/') satisfies starts-with($lower, $p)">5c10db4a-5801-40a9-87c6-c56250c6ab99</xsl:when>
                <!--TBRWS Handapparat -->
                <xsl:when test="some $p in (
                                    'j 33/', 'j 64/', 'j 142/') satisfies starts-with($lower, $p)"
                                    >b3f14f03-1123-4813-b336-57a9921f1a1d</xsl:when>
                <!--TBNM/Lobeda Handapparat -->
                <xsl:when test="some $p in (
                                    'j 5/', 'j 6n/', 'j 8/', 'j 11/', 'j 29/', 'j 32/', 
                                    'j 39/', 'j 40/', 'j 43/', 'j 44k/', 'j 48/', 'j 73/', 
                                    'j 87/', 'j 105/', 'j 117/', 'j 136/', 'j 146/') satisfies starts-with($lower, $p)"
                                    >96795b70-9a1a-49d6-8701-55d400219188</xsl:when>
                <!--TBNM Handapparat -->
                <xsl:when test="some $p in (
                                    'j 6/', 'j 9/', 'j 12/', 'j 14/', 'j 16/', 'j 19/', 'j 20/', 
                                    'j 24/', 'j 26/', 'j 36/', 'j 37/', 'j 41/', 'j 44/', 'j 50/', 
                                    'j 66/', 'j 71/', 'j 76/', 'j 144/') satisfies starts-with($lower, $p)"
                                    >b973744e-f5ef-4e7c-afd0-20d783a5457d</xsl:when>
                <!--Sonderstandort -->
                <xsl:when test="starts-with($lower, 'ha')
                                    or $lower = ('eib1', 'j 20/wei', 'j 145', 'sost')"
                                    >c60d9744-9f0a-4ef1-9d07-5686fc112979</xsl:when>
                <!--TBRWS Lehrbuchsammlung -->
                <xsl:when test="$lower = ('lbs/j 33', 'lbs/j 64', 'lbs/j 142')">6c7e2b79-5913-4f30-9ad7-6a0c9faefa54</xsl:when>
                <!--Ernst-Haeckel-Haus -->
                <xsl:when test="$lower ='j 47'">3b2d472a-57bb-45ff-ae2f-e9bbc68a78f7</xsl:when>
                <!--TBNM Lehrbuchsammlung -->
                <xsl:when test="$lower = ('lbs/j 26', 'lbs/j 76')">f0a2a3b4-28ea-4c0c-9396-0de9d76dc188</xsl:when>
                <!--TLLLR -->
                <xsl:when test="$lower ='j 42'">4164f012-5493-4c62-b52b-946f04f90809</xsl:when>
                <!--TBNM Magazin -->
                <xsl:when test="$lower ='mag6'">c41e9aee-887a-4fbb-aa66-25065530554b</xsl:when>
                <!--AHS Freihand -->
                <xsl:when test="$lower ='ls1'">0ab627bb-eb7e-4072-9287-4cf14e2cf1ee</xsl:when>
                <!--Fernleihe außer Haus -->
                <xsl:when test="$lower ='zausl'">6ee76397-4122-456f-b665-fa50e82c33b3</xsl:when>
                <!--TBRWS EDZ -->
                <xsl:when test="$lower ='j 151'">49eb0664-b851-47d6-bff0-2844d93ecf19</xsl:when>
                <!--AHS Inkunabeln -->
                <xsl:when test="$lower ='inc'">85ea2be2-b76c-41b4-9cfe-c169ce4807c7</xsl:when>
                <!--TBNM/Lobeda Lehrbuchsammlung -->
                <xsl:when test="$lower ='lbs/j 43'">302feaa4-97cb-4fb7-8840-03bb8f65f347</xsl:when>
                <!--Museum Ernst-Haeckel-Haus -->
                <xsl:when test="$lower ='ehh'">f1028cc0-c24c-4ba4-ab33-35250eef705a</xsl:when>
                <!--Fernleihe Sonderlesesaal -->
                <xsl:when test="$lower ='sls2'">430b9058-83a5-451c-a802-0069341edfb2</xsl:when>
                <!--Handapparat Ernst-Haeckel-Haus -->
                <xsl:when test="$lower ='j 47/ehh'">39a58f13-3b1b-4d60-8fac-e68a2ea04a79</xsl:when>
                <!-- Keine Zuordnung --> 
                <xsl:otherwise>6dd07aa7-8990-4f07-aecb-53bcd237f63f</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
    <xsl:template match="status">
       <status>
           <name>
               <xsl:choose>
                   <xsl:when test="name = 'Restricted'">
                       Withdrawn
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="name"/>
                   </xsl:otherwise>
               </xsl:choose>
          </name>
       </status>
</xsl:template>
</xsl:stylesheet>
