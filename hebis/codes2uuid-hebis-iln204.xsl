<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>


  <!-- ILN 204 UB Gießen -->
  <!-- Map locations (codes2uuid-hebis-iln204.xsl)
       the IDs are the location names in FOLIO, generated from 209A $f and other pica fields -->

  <xsl:template match="permanentLocationId"> <!-- ILN -->
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='ILN204/E/E/Online Medien'">a8147c16-5fea-47e0-b7b6-24016f0c4c86</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/Freihand1OG'">4b0f04c3-80f6-41b8-b932-9ad6b1310ee1</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/Freihand2OG'">2b6d95b8-a103-4aca-94a8-c506806b850d</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/UBMagAltbau'">c04637db-0938-499f-b4a4-92c28c4b1cd2</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/UBMag3'">7a2e235e-a835-4aa2-a231-607cd38ea05c</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/UBMagKeller'">42796a67-f479-4f69-bc09-9eb080249327</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/UBMagPhil1'">3e26a16a-cf6b-4d14-8606-1db78bfbc023</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/UBSLS'">bde53f6b-b51f-4f42-8a4b-bfea6bdad539</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/Erwerbungssignatur'">4f790b65-3874-49a7-8dac-46b3cbcfd6ab</xsl:when>
        <xsl:when test=".='ILN204/CG/UB/Unbekannt'">76fb831c-500b-4e87-a5ed-f2dea37ee330</xsl:when>
        <xsl:when test=".='ILN204/CG/ZNL/Freihand'">f3dc06c9-9c2e-4026-a678-146d00591c38</xsl:when>
        <xsl:when test=".='ILN204/CG/ZNL/Mag'">0c2ef18e-2d61-459f-9f08-a7413f3b701f</xsl:when>
        <xsl:when test=".='ILN204/CD/ZNL/Erwerbungssignatur'">ff7db8c1-d6a8-421f-96e0-9564f93c3936</xsl:when>
        <xsl:when test=".='ILN204/CG/ZNL/Unbekannt'">e9a4e942-da73-4895-8c6a-5a33411b721e</xsl:when>
        <xsl:when test=".='ILN204/CG/ZP2/Freihand'">f73d8f40-77fb-4b19-b04a-df6177e717f9</xsl:when>
        <xsl:when test=".='ILN204/CG/ZP2/Erwerbungssignatur'">d0e8d213-b1d0-4ce3-858a-23b8132f8e68</xsl:when>
        <xsl:when test=".='ILN204/CG/ZP2/Unbekannt'">1f6e4499-9b8d-4fc1-b108-f99b5d272216</xsl:when>
        <xsl:when test=".='ILN204/CG/ZRW/Freihand'">4a8b6fce-6fa8-402e-afeb-7324cfe1a740</xsl:when>
        <xsl:when test=".='ILN204/CG/ZRW/Erwerbungssignatur'">52f3c598-edba-4759-b950-fe1e4c2a3ddb</xsl:when>
        <xsl:when test=".='ILN204/CG/ZRW/Unbekannt'">1913d98c-0a68-411e-8dd6-f90871895590</xsl:when>
        <xsl:when test=".='ILN204/CG/ZHB/Freihand'">d5a66747-ab61-4f4e-bfc5-4e5cd880c403</xsl:when>
        <xsl:when test=".='ILN204/CG/ZHB/Magazin'">29e31115-b52d-483d-a692-3209f7f25fbe</xsl:when>
        <xsl:when test=".='ILN204/CG/ZHB/Erwerbungssignatur'">4f2724b1-d94f-41b4-8372-52d953fceec7</xsl:when>
        <xsl:when test=".='ILN204/CG/ZHB/Unbekannt'">62e3f6fa-b0bf-435d-afa4-f0162eae8e32</xsl:when>
        <xsl:otherwise>32ad6c56-957e-4a4b-ad1f-458e254b1f6e</xsl:otherwise> <!-- Hier dezentrale FB als Sammler? -->
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <xsl:template match="permanentLoanTypeId"> <!-- ILN -->
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='0 u Ausleihbar'"><xsl:text>ecfbf446-421a-4a46-8e06-3e1e36d5b317</xsl:text></xsl:when> 
        <xsl:when test=".='1 b Kurzausleihe'"><xsl:text>03db4452-a270-4e03-9940-0ce86051694c</xsl:text></xsl:when>
        <xsl:when test=".='2 c Lehrbuchsammlungsausleihe'"><xsl:text>f71d6dcd-b3da-45dd-9e3f-a45afa3718ec</xsl:text></xsl:when>
        <xsl:when test=".='3 s Präsenzbestand'"><xsl:text>5d0c3d01-4dcb-4923-acda-dc0402f5f476</xsl:text></xsl:when>
        <xsl:when test=".='4 d Passive Fernleihe'"><xsl:text>7fc991fd-8500-4ba8-9894-052ec69d718f</xsl:text></xsl:when>
        <xsl:when test=".='5 i Nur für den Lesesaal'"><xsl:text>4d3e1d7a-cf78-4a9e-bb00-e6596de015e2</xsl:text></xsl:when>
        <xsl:when test=".='6 f nur Kopie möglich'"><xsl:text>6210aee5-990a-42ac-a08c-ecfb28c4bbfb</xsl:text></xsl:when>
        <!-- <xsl:when test=".='7 x Semesterausleihe'"><xsl:text></xsl:text></xsl:when> -->
        <xsl:when test=".='8 e Vermisst'"><xsl:text>5e46da98-6ab0-4ff2-a911-531c8b7bc71d</xsl:text></xsl:when>
        <xsl:when test=".='9 a Zur Erwerbung bestellt'"><xsl:text>48ddc2c8-8b09-4275-9de7-fabbb219d1e1</xsl:text></xsl:when>
        <xsl:when test=".='9 g Nicht ausleihbar'"><xsl:text>35856cfc-dcde-465f-ada0-cedb491bd2da</xsl:text></xsl:when>
        <xsl:when test=".='9 o Ausleihstatus unbekannt'"><xsl:text>5170505e-f4a4-4f17-955b-e0ce202889c4</xsl:text></xsl:when>
        <xsl:when test=".='9 z Verlust'"><xsl:text>38e8967f-a722-4297-aaeb-56f812533a78</xsl:text></xsl:when>
        <!-- <xsl:otherwise>2b94c631-fca9-4892-a730-03ee529ffe27</xsl:otherwise> <! 0 u normal ausleihbar -->
        <xsl:otherwise>5170505e-f4a4-4f17-955b-e0ce202889c4</xsl:otherwise> <!-- 9 o Ausleihstatus unbekannt -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <!-- Map statistical code ids -->
  <xsl:template match="statisticalCodeIds"> <!-- ILN -->
    <statisticalCodeIds>
      <arr>
        <xsl:for-each select="arr/i">
          <i>
            <xsl:choose>
              <xsl:when test=".='1001'">TBD</xsl:when>
              <!-- add as needed -->
              
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

</xsl:stylesheet>
