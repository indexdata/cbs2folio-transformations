<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

    <xsl:template match="/">
        <collection>
            <xsl:apply-templates/>
        </collection>
    </xsl:template>

    <xsl:template match="hrid">
        <xsl:variable name="no"><xsl:number format="00001"/></xsl:variable>
        <xsl:message><xsl:value-of select="$no"/><xsl:text> : </xsl:text><xsl:value-of select="."/></xsl:message>
            <record>
                <status>deleted</status>
                <hrid>
                    <xsl:value-of select="."/>
                </hrid>
            </record>
    </xsl:template>
    
    <xsl:template match="text()"/>
    
</xsl:stylesheet>
