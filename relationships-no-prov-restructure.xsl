<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2025-01-08 -->

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
      <!-- Parent Instances -->
      <xsl:variable name="is-vol">
        <xsl:call-template name="get-is-vol">
          <xsl:with-param name="contextNode" select="."/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="parentNodes" select="datafield[@tag='036D' or @tag='036F' or (@tag='039B' and ($is-vol='o'))]"/>
      <xsl:call-template name="relationship-array">
        <xsl:with-param name="relationType" select="'parentInstances'"/>
        <xsl:with-param name="nodes" select="$parentNodes"/>
        <xsl:with-param name="isVol" select="$is-vol"/>
      </xsl:call-template>

      <!-- Preceding Titles -->
      <xsl:variable name="prec" select="./datafield[@tag='039E' and subfield[@code='b']='f']"/>
      <xsl:call-template name="relationship-array">
        <xsl:with-param name="relationType" select="'precedingTitles'"/>
        <xsl:with-param name="nodes" select="$prec"/>
        <xsl:with-param name="isVol" select="$is-vol"/>
      </xsl:call-template>

      <!-- Succeeding Titles -->
      <xsl:variable name="succ" select="./datafield[@tag='039E' and subfield[@code='b']='s']"/>
      <xsl:call-template name="relationship-array">
        <xsl:with-param name="relationType" select="'succeedingTitles'"/>
        <xsl:with-param name="nodes" select="$succ"/>
        <xsl:with-param name="isVol" select="$is-vol"/>
      </xsl:call-template>
    </instanceRelations>
  </xsl:template>

  <xsl:template match="text()"/>

  <!-- Template for relationship structure (Parent/Preceding/Succeeding) -->
  <xsl:template name="relationship-array">
    <xsl:param name="relationType" />
    <xsl:param name="nodes" />
    <xsl:param name="isVol" />
    <xsl:if test="$nodes">
      <xsl:element name="{$relationType}">
        <arr>
          <xsl:for-each select="$nodes">
            <i>
              <xsl:call-template name="rel-body"/>
              <xsl:call-template name="instanceRelationshipTypeId">
                <xsl:with-param name="tag" select="@tag"/>
                <xsl:with-param name="isVol" select="$isVol"/>
              </xsl:call-template>
            </i>
          </xsl:for-each>
        </arr>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!-- Template for relationship type -->
  <xsl:template name="instanceRelationshipTypeId">
    <xsl:param name="tag" />
    <xsl:param name="isVol" />
    <instanceRelationshipTypeId>
      <xsl:choose>
        <xsl:when test="$tag='036F' and $isVol='v'">Band</xsl:when>
        <xsl:when test="$tag='036D'">Mehrteilige Monografie</xsl:when>
        <xsl:when test="$tag='036F'">Schriftenreihe</xsl:when>
      </xsl:choose>
    </instanceRelationshipTypeId>
  </xsl:template>

  <!-- Template to calculate is-vol -->
  <xsl:template name="get-is-vol">
    <xsl:param name="contextNode" select="."/>
    <xsl:value-of select="substring($contextNode/datafield[@tag='002@']/subfield[@code='0'], 2, 1)"/>
  </xsl:template>

  <xsl:template name="rel-body">
    <xsl:if test="./subfield[@code='9']">
      <instanceIdentifier>
        <hrid><xsl:value-of select="./subfield[@code='9']"/></hrid>
      </instanceIdentifier>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
