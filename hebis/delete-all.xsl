<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2025-01-24 (YYYY-MM-DD) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  
  <xsl:template match="collection">
    <collection>
      <xsl:apply-templates/>
    </collection>
  </xsl:template>
  
  <xsl:template match="record[./status='deleted']">
    <record>
      <delete>
        <hrid>
          <xsl:value-of select="./hrid"/>
        </hrid>

        <processing>
        <instance>
            <statisticalCoding>
              <arr>
                <i>
                  <if>deleteSkipped</if>
                  <becauseOf>PO_LINE_REFERENCE</becauseOf>
                  <setCode>dcf1220f-5524-4f1e-8e40-5da3366e8478</setCode>
                </i>   
              </arr>
            </statisticalCoding> 
          </instance>
        </processing>
      </delete>
    </record>
  </xsl:template>

</xsl:stylesheet>

