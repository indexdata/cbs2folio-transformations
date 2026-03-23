<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    
    <!-- Kopieren von Knoten unverändert -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Map locations -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
        <xsl:variable name="lower" select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
        <xsl:variable name="callnumber" select="../callNumber"/>    
        
        <permanentLocationId>
            <xsl:choose>
                <!-- Online -->
                <xsl:when test="$electronicholding='O'">be83badd-72ec-417a-8284-bb2fa58afeb1</xsl:when>
                <!-- bestellt -->   
                <xsl:when test="$callnumber='bestellt'">2cc5a0db-7703-4193-ba85-8e800bd327e4</xsl:when>
                <!-- Bestellung negativ -->   
                <xsl:when test="$callnumber='vergriffen'
                                    or $callnumber='erscheint nicht'
                                    or $callnumber='storniert'
                                    or $callnumber='nicht lieferbar'">1a430501-3ad0-448e-a366-6666faad2e49</xsl:when>
                <!-- Magazin -->
                <xsl:when test="$lower='mag'">11eab764-df2d-4427-97c1-f2ab75f61509</xsl:when>
                <!-- TGB Freihand -->
                <xsl:when test="$lower='j 1' 
                                    or $lower='j 21' 
                                    or $lower='j 22/or' 
                                    or $lower='j 22' 
                                    or $lower='j 23/vkd' 
                                    or $lower='j 23' 
                                    or $lower='j 25' 
                                    or $lower='j 28' 
                                    or $lower='j 30' 
                                    or $lower='j 35' 
                                    or $lower='j 49' 
                                    or $lower='j 53' 
                                    or $lower='j 84' 
                                    or $lower='j 135/is' 
                                    or $lower='j 135/k' 
                                    or $lower='j 135/m' 
                                    or $lower='j 135' 
                                    or $lower='j 160' 
                                    or $lower='j 161' 
                                    or $lower='np'">f08cefcd-9927-4275-a9bb-c1980972ace0</xsl:when>
                <!-- TBNM/Lobeda Freihand -->
                <xsl:when test="$lower='j 5' 
                                    or $lower='j 6n' 
                                    or $lower='j 8' 
                                    or $lower='j 11' 
                                    or $lower='j 29' 
                                    or $lower='j 32' 
                                    or $lower='j 39' 
                                    or $lower='j 40' 
                                    or $lower='j 43' 
                                    or $lower='j 44k' 
                                    or $lower='j 48' 
                                    or $lower='j 73' 
                                    or $lower='j 87' 
                                    or $lower='j 105' 
                                    or $lower='j 117' 
                                    or $lower='j 136' 
                                    or $lower='j 146'">95f3d17f-ae18-4c06-812b-bc373b1cc8c0</xsl:when>
                <!-- TBRWS Freihand -->
                <xsl:when test="$lower='j 33' 
                                    or $lower='j 64' 
                                    or $lower='j 142'">dcb91937-00c4-428e-95d1-9de983987bdd</xsl:when>
                <!-- TBNM Freihand -->
                <xsl:when test="$lower='j 6' 
                                    or $lower='j 9' 
                                    or $lower='j 12' 
                                    or $lower='j 14' 
                                    or $lower='j 16' 
                                    or $lower='j 19' 
                                    or $lower='j 20' 
                                    or $lower='j 24' 
                                    or $lower='j 26' 
                                    or $lower='j 36' 
                                    or $lower='j 37' 
                                    or $lower='j 41' 
                                    or $lower='j 44' 
                                    or $lower='j 50' 
                                    or $lower='j 66' 
                                    or $lower='j 71' 
                                    or $lower='j 76' 
                                    or $lower='j 144'">c0358575-4010-4ca9-b4d1-bc894cbdbdca</xsl:when>
                <!-- AHS Magazin -->
                <xsl:when test="starts-with($lower,'hz')">52787593-b4e1-4402-85e4-ff572fe0ad06</xsl:when>
                <!-- Herbarium Haussknecht -->
                <xsl:when test="$lower='j 13'">5f24b8af-c7b8-4834-8316-039205f59b24</xsl:when>
                <!-- Allgemeiner Lesesaal -->
                <xsl:when test="$lower='ls' or $lower='ls2'">a3ef8ff3-8d94-4af0-8dfe-9016ec47645c</xsl:when>
                <!-- TBRWS Magazin -->
                <xsl:when test="$lower='mag5' or $lower='j 138'">fe139d88-642c-472a-a8b5-95f079e71b95</xsl:when>
                <!-- TBNM/Lobeda Magazin -->
                <xsl:when test="$lower='mag3'">28393a32-7f0c-4398-9308-2dafd9554c6b</xsl:when>
                <!-- TBG Lehrbuchsammlung -->
                <xsl:when test="$lower='lbs'">bfd8966a-686d-4fb9-8648-5e20dddc76a6</xsl:when>
               <!--TBG Handapparat -->
                <xsl:when test="starts-with($lower,'j 1/') 
                                    or starts-with($lower,'j 21/')
                                    or starts-with($lower,'j 22/') 
                                    or starts-with($lower,'j 23/') 
                                    or starts-with($lower,'j 25/') 
                                    or starts-with($lower,'j 28/') 
                                    or starts-with($lower,'j 30/') 
                                    or starts-with($lower,'j 35/') 
                                    or starts-with($lower,'j 49/') 
                                    or starts-with($lower,'j 53/') 
                                    or starts-with($lower,'j 84/') 
                                    or starts-with($lower,'j 135/') 
                                    or starts-with($lower,'j 160/') 
                                    or starts-with($lower,'j 161/')">5c10db4a-5801-40a9-87c6-c56250c6ab99</xsl:when>
                 <!--TBRWS Handapparat -->
                <xsl:when test="starts-with($lower,'j 33/') 
                                    or starts-with($lower,'j 64/')
                                    or starts-with($lower,'j 142/')">b3f14f03-1123-4813-b336-57a9921f1a1d</xsl:when>
                <!--TBNM/Lobeda Handapparat -->
                <xsl:when test="starts-with($lower,'j 5/') 
                                    or starts-with($lower,'j 6n/')
                                    or starts-with($lower,'j 8/') 
                                    or starts-with($lower,'j 11/') 
                                    or starts-with($lower,'j 29/') 
                                    or starts-with($lower,'j 32/') 
                                    or starts-with($lower,'j 39/') 
                                    or starts-with($lower,'j 40/') 
                                    or starts-with($lower,'j 43/') 
                                    or starts-with($lower,'j 44k/') 
                                    or starts-with($lower,'j 48/') 
                                    or starts-with($lower,'j 73/') 
                                    or starts-with($lower,'j 87/') 
                                    or starts-with($lower,'j 105/') 
                                    or starts-with($lower,'j 117/') 
                                    or starts-with($lower,'j 136/') 
                                    or starts-with($lower,'j 146/')">96795b70-9a1a-49d6-8701-55d400219188</xsl:when>
                <!--TBNM Handapparat -->
                <xsl:when test="starts-with($lower,'j 6/') 
                                    or starts-with($lower,'j 9/')
                                    or starts-with($lower,'j 12/')
                                    or starts-with($lower,'j 14/') 
                                    or starts-with($lower,'j 16/') 
                                    or starts-with($lower,'j 19/') 
                                    or starts-with($lower,'j 20/') 
                                    or starts-with($lower,'j 24/') 
                                    or starts-with($lower,'j 26/') 
                                    or starts-with($lower,'j 36/') 
                                    or starts-with($lower,'j 37/') 
                                    or starts-with($lower,'j 41/') 
                                    or starts-with($lower,'j 44/') 
                                    or starts-with($lower,'j 50/') 
                                    or starts-with($lower,'j 66/') 
                                    or starts-with($lower,'j 71/') 
                                    or starts-with($lower,'j 76/') 
                                    or starts-with($lower,'j 144/')">b973744e-f5ef-4e7c-afd0-20d783a5457d</xsl:when>
                <!-- Sonderstandort -->
                <xsl:when test="starts-with($lower,'ha') 
                                    or $lower='eib1' 
                                    or $lower='j 20/wei' 
                                    or $lower='j 145' 
                                    or $lower='sost'">c60d9744-9f0a-4ef1-9d07-5686fc112979</xsl:when>
                <!-- TBRWS Lehrbuchsammlung -->
                <xsl:when test="$lower='lbs/j 33' 
                                    or $lower='lbs/j 64' 
                                    or $lower='lbs/j 142'">6c7e2b79-5913-4f30-9ad7-6a0c9faefa54</xsl:when>
                <!-- Ernst-Haeckel-Haus -->
                <xsl:when test="$lower='j 47'">3b2d472a-57bb-45ff-ae2f-e9bbc68a78f7</xsl:when>
                <!-- TBNM Lehrbuchsammlung -->
                <xsl:when test="$lower='lbs/j 26' 
                                    or $lower='lbs/j 76'">f0a2a3b4-28ea-4c0c-9396-0de9d76dc188</xsl:when>
                <!-- TLLLR -->
                <xsl:when test="$lower='j 42'">4164f012-5493-4c62-b52b-946f04f90809</xsl:when>
                <!-- TBNM Magazin -->
                <xsl:when test="$lower='mag6'">c41e9aee-887a-4fbb-aa66-25065530554b</xsl:when>
                <!-- AHS Freihand -->
                <xsl:when test="$lower='ls1'">0ab627bb-eb7e-4072-9287-4cf14e2cf1ee</xsl:when>
                <!-- Fernleihe außer Haus -->
                <xsl:when test="$lower='zausl'">6ee76397-4122-456f-b665-fa50e82c33b3</xsl:when>
                <!-- TBRWS EDZ -->
                <xsl:when test="$lower='j 151'">49eb0664-b851-47d6-bff0-2844d93ecf19</xsl:when>
                <!-- AHS Inkunabeln -->
                <xsl:when test="$lower='inc'">85ea2be2-b76c-41b4-9cfe-c169ce4807c7</xsl:when>
                <!-- TBNM/Lobeda Lehrbuchsammlung -->
                <xsl:when test="$lower='lbs/j 43'">302feaa4-97cb-4fb7-8840-03bb8f65f347</xsl:when>
                <!-- Museum Ernst-Haeckel-Haus -->
                <xsl:when test="$lower='ehh'">f1028cc0-c24c-4ba4-ab33-35250eef705a</xsl:when>
                <!-- Fernleihe Sonderlesesaal -->
                <xsl:when test="$lower='sls2'">430b9058-83a5-451c-a802-0069341edfb2</xsl:when>
                <!-- Handapparat Ernst-Haeckel-Haus -->
                <xsl:when test="$lower='j 47/ehh'">39a58f13-3b1b-4d60-8fac-e68a2ea04a79</xsl:when>
                <!-- Keine Zuordnung --> 
                <xsl:otherwise>6dd07aa7-8990-4f07-aecb-53bcd237f63f</xsl:otherwise>
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>