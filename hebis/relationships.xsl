<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2024-07-15 (YYYY-MM-DD) -->

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>

  <xsl:template match="collection">
    <collection>
        <xsl:apply-templates/>
    </collection>
  </xsl:template>

  <xsl:template match="record">
    <record>
        <xsl:for-each select="@* | node()">
            <xsl:copy-of select="."/>
        </xsl:for-each>
        <xsl:apply-templates/>
    </record>
  </xsl:template>

  <xsl:template match="original">
    <instanceRelations>
      <!-- related instances -->
      <xsl:if test="./datafield[@tag='036D' or @tag='036F' or @tag='039B']">
        <parentInstances>
          <!-- 039C is not needed, child relations are generated from parent relations -->
          <xsl:variable name='is-vol' select="substring(./datafield[@tag='002@']/subfield[@code='0'], 2, 1)"/>
          <arr>
            <xsl:for-each select="datafield[@tag='036D' or @tag='036F' or (@tag='039B' and ($is-vol='o'))]">
              <i>
                <xsl:call-template name="rel-body"/>
                <instanceRelationshipTypeId>
                  <xsl:choose>
                    <xsl:when test="./@tag='039B'">Aufsatz</xsl:when>
                    <xsl:when test="./@tag='036F' and $is-vol='v'">Band</xsl:when>
                    <xsl:when test="./@tag='036D'">Mehrteilige Monografie</xsl:when>
                    <xsl:when test="./@tag='036F'">Schriftenreihe</xsl:when> 
                  </xsl:choose>
                </instanceRelationshipTypeId>
              </i>
            </xsl:for-each>
          </arr>
        </parentInstances>
      </xsl:if>
    </instanceRelations>
  </xsl:template>
  <xsl:template match="text()"/>
  
  <xsl:template name="rel-body">
    <xsl:if test="./subfield[@code='9']">
      <instanceIdentifier>
        <hrid><xsl:value-of select="./subfield[@code='9']"/></hrid>
      </instanceIdentifier>
    </xsl:if>
    <provisionalInstance>
      <title>
        <xsl:choose>
          <xsl:when test="contains(./subfield[@code=8], ' ; ')"><xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ')"/></xsl:when>
          <xsl:otherwise><xsl:value-of select="./subfield[@code='8']"/></xsl:otherwise>
        </xsl:choose>
      </title>
      <instanceTypeId><xsl:value-of select="../../instance/instanceTypeId"/></instanceTypeId>
      <source><xsl:value-of select="../../instance/source"/></source>
    </provisionalInstance>
  </xsl:template>

</xsl:stylesheet>