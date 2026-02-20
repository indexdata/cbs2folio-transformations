<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

    <xsl:template match="/">
        <root>
            <xsl:for-each select="//record">
                <i>
                    <xsl:value-of select="hrid"/>
                </i>
            </xsl:for-each>
        </root>
    </xsl:template>

</xsl:stylesheet>
