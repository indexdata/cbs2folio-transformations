<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- ILN 49 HS Mainz -->

  <!-- Map locations 
       For Mainz, the IDs are the location names in FOLIO, generated from 209A $f and other pica fields -->
  
  <xsl:template match="permanentLocationId|temporaryLocationId"> <!-- ILN -->
    <xsl:element name="{name()}">
      <xsl:choose>
        <xsl:when test=".='DUMMY'">de4046e6-d80a-474d-b81e-d5767f995dc6</xsl:when>
        <xsl:when test=".='FBVW'">5c065729-d39e-488b-8889-c51ea6ec34b6</xsl:when>
        <xsl:when test=".='GROSS'">5f285140-6bd2-4344-b7c5-aa06fd8379bc</xsl:when>
        <xsl:when test=".='MAG'">3cf395ae-3b02-4692-acdb-ded28d4dd4ce</xsl:when>
        <xsl:when test=".='NZ'">91885c25-3b18-47d3-9cf6-5f6be2b396fb</xsl:when>
        <xsl:when test=".='OGALLG'">0e78b7d2-77f7-40f5-aa14-c214017ba743</xsl:when>
        <xsl:when test=".='OGARCH'">5a168363-8f88-4d90-af4c-edf12635da5c</xsl:when>
        <xsl:when test=".='OGBAU'">2f2caf30-43c6-4732-bc94-d58fecf8a2ba</xsl:when>
        <xsl:when test=".='OGBWL'">746c7cbc-b4ee-4e7e-ab19-e342863d117f</xsl:when>
        <xsl:when test=".='OGG'">345b2c2c-8f92-451f-83cf-05062c665d25</xsl:when>
        <xsl:when test=".='OGL'">68b98214-2d81-4b06-ac86-150625947207</xsl:when>
        <xsl:when test=".='OGN'">6c58cfa6-6850-4b7d-a79b-f7b8bd762e90</xsl:when>
        <xsl:when test=".='OGR'">b9e07227-4eaa-4c24-97f9-daea28d14781</xsl:when>
        <xsl:when test=".='OGS'">8504615a-b4ff-4f45-8f6d-bb519548a452</xsl:when>
        <xsl:when test=".='OGV'">084862ab-58c5-4f6b-90e1-086a1841dd25</xsl:when>
        <xsl:when test=".='ONLINE'">beff68a9-c73a-4263-9800-594d5753a45a</xsl:when>
        <xsl:when test=".='SEMAPP'">52266628-7c3b-4f0f-9660-06447fe596bd</xsl:when>
        <xsl:when test=".='THEKE'">c648462a-74a3-4b59-aae8-863b87f1baa9</xsl:when>
        <xsl:when test=".='UGG'">7dc5cd5a-4b36-4b7a-8eef-6814f38437bd</xsl:when>
        <xsl:when test=".='UGK'">4da4a223-94da-49d3-86d1-1986db59a07d</xsl:when>
        <xsl:when test=".='UGMED'">9196a230-a3a2-44fb-b9a9-6df71e403f82</xsl:when>
        <xsl:when test=".='UGV'">af1150a4-e603-40ee-8afb-53831dd1a132</xsl:when>
        <xsl:when test=".='UGZS'">20f5eb0e-24e7-497a-aa32-6d49a9873a10</xsl:when>
        <xsl:when test=".='ZEB'">d1ce5d9a-6776-44a3-81c2-dea08d272c26</xsl:when>
        <xsl:otherwise>91885c25-3b18-47d3-9cf6-5f6be2b396fb</xsl:otherwise> <!-- NZ -->
      </xsl:choose>
    </xsl:element>
  </xsl:template>



  <!-- Map loan types -->
  <xsl:template match="permanentLoanTypeId"> <!-- ILN TBD -->
    <permanentLoanTypeId>
       <xsl:choose>
       <xsl:when test=".='u ausleihbar (auch Fernleihe)'"><xsl:text>fdd9a986-ef76-4881-9858-ff24d9201da3</xsl:text></xsl:when> 
        <xsl:when test=".='b Kurzausleihe'"><xsl:text>478094a0-d87a-46bd-9951-c9cc8b64c453</xsl:text></xsl:when>
        <xsl:when test=".='c Lehrbuchsammlung'"><xsl:text>6ad0666d-f363-4446-b888-4689497779a6</xsl:text></xsl:when>
        <xsl:when test=".='s Präsenzbestand Lesesaal'"><xsl:text>1fa09d28-c954-4b32-a868-61490e5c7865</xsl:text></xsl:when>
        <xsl:when test=".='d ausleihbar (keine Fernleihe)'"><xsl:text>7221cc70-17be-47ae-af09-b542e5abdcad</xsl:text></xsl:when>
        <xsl:when test=".='i nur für den Lesesaal'"><xsl:text>4e2ea91f-5454-4bb8-92d7-3047fa748c03</xsl:text></xsl:when>
        <xsl:when test=".='e vermisst'"><xsl:text>771a4d7b-02f6-41ca-aa4a-13519c81fdd5</xsl:text></xsl:when>
        <xsl:when test=".='a bestellt'"><xsl:text>9d1acd95-39a3-48f2-9e45-a5c7b8fa7d0a</xsl:text></xsl:when>
        <xsl:when test=".='g nicht ausleihbar'"><xsl:text>e8ae51a4-5ec4-4c53-95ba-093e3d73d04f</xsl:text></xsl:when>
        <xsl:when test=".='z Verlust'"><xsl:text>eadbe1a0-b86f-4315-987b-7b707f976f40</xsl:text></xsl:when>
        <xsl:when test=".='dummy'"><xsl:text>02c0c444-96f7-4fbf-9488-5180ae7ad63f</xsl:text></xsl:when>
        <xsl:when test=".='unbekannt'"><xsl:text>3b16cade-fdeb-40d8-8f2b-e3495b6d321b</xsl:text></xsl:when>        
        <xsl:otherwise>3b16cade-fdeb-40d8-8f2b-e3495b6d321b</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <!-- Map identifier types -->
  <xsl:template match="identifierTypeId"> <!-- additional RLP -->
    <identifierTypeId>
      <xsl:choose>
        <xsl:when test=".='PPN-K10plus'"><xsl:text>98e4039e-adfe-405f-b763-c642765269df</xsl:text></xsl:when>
        <xsl:when test=".='PPN-Hebis'"><xsl:text>be3a2669-391d-4027-b023-1092a61ac631</xsl:text></xsl:when>
        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
      </xsl:choose>
    </identifierTypeId>
  </xsl:template>

  <!-- Map statistical code ids -->
  <xsl:template match="statisticalCodeIds"> <!-- ILN --> <!-- TBD: generate -->
    <statisticalCodeIds>
      <arr>
        <xsl:for-each select="arr/i">
          <i>
            <xsl:choose>
              <xsl:when test=".='Dublettenbereinigung'">812aef7b-f026-449e-8976-31883ad95d1b</xsl:when>
              <xsl:when test=".='ZDB-Titel-mit-Mono-EPN'">73abd902-87c7-4bad-bdfe-25cbc06b6e63</xsl:when>
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

  <!-- Map holding note types -->
  <xsl:template match="holdingsNoteTypeId"> <!-- Level 2: FOLIO/hebis-wide -->
    <holdingsNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Abrufzeichen'"><xsl:text>6d3f575d-6727-42a4-ae58-56c00de2e1d4</xsl:text></xsl:when>        
        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
      </xsl:choose>
    </holdingsNoteTypeId>
  </xsl:template>

</xsl:stylesheet>
