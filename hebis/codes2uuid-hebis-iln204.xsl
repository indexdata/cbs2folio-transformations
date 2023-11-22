<?xml version="1.0" encoding="UTF-8"?> 
<!-- date of last edit: 2022-12-20 (YYYY-MM-DD) -->

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
        <!-- E-Medien Locations -->
        <xsl:when test=".='ILN204/E/E/Online Medien'">a8147c16-5fea-47e0-b7b6-24016f0c4c86</xsl:when>
        <xsl:when test=".='ILN204/E/E/Datenbanken'">1b4daf5f-0af8-49eb-b3eb-e7d4c5c0fd7c</xsl:when>
        <xsl:when test=".='ILN204/E/E/E-Books'">67aec03b-9d32-42d6-89ba-bcd93a9f9475</xsl:when>
        <xsl:when test=".='ILN204/E/E/E-Journals'">33a863f2-f2f6-4642-8779-4eed44ad1f42</xsl:when>
        <xsl:when test=".='ILN204/E/E/GEB'">e813fb82-5c87-4f35-b678-7854d1bb6407</xsl:when>
        <!-- UB und Zweigbibliotheken -->
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
        <!-- Dezentrale Fachbibliotheken -->
        <xsl:when test=".='ILN204/CG/DezFB/AAA-DaF'">e7deec44-3df6-48f0-a136-522fef85fe40</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/AngewTheaterwiss'">fbe1532e-daff-49ae-b9f4-38e221dad537</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Biomathematik'">c36584c9-ec7a-4eb5-a000-e4f90c01fcba</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/AKWildbiologie'">9bde0a95-c28b-44d3-875c-9380d6edd4a5</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Anatomie'">4b47709e-02fa-4171-99ca-bb9cd0d113e8</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Arbeitsmedizin'">d814589d-0ece-470f-8344-315b18e205d8</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Augenklinik'">c148f39e-d084-48f3-b658-5f48709987e5</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Biochemie'">af0172e2-ce94-4803-b5af-ec28152fd784</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Biochemie-Endokrinologie'">865c26e8-0e6f-4108-92ef-a95181064960</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Dermatologie'">efbb4601-2cd6-443f-9e50-3edc2751b0ea</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Gefluegelkrankheiten'">ee739a05-398d-4b95-9e9c-c350c7feac5d</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Genetik'">0ea3361f-fb17-4db6-920e-29314c8b5045</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Geschichte-der-Medizin'">96b5effa-f339-4597-838f-01b0736d3b32</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Hermann-Hoffmann-Akademie'">2cd32f06-519e-48fa-936d-b2cc518c66b8</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Tierhygiene'">1be85661-bfa6-4859-9fc2-866fd9e4b3ec</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Hygiene-Umweltmedizin'">3ed44295-be80-4f35-9727-d41d602cce37</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Kleintier-Innere-Chirurgie'">f7a1e989-e0ea-4eaa-9175-96e18cefbd8a</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Klinik-Wiederkäuer'">10dff267-9df7-4399-a5a3-50a0729626c9</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Ländliches-Genossenschaftswesen'">3869f593-6889-4bba-b690-0b2f27d84020</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Milchwissenschaften'">04677453-a07d-4eb3-9316-01f135a6f8b3</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Pathologie'">74fabcd3-56c1-4bb0-ab3c-e75762d72be5</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Pferdeklinik'">67aad08d-8244-4a4a-92a6-bbc70c024b5c</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Parhmakol-Toxikol-BFS'">79514db3-3f93-48eb-94cc-1594e7d3c11c</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Physiologie'">da04460f-b656-4db5-9285-082e527ba0a8</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Prozesstechnik'">46086d5e-d9a3-4fc7-9777-07d271aa3d06</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Psychiat-Neurol'">02874c50-3f5b-4b89-b460-05eb3616f368</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Rechtsmedizin'">75122e51-c259-42f0-aef5-222b8681a2f2</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Strahelnschutz'">b6e1492e-0360-4931-aa1c-b1a2e31ea060</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Tieraerztliche-Nahrungsmittelkunde'">71ced5f8-b435-4665-b5a7-39baa100b050</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Reproduktionsmedizin-und-Neugeborenenkunde'">4a2d543b-ab5f-4906-8e39-751948356450</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Tierschutz-Ethologie'">e9db6ebe-db02-4690-8640-a990886050d2</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Veterinaeranatomie'">87f23d7a-0f9d-46bf-ae22-6036284ff233</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Veterinärpathologie'">b0871de2-42d5-45aa-813d-906a81b31e7c</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Veterinaerphysiologie'">5bdf51c0-f84f-415e-9ebd-d71cb5009b2d</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Virologie'">4dda1a1a-4a7c-4789-aaf8-1fa101ffa807</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Zoologie1'">47c21fb6-d5d0-44f1-9721-fbc2f112e19f</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/DidWerkSpr'">837d5025-1c43-4816-af18-d3571118711b</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/EDZ'">8c260edf-e633-479e-ae59-8162a9c09ff2</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Anglistik'">b69ff77e-db9c-4db6-ac0e-da0e77086c69</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Germanistik'">7ede1ffb-16de-4567-bb64-5917b53d137f</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Historisches-Institut'">ce4522c8-0cf0-4341-b41a-6d59555eb87a</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Klass-Archaeologie'">f6f9c294-809c-4712-89e3-05031e71b355</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Klass-Philologie'">32f506c7-175c-4819-9405-feff540fc113</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Mathe-Informatik'">12d52299-f6af-4b8c-9ad0-7431ecaba5bc</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/FB-Romanistik'">d7b572df-749f-40c1-8033-a1f7f0b18e7d</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/LernwerkstattIFIB'">92aaa70c-364a-4f24-a014-05df794acf16</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/LW-Inklusion-ZfL'">2058f074-a55f-402e-8397-099c8324dcdc</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Mediothek-Musikwiss'">4404b60e-4e1b-41f3-89b5-7d17dfd3df21</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/ÖkologischerLandbau'">03706f68-e02c-482f-9c80-d93b1a0dd346</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/SlavistikMediathek'">37c3a550-3ec3-4407-aec9-b92724e76a99</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Sudetendeutsches-Woerterbuch'">f12143d1-3daa-4ef1-856e-db1e74a9aeec</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Testothek-Psychologie'">a2507546-1b16-41a9-bee1-f6063373551d</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/Uniarchiv-SLS'">ec058ab4-5b10-4f8a-9f4a-44792edfa668</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL01'">bcb89112-dbfb-4d94-9bff-c535f012e507</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL02'">6204a63a-e20c-4d64-a3af-bf593e15e120</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL03'">4c3cc060-defc-44f4-9ca7-390078a46b77</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL04'">fe3b084e-214b-475f-b5ad-f38305fb942b</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL05'">013cb60d-389b-4230-b6b1-7ae86c622042</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL06'">f68dd648-619e-44e7-8da4-edbbaea7fc12</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL07'">96f4ed6e-29b9-47b6-9fc6-6fbf684bab3c</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL08'">6ac7c41d-1bf6-4e07-88c5-a77b59b1b35c</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL09'">1593f8fc-f309-45e6-888b-2e17a914a101</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-BWL10'">c0e12cbb-d24c-4763-a267-3285d33972e0</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-Statistik-Oekonometrie'">7e5689ad-368e-4771-b938-ee4745cd245d</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-VWL01'">32b4c40c-ad0e-49fa-a9e1-bdbe27cde496</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-VWL02'">35418016-b2ef-41a6-9679-7070f3960d7b</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-VWL03'">bb8317ad-0797-48c0-8688-f37ef17139cc</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-VWL04'">34c8a0b8-c2a9-4176-b2b8-b42fcc7d21fc</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-VWL05'">07ad72fe-fe9b-4a08-a70d-e3f4dd7b142c</xsl:when>
        <xsl:when test=".='ILN204/CG/DezFB/WiWi-VWL06'">97db3d60-682d-4743-a8b9-f3a1a9dbcffc</xsl:when>
        <!-- Aufsatzkatalogisierung -->
        <xsl:when test=".='ILN204/CG/Aufsatz/Aufsatzkatalogisate'">3522ba70-ee87-4a26-a854-469dff54723a</xsl:when>
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
