<?xml version="1.0" encoding="UTF-8"?>
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
      <!-- Parent instances -->
      <xsl:if test="./datafield[@tag='036D' or @tag='036F' or @tag='039B']">
        <parentInstances>
          <arr>
            <xsl:for-each select="datafield[@tag='036D' or @tag='036F' or @tag='039B']">
              <i>
                <xsl:call-template name="rel-body"/>
                <xsl:variable name='is-vol' select="substring(../datafield[@tag='002@']/subfield[@code='0'], 2, 1)"/>
                <instanceRelationshipTypeId>
                  <xsl:choose>
                    <xsl:when test="./@tag='039B'">6366b68c-aeeb-4dfe-9cd5-92518b2244a0</xsl:when> <!-- article -->
                    <xsl:when test="./@tag='036F' and $is-vol='v'">23651816-7176-406a-8915-52e25b3a9411</xsl:when> <!-- volume -->
                    <xsl:when test="./@tag='036D'">a17daf0a-f057-43b3-9997-13d0724cdf51</xsl:when> <!-- multi-part -->
                    <xsl:when test="./@tag='036F'">30773a27-b485-4dab-aeb6-b8c04fa3cb17</xsl:when> <!-- series -->
                    <xsl:otherwise>758f13db-ffb4-440e-bb10-8a364aa6cb4a</xsl:otherwise> <!-- bound with -->
                  </xsl:choose>
                </instanceRelationshipTypeId>
              </i>
            </xsl:for-each>
          </arr>
        </parentInstances>
      </xsl:if>
      <xsl:variable name="prec" select="./datafield[@tag='039E' and subfield[@code='b']='f']"/>
      <xsl:if test="$prec">
        <precedingTitles>
          <arr>
            <xsl:for-each select="$prec">
              <i>
                <xsl:call-template name="rel-body" />
              </i>
            </xsl:for-each>
          </arr>
        </precedingTitles>
      </xsl:if>
      <xsl:variable name="succ" select="./datafield[@tag='039E' and subfield[@code='b']='s']"/>
      <xsl:if test="$succ">
        <succeedingTitles>
          <arr>
            <xsl:for-each select="$succ">
              <i>
                <xsl:call-template name="rel-body" />
              </i>
            </xsl:for-each>
          </arr>
        </succeedingTitles>
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