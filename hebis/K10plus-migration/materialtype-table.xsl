<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

<xsl:template match="/">
    <root>
        <xsl:apply-templates/>
    </root>
</xsl:template>


<xsl:template match="row">
    <row>
        <xsl:variable name="type1" select="acq_m_material_code_1"/> <!-- substring(../datafield[@tag='002@']/subfield[@code='0'], 1, 1) -->
        <xsl:variable name="pd" select="pd"/> <!-- ../datafield[@tag='013H']/subfield[@code='0'] -->
        <xsl:copy-of select="acq_m_material_code_1|pd"/>
        <xsl:variable name="folio_name">
            <xsl:choose>
                <xsl:when test="(($type1 = 'A') and ($pd = 'kart')) or ($type1 = 'K')">Karten</xsl:when> <!-- K10plus: pd kart type1 A / Hebis: type1 K -->
                <xsl:when test="(($type1 = 'A') and ($pd = 'muno')) or ($type1 = 'M')">Noten</xsl:when> <!-- K10plus: pd muno type1 A / Hebis: type1 M -->
                <xsl:when test="($type1 = 'A') or ($type1 = 'H') or ($type1 = 'I') or ($type1 = 'L') or (($type1 = 'B') and ($pd = 'bild'))">Druckschrift</xsl:when> <!-- K10plus: pd bild type1 B / Hebis: type1 I -->
                <xsl:when test="($type1 = 'G') or (($type1 = 'B') and ($pd = 'soto'))">Tonträger</xsl:when> <!-- K10pus: pd soto type1 B / Hebis: type1 G -->
                <xsl:when test="$type1 = 'B'">Audiovisuelles Material</xsl:when> <!-- K10plus: pd vide type1 B / Hebis: type1 B -->
                <xsl:when test="$type1 = 'C'">Blindenschriftträger</xsl:when>
                <xsl:when test="$type1 = 'E'">Mikroformen</xsl:when>
                <!-- <xsl:when test="$type1 = 'O'">E-Ressource</xsl:when> --> <!-- no items -->
                <xsl:when test="$type1 = 'S'">Computerlesbares Material</xsl:when>
                <xsl:when test="$type1 = 'V'">Objekt</xsl:when>
                <xsl:otherwise>Sonstiges</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <folio_name><xsl:value-of select="$folio_name"></xsl:value-of></folio_name>
        <folio_uuid_materialType>
            <xsl:choose>
                <xsl:when test="$folio_name='Druckschrift'"><xsl:text>24080190-7539-4520-bde1-762f57d006fc</xsl:text></xsl:when> 
                <xsl:when test="$folio_name='Audiovisuelles Material'"><xsl:text>e378db32-4422-405d-bf08-89efd33335fd</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Blindenschriftträger'"><xsl:text>e7a305fc-3409-4c6a-95fe-7d220e773144</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Tonträger'"><xsl:text>baed4206-eef1-4c00-8126-d159a2113a71</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Computerlesbares Material'"><xsl:text>a662fc3c-6a6e-4992-a38b-a74f875204c1</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Karten'"><xsl:text>e8b94e9e-4144-46a8-b31c-774978d1c5ec</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Noten'"><xsl:text>79edde01-85ce-451b-870a-edbfcbd8dbd7</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Mikroformen'"><xsl:text>0a877486-1efb-43c2-b0e6-d539dd352aa2</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Sonstiges'"><xsl:text>789c3cc7-54ac-41ed-90c6-da7fb417574a</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Objekt'"><xsl:text>a84dfcf6-3ad7-4160-b926-3b2450eea081</xsl:text></xsl:when>
                <xsl:when test="$folio_name='Zeitschriftenband'"><xsl:text>5a4ea4ea-2c8c-4f7c-abfb-c0e9e93197e6</xsl:text></xsl:when>
                <xsl:otherwise>24080190-7539-4520-bde1-762f57d006fc</xsl:otherwise> <!-- Druckschrift -->
            </xsl:choose>
        </folio_uuid_materialType>
    </row>
</xsl:template>

</xsl:stylesheet>