<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Map locations 
         NOTE: The tests are the codes returned by 209A $f, not the location names in FOLIO -->
    <xsl:template match="permanentLocationId">
        <permanentLocationId>
            <xsl:choose>
                <xsl:when test=".='ARCH'">d99c18f3-68c4-4237-8e0e-93309e196c29</xsl:when>
                <xsl:when test=".='ARCHIV'">67b479b5-8b79-4c85-8a66-09c4521b4f2f</xsl:when>
                <xsl:when test=".='BRS'">45b69075-30c2-444a-8232-307fe1cc09c3</xsl:when>
                <xsl:when test=".='DP'">b81a7235-88e7-4fed-86b1-fa3e3a797313</xsl:when>
                <xsl:when test=".='GKMA'">ca7d6bd6-afd0-4986-88e7-3dad69c9c9f7</xsl:when>
                <xsl:when test=".='DVDLBS'">f0bc46c3-402f-4707-8a1e-2b1072e10b88</xsl:when>
                <xsl:when test=".='F-1'">bded1480-59d5-4566-a820-2f07eeb48965</xsl:when>
                <xsl:when test=".='F1'">ca93b4b4-1173-4927-a3ee-fb1149655682</xsl:when>
                <xsl:when test=".='BSTF1'">fc39a590-98d5-4317-8cd2-7667c38639a7</xsl:when>
                <xsl:when test=".='A2'">469a99a9-f073-4778-9025-e40321284cec</xsl:when>
                <xsl:when test=".='F2'">30260ad1-9774-4493-9d30-551bc3238dd7</xsl:when>
                <xsl:when test=".='BSTF2'">1b5e4654-ae33-4a79-aa4a-57e67de1e0e3</xsl:when>
                <xsl:when test=".='A-0'">2ee01a3e-7b02-4de7-bde9-7b6e2951c1ad</xsl:when>
                <xsl:when test=".='A1'">c2be10fa-8cd9-401f-a6cb-f46ee23c2936</xsl:when>
                <xsl:when test=".='FL'">ff6ab6bb-3265-4dd3-b1c8-b7ea534a634a</xsl:when>
                <xsl:when test=".='BINGFA'">319869da-7289-4137-ae0e-6269d6944ca2</xsl:when>
                <xsl:when test=".='BINHHG'">0da7cb17-9196-433e-8362-be0cf0333fcb</xsl:when>
                <xsl:when test=".='ARCHHG'">95e4e248-5dff-41d3-8c49-3be928e5710c</xsl:when>
                <xsl:when test=".='ARCHH'">9fcf1b09-c4d5-4b9e-b46b-28b1bab994a2</xsl:when>
                <xsl:when test=".='ArchHa'">c9bc64c4-a88e-4419-a444-f5f2331928e5</xsl:when>
                <xsl:when test=".='BIngHa'">be1be2ff-429b-4f71-ab7f-712b9a16b379</xsl:when>
                <xsl:when test=".='BsHa'">1d8c627a-f44e-441b-a6b9-bb0caa23aa65</xsl:when>
                <xsl:when test=".='MHA'">3fcb03cf-b8b9-4423-a0cc-1b7e5fe48ab5</xsl:when>
                <xsl:when test=".='KB'">3836c3f2-542b-471f-8980-c9d8df94526d</xsl:when>
                <xsl:when test=".='LBS'">12381a17-0dc2-4719-8890-cf60b1892c1a</xsl:when>
                <xsl:when test=".='Mag'">04090125-00a3-4e31-9d2c-2e705e2be0cd</xsl:when>
                <xsl:when test=".='BstMag'">db697909-61ac-4e57-9e52-bf55f0485e79</xsl:when>
                <xsl:when test=".='SoMag'">d1f8d790-8f28-4c93-bccc-73574fbce5c0</xsl:when>
                <xsl:when test=".='BINGTS'">c06c11b0-f9d2-4de5-aaf1-79b2bc43f57e</xsl:when>
                <xsl:when test=".='Bst'">4ef28230-6c16-444b-a05b-12def1ce0199</xsl:when>
                <xsl:when test=".[contains(.,'geloescht')]">7d5cf950-90f7-4b2b-9ba7-e97bb503c15f</xsl:when>
                <xsl:when test=".='Online'">03acc590-3798-41a5-b2ce-1ae62d118d3e</xsl:when>
                <xsl:otherwise>5d95165f-d4c9-4797-ac13-60a30dd14dd6</xsl:otherwise>
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>