<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="hrid">
        <hrid><xsl:value-of select="if (matches(.,'^[0-9].*')) then concat('HEB',.) else ."/></hrid>
    </xsl:template>

</xsl:stylesheet>
