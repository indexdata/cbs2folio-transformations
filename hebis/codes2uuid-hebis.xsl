<?xml version="1.0" encoding="UTF-8"?> 
<!-- date of last edit: 2024-06-24 (YYYY-MM-DD) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
    
  <!-- Note: <xsl:text> Elements mark the UUIDs that are added by K10plus/hebis and are used to generate the reference records -->

  <!-- Map item note types -->
  <xsl:template match="itemNoteTypeId"> <!-- Level 2: FOLIO/hebis-wide -->
    <itemNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Binding'">87c450be-2033-41fb-80ba-dd2409883681</xsl:when>
        <xsl:when test=".='Note'">8d0a5eca-25de-4391-81a9-236eeefdd20b</xsl:when>
        <xsl:when test=".='Reproduction'">acb3a58f-1d72-461d-97c3-0e7119e8d544</xsl:when>
        <xsl:when test=".='Electronic bookplate'">f3ae3823-d096-4c65-8734-0c1efd2ffea8</xsl:when>
        <xsl:when test=".='Action note'">0e40884c-3523-4c6d-8187-d578e3d2794e</xsl:when>
        <xsl:when test=".='Copy note'">1dde7141-ec8a-4dae-9825-49ce14c728e7</xsl:when>
        <xsl:when test=".='Provenance'">c3a539b9-9576-4e3a-b6de-d910200b2919</xsl:when>
        <xsl:otherwise>8d0a5eca-25de-4391-81a9-236eeefdd20b</xsl:otherwise> <!-- Note -->
      </xsl:choose>
    </itemNoteTypeId>
  </xsl:template>

   <!-- Map holding note types -->
  <xsl:template match="holdingsNoteTypeId"> <!-- Level 2: FOLIO/hebis-wide -->
    <holdingsNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Binding'">e19eabab-a85c-4aef-a7b2-33bd9acef24e</xsl:when>
        <xsl:when test=".='Note'">b160f13a-ddba-4053-b9c4-60ec5ea45d56</xsl:when>
        <xsl:when test=".='Reproduction'">6a41b714-8574-4084-8d64-a9373c3fbb59</xsl:when>
        <xsl:when test=".='Electronic bookplate'">88914775-f677-4759-b57b-1a33b90b24e0</xsl:when>
        <xsl:when test=".='Action note'">d6510242-5ec3-42ed-b593-3585d2e48fd6</xsl:when>
        <xsl:when test=".='Copy note'">c4407cc7-d79f-4609-95bd-1cefb2e2b5c5</xsl:when>
        <xsl:when test=".='Provenance'">db9b4787-95f0-4e78-becf-26748ce6bdeb</xsl:when>
        <xsl:when test=".='Lizenzindikator'"><xsl:text>d1d99196-8904-4b2e-9125-9f7bbbf54cc1</xsl:text></xsl:when> <!-- hebis-wide -->       
        <xsl:when test=".='Lokaler Schlüssel'"><xsl:text>49050d37-2d82-452c-a963-2645ffc0b9a9</xsl:text></xsl:when> <!-- hebis-wide -->
        <xsl:when test=".='Text zur Ausleihbarkeit'"><xsl:text>f862da41-4a7a-4864-8a52-befa58ab210b</xsl:text></xsl:when> <!-- hebis-wide -->
        <xsl:when test=".='Standort (8201)'"><xsl:text>013e0b2c-2259-4ee8-8d15-f463f1aeb0b1</xsl:text></xsl:when> <!-- hebis-wide -->
        <xsl:when test=".='Letzte Änderung CBS'"><xsl:text>7cad8584-35f9-4ea7-8944-11bcf40ff29c</xsl:text></xsl:when> <!-- hebis-wide -->
        <xsl:when test=".='Lokale Schlagwörter'"><xsl:text>65eea0de-f9da-46e1-828a-479579997110</xsl:text></xsl:when> <!-- ILN-specific -->
        <xsl:when test=".='Lokale Klassifikationen'"><xsl:text>2b56966a-4fb2-4695-befe-073ac0d22996</xsl:text></xsl:when> <!-- ILN-specific -->
        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
      </xsl:choose>
    </holdingsNoteTypeId>
  </xsl:template>

  <!-- Map instance note types -->
  <xsl:template match="instanceNoteTypeId"> <!-- Level 0: FOLIO -->
    <instanceNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Information related to Copyright Status'">654be0fd-bba2-4791-afa3-ae60300d7043</xsl:when>
        <xsl:when test=".='Supplement note'">aecfda7a-e8aa-46d6-9046-9b0b8c231b85</xsl:when>
        <xsl:when test=".='Bibliography note'">86b6e817-e1bc-42fb-bab0-70e7547de6c1</xsl:when>
        <xsl:when test=".='Exhibitions note'">0ed2da88-3f81-42f5-b688-91b70919d9bb</xsl:when>
        <xsl:when test=".='Data quality note'">7929eee7-6822-4199-8df4-bb2ae773e4cd</xsl:when>
        <xsl:when test=".='Numbering peculiarities note'">cf635f41-29e7-4dd0-8598-33f230157074</xsl:when>
        <xsl:when test=".='Type of computer file or data note'">3d931c23-6ae8-4e5a-8802-dc8c2e21ea19</xsl:when>
        <xsl:when test=".='Local notes'">265c4910-3997-4242-9269-6a4a2e91392b</xsl:when>
        <xsl:when test=".='Language note'">7356cde5-ec6b-4961-9cb0-961c48a37af4</xsl:when>
        <xsl:when test=".='Publications About Described Materials note'">e0ea861c-959f-4912-8579-5e9ea8a69454</xsl:when>
        <xsl:when test=".='Biographical or Historical Data'">c636881b-8927-4480-ad1b-8d7b27b4bbfe</xsl:when>
        <xsl:when test=".='Additional Physical Form Available note'">1d51e8b2-dee7-43f5-983c-a40757b9cdfa</xsl:when>
        <xsl:when test=".='System Details note'">95f62ca7-5df5-4a51-9890-d0ec3a34665f</xsl:when>
        <xsl:when test=".='Target Audience note'">922fdcde-952d-45c2-b9ea-5fc8959ad116</xsl:when>
        <xsl:when test=".='Cartographic Mathematical Data'">794f19f1-d00b-4b4b-97e9-0de5a34495a0</xsl:when>
        <xsl:when test=".='Linking Entry Complexity note'">779c22a2-311c-4ebb-b71e-b246c7ee574d</xsl:when>
        <xsl:when test=".='Funding Information Note'">f289c02b-9515-4c3f-b242-ffd071e82135</xsl:when>
        <xsl:when test=".='Reproduction note'">d548fdff-b71c-4359-8055-f1c008c30f01</xsl:when>
        <xsl:when test=".='Formatted Contents Note'">5ba8e385-0e27-462e-a571-ffa1fa34ea54</xsl:when>
        <xsl:when test=".='Geographic Coverage note'">28e12ad3-4a8d-48cc-b56c-a5ded22fc844</xsl:when>
        <xsl:when test=".='Terms Governing Use and Reproduction note'">f677d908-69c6-4450-94a6-abbcf94a1ee5</xsl:when>
        <xsl:when test=".='Immediate Source of Acquisition note'">86c4bd09-16de-45ee-89d3-b6d32fae6de9</xsl:when>
        <xsl:when test=".='Accessibility note'">a6a5550f-4981-4b48-b821-a57d5c8ca3b3</xsl:when>
        <xsl:when test=".='Information About Documentation note'">13047c94-7d2c-4c41-9658-abacfa97a5c8</xsl:when>
        <xsl:when test=".='Preferred Citation of Described Materials note'">09812302-92f7-497e-9120-ed25de458ea5</xsl:when>
        <xsl:when test=".='Type of report and period covered note'">f939b820-4a23-43d1-84ba-101add6e1456</xsl:when>
        <xsl:when test=".='Original Version note'">42be8949-6f69-4c55-874b-60b744ac1103</xsl:when>
        <xsl:when test=".='Creation / Production Credits note'">9f08c9b7-500a-43e0-b00f-ba02396b198f</xsl:when>
        <xsl:when test=".='Entity and Attribute Information note'">1cb8ac76-01fa-49be-8b9c-fcdaf17458a5</xsl:when>
        <xsl:when test=".='Copy and Version Identification note'">ec9f8285-6bf9-4e6c-a3cb-38ef17f0317f</xsl:when>
        <xsl:when test=".='Awards note'">e8cdc2fe-c53c-478a-a7f3-47f2fc79c6d4</xsl:when>
        <xsl:when test=".='Location of Other Archival Materials note'">9a4b39f4-a7d5-4c4d-abc6-5ccf1fc1d78c</xsl:when>
        <xsl:when test=".='Summary'">10e2e11b-450f-45c8-b09b-0f819999966e</xsl:when>
        <xsl:when test=".='Participant or Performer note'">9b56b954-7f3b-4e4b-8ed0-cf40aef13975</xsl:when>
        <xsl:when test=".='Restrictions on Access note'">e814a32e-02da-4773-8f3a-6629cdb7ecdf</xsl:when>
        <xsl:when test=".='With note'">06b44741-888e-4b15-a75e-cb29e27752d1</xsl:when>
        <xsl:when test=".='Date / time and place of an event note'">43295b78-3bfa-4c28-bc7f-8d924f63493f</xsl:when>
        <xsl:when test=".='Scale note for graphic material'">72c611ab-f353-4c09-a0cc-33ff96cc3bef</xsl:when>
        <xsl:when test=".='Action note'">1c017b8d-c783-4f63-b620-079f7a5b9c07</xsl:when>
        <xsl:when test=".='Citation / References note'">6ca9df3f-454d-4b5b-9d41-feb5d5030b99</xsl:when>
        <xsl:when test=".='Binding Information note'">0dc69a30-6d2b-40df-a50e-e4982bda86f4</xsl:when>
        <xsl:when test=".='Source of Description note'">66ea8f28-d5da-426a-a7c9-739a5d676347</xsl:when>
        <xsl:when test=".='Ownership and Custodial History note'">56cf513e-a738-40c5-a3ab-b0c60ba07e15</xsl:when>
        <xsl:when test=".='Cumulative Index / Finding Aides notes'">fda2f2e3-965f-4220-8a2b-93d35ce6d582</xsl:when>
        <xsl:when test=".='Location of Originals / Duplicates note'">c6340b85-d048-426a-89aa-163cfb801a56</xsl:when>
        <xsl:when test=".='Methodology note'">02b5b0c6-3375-4912-ac75-ad9f552362b2</xsl:when>
        <xsl:when test=".='General note'">6a2533a7-4de2-4e64-8466-074c2fa9308c</xsl:when>
        <xsl:when test=".='Case File Characteristics note'">6f76f4e7-9c0b-4138-9371-09b36136372d</xsl:when>
        <xsl:when test=".='Accumulation and Frequency of Use note'">1c7acba3-523d-4237-acd2-e88549bfc660</xsl:when>
        <xsl:when test=".='Former Title Complexity note'">806cb024-80d2-47c2-8bbf-b91091c85f68</xsl:when>
        <xsl:when test=".='Study Program Information note'">06489647-c7b7-4b6c-878a-cb7c1178e9ca</xsl:when>
        <xsl:when test=".='Issuing Body note'">49475f04-35ef-4f8a-aa7f-92773594ca76</xsl:when>
        <xsl:when test=".='Dissertation note'">b73cc9c2-c9fa-49aa-964f-5ae1aa754ecd</xsl:when>
        <xsl:when test=".='Voraussichtlicher Erscheinungstermin'">57a9add3-788a-4192-aaf3-b021e6832be7</xsl:when>
        <xsl:when test=".='Tonart'">aa23e56b-3df0-4ec2-8b7d-ae6fc3a14448</xsl:when>
        <xsl:when test=".='Numerische Bezeichnung eines Musikwerks'">c56f790b-6d61-4458-90d2-647c3444cbf5</xsl:when>
        <xsl:when test=".='Besetzung'">95c85c62-9a3d-4483-82a2-9d2cdc9c2636</xsl:when>
        <xsl:when test=".='Musikalische Ausgabeform'">12fd955c-9031-4656-8e5e-71a12ba7f31c</xsl:when>
        <xsl:otherwise>6a2533a7-4de2-4e64-8466-074c2fa9308c</xsl:otherwise> <!-- General note -->
      </xsl:choose>
    </instanceNoteTypeId>
  </xsl:template>

  <!-- Map Aternative titles -->
  <xsl:template match="alternativeTitleTypeId">
    <alternativeTitleTypeId>
      <xsl:choose>
        <!-- Cover title -->
        <xsl:when test=".='Umschlagtitel'"><xsl:text>5c364ce4-c8fd-4891-a28d-bb91c9bcdbfb</xsl:text></xsl:when>
        <!-- Running title -->
        <xsl:when test=".='Kolumnentitel'"><xsl:text>09964ad1-7aed-49b8-8223-a4c105e3ef87</xsl:text></xsl:when>
        <!-- Caption title -->
        <xsl:when test=".='Kopftitel'"><xsl:text>432ca81a-fe4d-4249-bfd3-53388725647d</xsl:text></xsl:when>
        <!-- Uniform title -->
        <xsl:when test=".='Werktitel/Einheitssachtitel'"><xsl:text>30512027-cdc9-4c79-af75-1565b3bd888d</xsl:text></xsl:when>
        <!-- Parallel title -->
        <xsl:when test=".='Paralleltitel'"><xsl:text>4bb300a4-04c9-414b-bfbc-9c032f74b7b2</xsl:text></xsl:when>
        <!-- Distinctive title -->
        <xsl:when test=".='Spezifischer Titel'"><xsl:text>781c04a4-f41e-4ab0-9118-6836e93de3c8</xsl:text></xsl:when>
        <!-- No type specified -->
        <xsl:when test=".='Titeltyp nicht spezifiziert'"><xsl:text>0fe58901-183e-4678-a3aa-0b4751174ba8</xsl:text></xsl:when>
        <!-- Spine title -->
        <xsl:when test=".='Rückentitel'"><xsl:text>dae08d04-8c4e-4ab2-b6bb-99edbf252231</xsl:text></xsl:when>
        <!-- Added title page title -->
        <xsl:when test=".='Titel von einer weiteren Titelseite'"><xsl:text>2ca8538d-a2fd-4e60-b967-1cb220101e22</xsl:text></xsl:when>
        <!-- Portion of title -->
        <xsl:when test=".='Teil des Titels'"><xsl:text>a8b45056-2223-43ca-8514-4dd88ece984b</xsl:text></xsl:when>
        <!-- Other title -->
        <xsl:when test=".='Sonstiger Titel'"><xsl:text>2584943f-36ad-4037-a7fa-3bdebb09f452</xsl:text></xsl:when>
        <!-- Abweichender Titel -->
        <xsl:when test=".='Abweichender Titel'"><xsl:text>79ea6d17-8247-4126-aab5-99fbd2ac6dda</xsl:text></xsl:when>
        <!-- Titeltyp nicht spezifiziert -->
        <xsl:otherwise>0fe58901-183e-4678-a3aa-0b4751174ba8</xsl:otherwise>
      </xsl:choose>
    </alternativeTitleTypeId>
  </xsl:template>
  
  <!-- Map material types -->
  <xsl:template match="materialTypeId"> <!-- Level 0/2: hebis wide -->
    <materialTypeId>
      <xsl:choose>
        <xsl:when test=".='Druckschrift'"><xsl:text>24080190-7539-4520-bde1-762f57d006fc</xsl:text></xsl:when> 
        <xsl:when test=".='Audiovisuelles Material'"><xsl:text>e378db32-4422-405d-bf08-89efd33335fd</xsl:text></xsl:when>
        <xsl:when test=".='Blindenschriftträger'"><xsl:text>e7a305fc-3409-4c6a-95fe-7d220e773144</xsl:text></xsl:when>
        <xsl:when test=".='Tonträger'"><xsl:text>baed4206-eef1-4c00-8126-d159a2113a71</xsl:text></xsl:when>
        <xsl:when test=".='Computerlesbares Material'"><xsl:text>a662fc3c-6a6e-4992-a38b-a74f875204c1</xsl:text></xsl:when>
        <xsl:when test=".='Karten'"><xsl:text>e8b94e9e-4144-46a8-b31c-774978d1c5ec</xsl:text></xsl:when>
        <xsl:when test=".='Noten'"><xsl:text>79edde01-85ce-451b-870a-edbfcbd8dbd7</xsl:text></xsl:when>
        <xsl:when test=".='Mikroformen'"><xsl:text>0a877486-1efb-43c2-b0e6-d539dd352aa2</xsl:text></xsl:when>
        <xsl:when test=".='Sonstiges'"><xsl:text>789c3cc7-54ac-41ed-90c6-da7fb417574a</xsl:text></xsl:when>
        <xsl:when test=".='Objekt'"><xsl:text>a84dfcf6-3ad7-4160-b926-3b2450eea081</xsl:text></xsl:when>
        <xsl:otherwise>24080190-7539-4520-bde1-762f57d006fc</xsl:otherwise> <!-- Druckschrift -->
      </xsl:choose>
    </materialTypeId>
  </xsl:template>
  
  <!-- Map contrutor type codes to uuid (closed list with marcrelator) FOLIO -->
  <xsl:template match="contributorTypeId">
    <contributorTypeId>
      <xsl:choose>
        <xsl:when test=".='arc'">754edaff-07bb-45eb-88bf-10a8b6842c38</xsl:when>
        <xsl:when test=".='cov'">b7000ced-c847-4b43-8f29-c5325e6279a8</xsl:when>
        <xsl:when test=".='bkp'">c9c3bbe8-d305-48ef-ab2a-5eff941550e3</xsl:when>
        <xsl:when test=".='prc'">5ee1e598-72b8-44d5-8edd-173e7bc4cf8c</xsl:when>
        <xsl:when test=".='dpc'">d32885eb-b82c-4391-abb2-4582c8ee02b3</xsl:when>
        <xsl:when test=".='pre'">d04782ec-b969-4eac-9428-0eb52d97c644</xsl:when>
        <xsl:when test=".='abr'">28de45ae-f0ca-46fe-9f89-283313b3255b</xsl:when>
        <xsl:when test=".='pop'">fd0a47ec-58ce-43f6-8ecc-696ec17a98ab</xsl:when>
        <xsl:when test=".='ccp'">3db02638-598e-44a3-aafa-cbae77533ee1</xsl:when>
        <xsl:when test=".='bnd'">f90c67e8-d1fa-4fe9-b98b-cbc3f019c65f</xsl:when>
        <xsl:when test=".='cph'">2b7080f7-d03d-46af-86f0-40ea02867362</xsl:when>
        <xsl:when test=".='lyr'">398a0a2f-752d-4496-8737-e6df7c29aaa7</xsl:when>
        <xsl:when test=".='prd'">b13f6a89-d2e3-4264-8418-07ad4de6a626</xsl:when>
        <xsl:when test=".='aft'">d517010e-908f-49d6-b1e8-8c1a5f9a7f1c</xsl:when>
        <xsl:when test=".='egr'">af9a58fa-95df-4139-a06d-ecdab0b2317e</xsl:when>
        <xsl:when test=".='rth'">44eaf0db-85dd-4888-ac8d-a5976dd483a6</xsl:when>
        <xsl:when test=".='his'">81b2174a-06b9-48f5-8c49-6cbaf7b869fe</xsl:when>
        <xsl:when test=".='ctg'">22286157-3058-434c-9009-8f8d100fc74a</xsl:when>
        <xsl:when test=".='spy'">2fba7b2e-26bc-4ac5-93cb-73e31e554377</xsl:when>
        <xsl:when test=".='ard'">255be0dd-54d0-4161-9c6c-4d1f58310303</xsl:when>
        <xsl:when test=".='csp'">7bebb5a2-9332-4ba7-a258-875143b5d754</xsl:when>
        <xsl:when test=".='cpc'">5d92d9de-adf3-4dea-93b5-580e9a88e696</xsl:when>
        <xsl:when test=".='led'">d791c3b9-993a-4203-ac81-3fb3f14793ae</xsl:when>
        <xsl:when test=".='prs'">8210b9d7-8fe7-41b7-8c5f-6e0485b50725</xsl:when>
        <xsl:when test=".='anl'">396f4b4d-5b0a-4fb4-941b-993ebf63db2e</xsl:when>
        <xsl:when test=".='str'">7e5b0859-80c1-4e78-a5e7-61979862c1fa</xsl:when>
        <xsl:when test=".='col'">dd44e44e-a153-4ab6-9a7c-f3d23b6c4676</xsl:when>
        <xsl:when test=".='wam'">913233b3-b2a0-4635-8dad-49b6fc515fc5</xsl:when>
        <xsl:when test=".='arr'">ac64c865-4f29-4d51-8b43-7816a5217f04</xsl:when>
        <xsl:when test=".='bsl'">50a6d58a-cea2-42a1-8c57-0c6fde225c93</xsl:when>
        <xsl:when test=".='att'">d836488a-8d0e-42ad-9091-b63fe885fe03</xsl:when>
        <xsl:when test=".='lie'">7d60c4bf-5ddc-483a-b179-af6f1a76efbe</xsl:when>
        <xsl:when test=".='sgn'">12a73179-1283-4828-8fd9-065e18dc2e78</xsl:when>
        <xsl:when test=".='dte'">0d8dc4be-e87b-43df-90d4-1ed60c4e08c5</xsl:when>
        <xsl:when test=".='ctt'">e8423d78-7b08-4f81-8f34-4871d5e2b7af</xsl:when>
        <xsl:when test=".='dtc'">00311f78-e990-4d8b-907e-c67a3664fe15</xsl:when>
        <xsl:when test=".='res'">fec4d84b-0421-4d15-b53f-d5104f39b3ca</xsl:when>
        <xsl:when test=".='pbl'">a60314d4-c3c6-4e29-92fa-86cc6ace4d56</xsl:when>
        <xsl:when test=".='wal'">cb8fdd3f-7193-4096-934c-3efea46b1138</xsl:when>
        <xsl:when test=".='mfr'">d669122b-c021-46f5-a911-1e9df10b6542</xsl:when>
        <xsl:when test=".='trl'">3322b734-ce38-4cd4-815d-8983352837cc</xsl:when>
        <xsl:when test=".='lit'">52c08141-307f-4997-9799-db97076a2eb3</xsl:when>
        <xsl:when test=".='inv'">21430354-f17a-4ac1-8545-1a5907cd15e5</xsl:when>
        <xsl:when test=".='crt'">bd13d6d3-e604-4b80-9c5f-4d68115ba616</xsl:when>
        <xsl:when test=".='drt'">12101b05-afcb-4159-9ee4-c207378ef910</xsl:when>
        <xsl:when test=".='apl'">7d0a897c-4f83-493a-a0c5-5e040cdce75b</xsl:when>
        <xsl:when test=".='pth'">2cb49b06-5aeb-4e84-8160-79d13c6357ed</xsl:when>
        <xsl:when test=".='fnd'">3555bf7f-a6cc-4890-b050-9c428eabf579</xsl:when>
        <xsl:when test=".='fds'">60d3f16f-958a-45c2-bb39-69cc9eb3835e</xsl:when>
        <xsl:when test=".='hst'">abfa3014-7349-444b-aace-9d28efa5ede4</xsl:when>
        <xsl:when test=".='mdc'">ee04a129-f2e4-4fd7-8342-7a73a0700665</xsl:when>
        <xsl:when test=".='elg'">5b2de939-879c-45b4-817d-c29fd16b78a0</xsl:when>
        <xsl:when test=".='brl'">a986c8f2-b36a-400d-b09f-9250a753563c</xsl:when>
        <xsl:when test=".='com'">27aeee86-4099-466d-ba10-6d876e6f293b</xsl:when>
        <xsl:when test=".='tyd'">a2c9e8b5-edb4-49dc-98ba-27f0b8b5cebf</xsl:when>
        <xsl:when test=".='rsr'">cf04404a-d628-432b-b190-6694c5a3dc4b</xsl:when>
        <xsl:when test=".='drm'">33aa4117-95d1-4eb5-986b-dfba809871f6</xsl:when>
        <xsl:when test=".='cas'">468ac852-339e-43b7-8e94-7e2ce475cb00</xsl:when>
        <xsl:when test=".='tld'">af09f37e-12f5-46db-a532-ccd6a8877f2d</xsl:when>
        <xsl:when test=".='tlp'">3ed655b0-505b-43fe-a4c6-397789449a5b</xsl:when>
        <xsl:when test=".='rsg'">453e4f4a-cda9-4cfa-b93d-3faeb18a85db</xsl:when>
        <xsl:when test=".='cli'">ec0959b3-becc-4abd-87b0-3e02cf2665cc</xsl:when>
        <xsl:when test=".='cll'">8999f7cb-6d9a-4be7-aeed-4cc6aae35a8c</xsl:when>
        <xsl:when test=".='lbt'">6d5779a3-e692-4a24-a5ee-d1ce8a6eae47</xsl:when>
        <xsl:when test=".='rce'">ab7a95da-590c-4955-b03b-9d8fbc6c1fe6</xsl:when>
        <xsl:when test=".='coe'">9945290f-bcd7-4515-81fd-09e23567b75d</xsl:when>
        <xsl:when test=".='mod'">e79ca231-af4c-4724-8fe1-eabafd2e0bec</xsl:when>
        <xsl:when test=".='vdg'">c6005151-7005-4ee7-8d6d-a6b72d25377a</xsl:when>
        <xsl:when test=".='asn'">9593efce-a42d-4991-9aad-3a4dc07abb1e</xsl:when>
        <xsl:when test=".='edt'">9deb29d1-3e71-4951-9413-a80adac703d0</xsl:when>
        <xsl:when test=".='rse'">7156fd73-b8ca-4e09-a002-bb2afaaf259a</xsl:when>
        <xsl:when test=".='cng'">2a3e2d58-3a21-4e35-b7e4-cffb197750e3</xsl:when>
        <xsl:when test=".='stl'">a3642006-14ab-4816-b5ac-533e4971417a</xsl:when>
        <xsl:when test=".='app'">ca3b9559-f178-41e8-aa88-6b2c367025f9</xsl:when>
        <xsl:when test=".='ppt'">4f7c335d-a9d9-4f38-87ef-9a5846b63e7f</xsl:when>
        <xsl:when test=".='pro'">81bbe282-dca7-4763-bf5a-fe28c8939988</xsl:when>
        <xsl:when test=".='enj'">61afcb8a-8c53-445b-93b9-38e799721f82</xsl:when>
        <xsl:when test=".='bjd'">acad26a9-e288-4385-bea1-0560bb884b7a</xsl:when>
        <xsl:when test=".='auc'">5c132335-8ad0-47bf-a4d1-6dda0a3a2654</xsl:when>
        <xsl:when test=".='adi'">e2a1a9dc-4aec-4bb5-ae43-99bb0383516a</xsl:when>
        <xsl:when test=".='stm'">b02cbeb7-8ca7-4bf4-8d58-ce943b4d5ea3</xsl:when>
        <xsl:when test=".='rcd'">b388c02a-19dc-4948-916d-3688007b9a2c</xsl:when>
        <xsl:when test=".='lel'">61c9f06f-620a-4423-8c78-c698b9bb555f</xsl:when>
        <xsl:when test=".='prm'">d6a6d28c-1bfc-46df-b2ba-6cb377a6151e</xsl:when>
        <xsl:when test=".='ill'">3add6049-0b63-4fec-9892-e3867e7358e2</xsl:when>
        <xsl:when test=".='pmn'">3cbd0832-328e-48f5-96c4-6f7bcf341461</xsl:when>
        <xsl:when test=".='spn'">38c09577-6652-4281-a391-4caabe4c09b6</xsl:when>
        <xsl:when test=".='prg'">b47d8841-112e-43be-b992-eccb5747eb50</xsl:when>
        <xsl:when test=".='own'">21dda3dc-cebd-4018-8db2-4f6d50ce3d02</xsl:when>
        <xsl:when test=".='itr'">18ba15a9-0502-4fa2-ad41-daab9d5ab7bb</xsl:when>
        <xsl:when test=".='pbd'">2d046e17-742b-4d99-8e25-836cc141fee9</xsl:when>
        <xsl:when test=".='edc'">863e41e3-b9c5-44fb-abeb-a8ab536bb432</xsl:when>
        <xsl:when test=".='sce'">05875ac5-a509-4a51-a6ee-b8051e37c7b0</xsl:when>
        <xsl:when test=".='ldr'">f74dfba3-ea20-471b-8c4f-5d9b7895d3b5</xsl:when>
        <xsl:when test=".='cpe'">6358626f-aa02-4c40-8e73-fb202fa5fb4d</xsl:when>
        <xsl:when test=".='fac'">036b6349-27c8-4b68-8875-79cb8e0fd459</xsl:when>
        <xsl:when test=".='nrt'">2c345cb7-0420-4a7d-93ce-b51fb636cce6</xsl:when>
        <xsl:when test=".='clr'">81c01802-f61b-4548-954a-22aab027f6e5</xsl:when>
        <xsl:when test=".='fld'">2576c328-61f1-4684-83cf-4376a66f7731</xsl:when>
        <xsl:when test=".='cwt'">316cd382-a4fe-4939-b06e-e7199bfdbc7a</xsl:when>
        <xsl:when test=".='rcp'">94e6a5a8-b84f-44f7-b900-71cd10ea954e</xsl:when>
        <xsl:when test=".='pht'">1aae8ca3-4ddd-4549-a769-116b75f3c773</xsl:when>
        <xsl:when test=".='lsa'">3c1508ab-fbcc-4500-b319-10885570fe2f</xsl:when>
        <xsl:when test=".='dfe'">3ebe73f4-0895-4979-a5e3-2b3e9c63acd6</xsl:when>
        <xsl:when test=".='prn'">b318e49c-f2ad-498c-8106-57b5544f9bb0</xsl:when>
        <xsl:when test=".='pte'">45747710-39dc-47ec-b2b3-024d757f997e</xsl:when>
        <xsl:when test=".='cmm'">e0dc043c-0a4d-499b-a8a8-4cc9b0869cf3</xsl:when>
        <xsl:when test=".='uvp'">fec9ae68-6b55-4dd6-9637-3a694fb6a82b</xsl:when>
        <xsl:when test=".='rtm'">54fd209c-d552-43eb-850f-d31f557170b9</xsl:when>
        <xsl:when test=".='dln'">e04bea27-813b-4765-9ba1-e98e0fca7101</xsl:when>
        <xsl:when test=".='srv'">a21a56ea-5136-439a-a513-0bffa53402de</xsl:when>
        <xsl:when test=".='ive'">e7e8fc17-7c97-4a37-8c12-f832ddca7a71</xsl:when>
        <xsl:when test=".='let'">a5c024f1-3c81-492c-ab5e-73d2bc5dcad7</xsl:when>
        <xsl:when test=".='cos'">5aa6e3d1-283c-4f6d-8694-3bdc52137b07</xsl:when>
        <xsl:when test=".='blw'">245cfa8e-8709-4f1f-969b-894b94bc029f</xsl:when>
        <xsl:when test=".='cnd'">a79f874f-319e-4bc8-a2e1-f8b15fa186fe</xsl:when>
        <xsl:when test=".='cte'">f3aa0070-71bd-4c39-9a9b-ec2fd03ac26d</xsl:when>
        <xsl:when test=".='aus'">40fe62fb-4319-4313-ac88-ac4912b1e1fa</xsl:when>
        <xsl:when test=".='lgd'">5e9333a6-bc92-43c0-a306-30811bb71e61</xsl:when>
        <xsl:when test=".='pat'">1b51068c-506a-4b85-a815-175c17932448</xsl:when>
        <xsl:when test=".='lse'">a8d59132-aa1e-4a62-b5bd-b26b7d7a16b9</xsl:when>
        <xsl:when test=".='isb'">97082157-5900-4c4c-a6d8-2e6c13f22ef1</xsl:when>
        <xsl:when test=".='pfr'">f9395f3d-cd46-413e-9504-8756c54f38a2</xsl:when>
        <xsl:when test=".='std'">9e7651f8-a4f0-4d02-81b4-578ef9303d1b</xsl:when>
        <xsl:when test=".='sgd'">c0c46b4f-fd18-4d8a-96ac-aff91662206c</xsl:when>
        <xsl:when test=".='rdd'">fcfc0b86-b083-4ab8-8a75-75a66638ed2e</xsl:when>
        <xsl:when test=".='dnr'">8fbe6e92-87c9-4eff-b736-88cd02571465</xsl:when>
        <xsl:when test=".='clt'">cbceda25-1f4d-43b7-96a5-f2911026a154</xsl:when>
        <xsl:when test=".='adp'">35a3feaf-1c13-4221-8cfa-d6879faf714c</xsl:when>
        <xsl:when test=".='act'">7131e7b8-84fa-48bd-a725-14050be38f9f</xsl:when>
        <xsl:when test=".='pma'">0683aecf-42a8-432d-adb2-a8abaf2f15d5</xsl:when>
        <xsl:when test=".='fmd'">f5f9108a-9afc-4ea9-9b99-4f83dcf51204</xsl:when>
        <xsl:when test=".='med'">a7a25290-226d-4f81-b780-2efc1f7dfd26</xsl:when>
        <xsl:when test=".='rst'">94b839e8-cabe-4d58-8918-8a5058fe5501</xsl:when>
        <xsl:when test=".='cou'">36b921fe-6c34-45c8-908b-5701f0763e1b</xsl:when>
        <xsl:when test=".='ato'">e8b5040d-a5c7-47c1-96ca-6313c8b9c849</xsl:when>
        <xsl:when test=".='prp'">e2b5ceaf-663b-4cc0-91ba-bf036943ece8</xsl:when>
        <xsl:when test=".='hnr'">5c1e0a9e-1fdc-47a5-8d06-c12af63cbc5a</xsl:when>
        <xsl:when test=".='ctr'">28f7eb9e-f923-4a77-9755-7571381b2a47</xsl:when>
        <xsl:when test=".='rpt'">86b9292d-4dce-401d-861e-2df2cfaacb83</xsl:when>
        <xsl:when test=".='dbp'">d5e6972c-9e2f-4788-8dd6-10e859e20945</xsl:when>
        <xsl:when test=".='pan'">003e8b5e-426c-4d33-b940-233b1b89dfbd</xsl:when>
        <xsl:when test=".='wde'">de1ea2dc-8d9d-4dfa-b86e-8ce9d8b0c2f2</xsl:when>
        <xsl:when test=".='bpd'">9e99e803-c73d-4250-8605-403be57f83f9</xsl:when>
        <xsl:when test=".='acp'">c9d28351-c862-433e-8957-c4721f30631f</xsl:when>
        <xsl:when test=".='frg'">06fef928-bd00-4c7f-bd3c-5bc93973f8e8</xsl:when>
        <xsl:when test=".='cns'">756fcbfc-ef95-4bd0-99cc-1cc364c7b0cd</xsl:when>
        <xsl:when test=".='ren'">6b566426-f325-4182-ac31-e1c4e0b2aa19</xsl:when>
        <xsl:when test=".='ilu'">e038262b-25f8-471b-93ea-2afe287b00a3</xsl:when>
        <xsl:when test=".='mus'">08553068-8495-49c2-9c18-d29ab656fef0</xsl:when>
        <xsl:when test=".='wat'">6a983219-b6cd-4dd7-bfa4-bcb0b43590d4</xsl:when>
        <xsl:when test=".='ant'">ced7cdfc-a3e0-47c8-861b-3f558094b02e</xsl:when>
        <xsl:when test=".='dis'">f26858bc-4468-47be-8e30-d5db4c0b1e88</xsl:when>
        <xsl:when test=".='lbr'">e603ffa2-8999-4091-b10d-96248c283c04</xsl:when>
        <xsl:when test=".='edm'">b1e95783-5308-46b2-9853-bd7015c1774b</xsl:when>
        <xsl:when test=".='dfd'">e46bdfe3-5923-4585-bca4-d9d930d41148</xsl:when>
        <xsl:when test=".='fmo'">5c3abceb-6bd8-43aa-b08d-1187ae78b15b</xsl:when>
        <xsl:when test=".='sll'">3179eb17-275e-44f8-8cad-3a9514799bd0</xsl:when>
        <xsl:when test=".='ptf'">2230246a-1fdb-4f06-a08a-004fd4b929bf</xsl:when>
        <xsl:when test=".='tcd'">0efdaf72-6126-430a-8256-69c42ff6866f</xsl:when>
        <xsl:when test=".='cpt'">86890f8f-2273-44e2-aa86-927c7f649b32</xsl:when>
        <xsl:when test=".='cur'">d67decd7-3dbe-4ac7-8072-ef18f5cd3e09</xsl:when>
        <xsl:when test=".='lil'">ae8bc401-47da-4853-9b0b-c7c2c3ec324d</xsl:when>
        <xsl:when test=".='pta'">630142eb-6b68-4cf7-8296-bdaba03b5760</xsl:when>
        <xsl:when test=".='mfp'">a2231628-6a5a-48f4-8eac-7e6b0328f6fe</xsl:when>
        <xsl:when test=".='sec'">12b7418a-0c90-4337-90b7-16d2d3157b68</xsl:when>
        <xsl:when test=".='dto'">0d2580f5-fe16-4d64-a5eb-f0247cccb129</xsl:when>
        <xsl:when test=".='rpy'">cd06cefa-acfe-48cb-a5a3-4c48be4a79ad</xsl:when>
        <xsl:when test=".='cts'">9fc0bffb-6dd9-4218-9a44-81be4a5059d4</xsl:when>
        <xsl:when test=".='wdc'">32021771-311e-497b-9bf2-672492f322c7</xsl:when>
        <xsl:when test=".='rps'">13361ce8-7664-46c0-860d-ffbcc01414e0</xsl:when>
        <xsl:when test=".='dtm'">9d81737c-ec6c-49d8-9771-50e1ab4d7ad7</xsl:when>
        <xsl:when test=".='dsr'">3665d2dd-24cc-4fb4-922a-699811daa41c</xsl:when>
        <xsl:when test=".='aut'">6e09d47d-95e2-4d8a-831b-f777b8ef6d81</xsl:when>
        <xsl:when test=".='jud'">41a0378d-5362-4c1a-b103-592ff354be1c</xsl:when>
        <xsl:when test=".='etr'">6ccd61f4-c408-46ec-b359-a761b4781477</xsl:when>
        <xsl:when test=".='con'">94bb3440-591f-41af-80fa-e124006faa49</xsl:when>
        <xsl:when test=".='org'">539872f1-f4a1-4e83-9d87-da235f64c520</xsl:when>
        <xsl:when test=".='wac'">bf1a8165-54bf-411c-a5ea-b6bbbb9c55df</xsl:when>
        <xsl:when test=".='osp'">563bcaa7-7fe1-4206-8fc9-5ef8c7fbf998</xsl:when>
        <xsl:when test=".='scl'">223da16e-5a03-4f5c-b8c3-0eb79f662bcb</xsl:when>
        <xsl:when test=".='spk'">ac0baeb5-71e2-435f-aaf1-14b64e2ba700</xsl:when>
        <xsl:when test=".='ape'">f0061c4b-df42-432f-9d1a-3873bb27c8e6</xsl:when>
        <xsl:when test=".='prf'">246858e3-4022-4991-9f1c-50901ccc1438</xsl:when>
        <xsl:when test=".='bdd'">5f27fcc6-4134-4916-afb8-fcbcfb6793d4</xsl:when>
        <xsl:when test=".='wst'">7c5c2fd5-3283-4f96-be89-3bb3e8fa6942</xsl:when>
        <xsl:when test=".='prv'">3b4709f1-5286-4c42-9423-4620fff78141</xsl:when>
        <xsl:when test=".='brd'">55e4a59b-2dfd-478d-9fe9-110fc24f0752</xsl:when>
        <xsl:when test=".='jug'">b76cb226-50f9-4d34-a3d0-48b475f83c80</xsl:when>
        <xsl:when test=".='len'">e4f2fd1c-ee79-4cf7-bc1a-fbaac616f804</xsl:when>
        <xsl:when test=".='mtk'">002c0eef-eb77-4c0b-a38e-117a09773d59</xsl:when>
        <xsl:when test=".='cmp'">901d01e5-66b1-48f0-99f9-b5e92e3d2d15</xsl:when>
        <xsl:when test=".='wit'">ec56cc25-e470-46f7-a429-72f438c0513b</xsl:when>
        <xsl:when test=".='mte'">8af7e981-65f9-4407-80ae-1bacd11315d5</xsl:when>
        <xsl:when test=".='ann'">06b2cbd8-66bf-4956-9d90-97c9776365a4</xsl:when>
        <xsl:when test=".='lso'">99f6b0b7-c22f-460d-afe0-ee0877bc66d1</xsl:when>
        <xsl:when test=".='ins'">f6bd4f15-4715-4b0e-9258-61dac047f106</xsl:when>
        <xsl:when test=".='pra'">08cb225a-302c-4d5a-a6a3-fa90850babcd</xsl:when>
        <xsl:when test=".='rsp'">3c3ab522-2600-4b93-a121-8832146d5cdf</xsl:when>
        <xsl:when test=".='lee'">88a66ebf-0b18-4ed7-91e5-01bc7e8de441</xsl:when>
        <xsl:when test=".='chr'">593862b4-a655-47c3-92b9-2b305b14cce7</xsl:when>
        <xsl:when test=".='ctb'">9f0a2cf0-7a9b-45a2-a403-f68d2850d07c</xsl:when>
        <xsl:when test=".='exp'">764c208a-493f-43af-8db7-3dd48efca45c</xsl:when>
        <xsl:when test=".='tch'">f72a24d1-f404-4275-9350-158fe3a20b21</xsl:when>
        <xsl:when test=".='dst'">7b21bffb-91e1-45bf-980a-40dd89cc26e4</xsl:when>
        <xsl:when test=".='ptt'">68dcc037-901e-46a9-9b4e-028548cd750f</xsl:when>
        <xsl:when test=".='dpt'">7c62ecb4-544c-4c26-8765-f6f6d34031a0</xsl:when>
        <xsl:when test=".='mrk'">168b6ff3-7482-4fd0-bf07-48172b47876c</xsl:when>
        <xsl:when test=".='ivr'">eecb30c5-a061-4790-8fa5-cf24d0fa472b</xsl:when>
        <xsl:when test=".='fpy'">26ad4833-5d49-4999-97fc-44bc86a9fae0</xsl:when>
        <xsl:when test=".='scr'">867f3d13-779a-454e-8a06-a1b9fb37ba2a</xsl:when>
        <xsl:when test=".='orm'">df7daf2f-7ab4-4c7b-a24d-d46695fa9072</xsl:when>
        <xsl:when test=".='ths'">cce475f7-ccfa-4e15-adf8-39f907788515</xsl:when>
        <xsl:when test=".='evp'">54f69767-5712-47aa-bdb7-39c31aa8295e</xsl:when>
        <xsl:when test=".='elt'">201a378e-23dd-4aab-bfe0-e5bc3c855f9c</xsl:when>
        <xsl:when test=".='eng'">366821b5-5319-4888-8867-0ffb2d7649d1</xsl:when>
        <xsl:when test=".='aui'">1f20d444-79f6-497a-ae0d-98a92e504c58</xsl:when>
        <xsl:when test=".='bkd'">846ac49c-749d-49fd-a05f-e7f2885d9eaf</xsl:when>
        <xsl:when test=".='sng'">6847c9ab-e2f8-4c9e-8dc6-1a97c6836c1c</xsl:when>
        <xsl:when test=".='aud'">4b41e752-3646-4097-ae80-21fd02e913f7</xsl:when>
        <xsl:when test=".='sad'">c5988fb2-cd21-469c-b35e-37e443c01adc</xsl:when>
        <xsl:when test=".='red'">b38c4e20-9aa0-43f4-a1a0-f547e54873f7</xsl:when>
        <xsl:when test=".='rev'">85962960-ef07-499d-bf49-63f137204f9a</xsl:when>
        <xsl:when test=".='dft'">c86fc16d-61d8-4471-8089-76550daa04f0</xsl:when>
        <xsl:when test=".='fmk'">2129a478-c55c-4f71-9cd1-584cbbb381d4</xsl:when>
        <xsl:when test=".='prt'">02c1c664-1d71-4f7b-a656-1abf1209848f</xsl:when>
        <xsl:when test=".='wpr'">115fa75c-385b-4a8e-9a2b-b13de9f21bcf</xsl:when>
        <xsl:when test=".='anm'">b998a229-68e7-4a3d-8cfd-b73c10844e96</xsl:when>
        <xsl:when test=".='csl'">c04ff362-c80a-4543-88cf-fc6e49e7d201</xsl:when>
        <xsl:when test=".='stn'">94d131ef-2814-49a0-a59c-49b6e7584b3d</xsl:when>
        <xsl:when test=".='plt'">d30f5556-6d79-4980-9528-c48ef60f3b31</xsl:when>
        <xsl:when test=".='sds'">1c623f6e-25bf-41ec-8110-6bde712dfa79</xsl:when>
        <xsl:when test=".='sht'">206246b1-8e17-4588-bad8-78c82e3e6d54</xsl:when>
        <xsl:when test=".='dnc'">3bd0b539-4440-4971-988c-5330daa14e3a</xsl:when>
        <xsl:when test=".='dgs'">825a7d9f-7596-4007-9684-9bee72625cfc</xsl:when>
        <xsl:when test=".='flm'">22f8ea20-b4f0-4498-8125-7962f0037c2d</xsl:when>
        <xsl:when test=".='vac'">1ce93f32-3e10-46e2-943f-77f3c8a41d7d</xsl:when>
        <xsl:when test=".='cor'">8ddb69bb-cd69-4898-a62d-b71649089e4a</xsl:when>
        <xsl:when test=".='asg'">ad9b7785-53a2-4bf4-8a01-572858e82941</xsl:when>
        <xsl:when test=".='cre'">7aac64ab-7f2a-4019-9705-e07133e3ad1a</xsl:when>
        <xsl:when test=".='art'">f9e5b41b-8d5b-47d3-91d0-ca9004796337</xsl:when>
        <xsl:when test=".='ltg'">2b45c004-805d-4e7f-864d-8664a23488dc</xsl:when>
        <xsl:when test=".='dgg'">6901fbf1-c038-42eb-a03e-cd65bf91f660</xsl:when>
        <xsl:when test=".='cpl'">8f9d96f5-32ad-43d7-8122-18063a617fc8</xsl:when>
        <xsl:when test=".='rbr'">0d022d0d-902d-4273-8013-0a2a753d9d76</xsl:when>
        <xsl:when test=".='rpc'">c96df2ce-7b00-498a-bf37-3011f3ef1229</xsl:when>
        <xsl:when test=".='fmp'">2665431e-aad4-44d1-9218-04053d1cfd53</xsl:when>
        <xsl:when test=".='trc'">0eef1c70-bd77-429c-a790-48a8d82b4d8f</xsl:when>
        <xsl:when test=".='msd'">e1edbaae-5365-4fcb-bb6a-7aae38bbed9c</xsl:when>
        <xsl:when test=".='cot'">0ad74d5d-03b9-49bb-b9df-d692945ca66e</xsl:when>
        <xsl:when test=".='pup'">2c9cd812-7b00-47e8-81e5-1711f3b6fe38</xsl:when>
        <xsl:when test=".='mcp'">66bfc19c-eeb0-4167-bd8d-448311aab929</xsl:when>
        <xsl:when test=".='mon'">d2df2901-fac7-45e1-a9ad-7a67b70ea65b</xsl:when>
        <xsl:when test=".='crp'">319cb290-a549-4ae8-a0ed-a65fe155cac8</xsl:when>
        <xsl:when test=".='opn'">300171aa-95e1-45b0-86c6-2855fcaf9ef4</xsl:when>
        <xsl:when test=".='cmt'">c7345998-fd17-406b-bce0-e08cb7b2671f</xsl:when>
        <xsl:when test=".='ppm'">e38a0c64-f1d3-4b03-a364-34d6b402841c</xsl:when>
        <xsl:when test=".='tyg'">58461dca-efd4-4fd4-b380-d033e3540be5</xsl:when>
        <xsl:when test=".='win'">53f075e1-53c0-423f-95ae-676df3d8c7a2</xsl:when>
        <xsl:when test=".='pdr'">097adac4-6576-4152-ace8-08fc59cb0218</xsl:when>
        <xsl:when test=".='gis'">369783f6-78c8-4cd7-97ab-5029444e0c85</xsl:when>
        <xsl:when test=".='crr'">c8050073-f62b-4606-9688-02caa98bdc60</xsl:when>
        <xsl:when test=".='cst'">e1510ac5-a9e9-4195-b762-7cb82c5357c4</xsl:when>
        <xsl:when test=".='stg'">3e86cb67-5407-4622-a540-71a978899404</xsl:when>
        <xsl:when test=".='mrb'">515caf91-3dde-4769-b784-50c9e23400d5</xsl:when>
        <xsl:when test=".='dub'">88370fc3-bf69-45b6-b518-daf9a3877385</xsl:when>
        <xsl:when test=".='aqt'">57247637-c41b-498d-9c46-935469335485</xsl:when>
        <xsl:when test=".='oth'">361f4bfd-a87d-463c-84d8-69346c3082f6</xsl:when>
        <xsl:otherwise>361f4bfd-a87d-463c-84d8-69346c3082f6</xsl:otherwise> <!-- oth -->
      </xsl:choose>
    </contributorTypeId>
  </xsl:template>

  <!-- Map instance statuses -->
  <!-- Level 0: hebis-wide (=K10pus) except for Cataloged/Uncataloged (FOLIO) -->

<!--
  <xsl:template match="statusId"> 
    <statusId>
    <xsl:choose>
      <xsl:when test=".='Cataloged'">9634a5ab-9228-4703-baf2-4d12ebc77d56</xsl:when>
      <xsl:when test=".='Uncataloged'">26f5208e-110a-4394-be29-1569a8c84a65</xsl:when>
      <xsl:when test=".='Autopsie'"><xsl:text>bac08adf-98ef-44ee-8e8a-ab76128c92c1</xsl:text></xsl:when>
      <xsl:when test=".='Bibliografisch vollständig'"><xsl:text>8bc58a74-b04e-45a4-8c5d-64568a5f0d55</xsl:text></xsl:when>
      <xsl:when test=".='Erwerbungsdatensatz'"><xsl:text>5dc8b06f-6b85-4a64-9825-811d5c0660a8</xsl:text></xsl:when>
      <xsl:when test=".='Datensatz für internen Gebrauch'"><xsl:text>3f378ff8-a474-4232-85b1-977650abba83</xsl:text></xsl:when>
      <xsl:when test=".='Lösch-Status'"><xsl:text>287f32a7-434b-4a89-a7f3-d12c8d6bf81c</xsl:text></xsl:when>
      <xsl:when test=".='Maschinell konvertierte Daten'"><xsl:text>e1700e6a-f606-4464-a9af-f0849890f17e</xsl:text></xsl:when>
      <xsl:when test=".='Katalogisat ohne Autopsie'"><xsl:text>8867ba26-c5da-4a5d-851d-976429f83a45</xsl:text></xsl:when>
      <xsl:when test=".='Verwaltungsdatensatz'"><xsl:text>07ae89f4-e760-421a-8c74-c69f643881dc</xsl:text></xsl:when>
      <xsl:when test=".='Fremddatensatz'"><xsl:text>449a7305-0bfc-434d-ba93-1ce916f706b1</xsl:text></xsl:when>
      <xsl:when test=".='Katalogisat nach Autopsie im Vorläufigkeitsstatus'"><xsl:text>0c81eb93-f2f1-477a-9bbb-a0b18b094f8f</xsl:text></xsl:when>
      <xsl:when test=".='Maschinelle Einspielung, möglicherweise dublett'"><xsl:text>b7ca8a3f-e818-4253-8461-55f198eaf101</xsl:text></xsl:when>
      <xsl:when test=".='Zunächst verdeckt eingespieltes Novum'"><xsl:text>c8678080-990d-4633-95cb-56d06bbf108f</xsl:text></xsl:when>
      <xsl:when test=".='Inhalt oder Struktur ist zu überprüfen'"><xsl:text>775bdbe0-ba63-4d51-aa78-04b2ee81bd27</xsl:text></xsl:when>
    </xsl:choose>
    </statusId>
  </xsl:template>
-->


  <!-- Map identifier types -->
  <xsl:template match="identifierTypeId"> <!-- Level 0: FOLIO + hebis-wide (=K10plus) -->
    <identifierTypeId>
      <xsl:choose>
        <xsl:when test=".='Cancelled GPO item number'">5069054d-bc3a-4212-a4e8-e2013a02386f</xsl:when>
        <xsl:when test=".='Standard technical report number'">8e3dd25e-db82-4b06-8311-90d41998c109</xsl:when>
        <xsl:when test=".='CODEN'">593b78cb-32f3-44d1-ba8c-63fd5e6989e6</xsl:when>
        <xsl:when test=".='Report number'">37b65e79-0392-450d-adc6-e2a1f47de452</xsl:when>
        <xsl:when test=".='URN'">eb7b2717-f149-4fec-81a3-deefb8f5ee6b</xsl:when>
        <xsl:when test=".='GPO item number'">351ebc1c-3aae-4825-8765-c6d50dbf011f</xsl:when>
        <xsl:when test=".='DOI'">39554f54-d0bb-4f0a-89a4-e422f6136316</xsl:when>
        <xsl:when test=".='System control number'">7e591197-f335-4afb-bc6d-a6d76ca3bace</xsl:when>
        <xsl:when test=".='ISBN'">8261054f-be78-422d-bd51-4ed9f33c3422</xsl:when>
        <xsl:when test=".='StEdNL'">3fbacad6-0240-4823-bce8-bb122cfdf229</xsl:when>
        <xsl:when test=".='Control number'">5d164f4b-0b15-4e42-ae75-cfcf85318ad9</xsl:when>
        <xsl:when test=".='LCCN'">c858e4f2-2b6b-4385-842b-60732ee14abb</xsl:when>
        <xsl:when test=".='Invalid ISBN'">fcca2643-406a-482a-b760-7a7f8aec640e</xsl:when>
        <xsl:when test=".='OCLC'">439bfbae-75bc-4f74-9fc7-b2a2d47ce3ef</xsl:when>
        <xsl:when test=".='ISSN'">913300b2-03ed-469a-8179-c1092c991227</xsl:when>
        <xsl:when test=".='Handle'">216b156b-215e-4839-a53e-ade35cb5702a</xsl:when>
        <xsl:when test=".='Local identifier'">5130aed5-1095-4fb6-8f6f-caa3d6cc7aae</xsl:when>
        <xsl:when test=".='UkMac'">650ef996-35e3-48ec-bf3a-a0d078a0ca37</xsl:when>
        <xsl:when test=".='ASIN'">7f907515-a1bf-4513-8a38-92e1a07c539d</xsl:when>
        <xsl:when test=".='Invalid ISSN'">27fd35a6-b8f6-41f2-aa0e-9c663ceb250c</xsl:when>
        <xsl:when test=".='Linking ISSN'">5860f255-a27f-4916-a830-262aa900a6b9</xsl:when>
        <xsl:when test=".='Publisher or distributor number'">b5d8cdc4-9441-487c-90cf-0c7ec97728eb</xsl:when>
        <xsl:when test=".='BNB'">3187432f-9434-40a8-8782-35a111a1491e</xsl:when>
        <xsl:when test=".='GBV Number'"><xsl:text>e133d384-332d-11ea-a8a4-ff796e46a18d</xsl:text></xsl:when>
        <xsl:when test=".='PPN'"><xsl:text>1d5cb40c-508f-451b-8952-87c92be4255a</xsl:text></xsl:when>
        <xsl:when test=".='PPN SWB'"><xsl:text>6048004e-75bc-11ea-8ddd-5a780fe0d4e4</xsl:text></xsl:when>
        <xsl:when test=".='DNB-Nummer'"><xsl:text>63fd8fa0-a939-4d1e-869c-6dcc24c9d507</xsl:text></xsl:when>
        <xsl:when test=".='Autorisierte ISSN'"><xsl:text>c90b1f32-0ad9-46fc-9bf6-98c79a966844</xsl:text></xsl:when>
        <xsl:when test=".='Fehlerhafte ISSN der parallelen Ausgabe'"><xsl:text>5626dbb7-a0b6-4722-905b-5a1f34f69fea</xsl:text></xsl:when>
        <xsl:when test=".='Formal falsche ISBN der Sekundärausgabe'"><xsl:text>60392328-7874-4dfa-91dc-7b56444c46f0</xsl:text></xsl:when>
        <xsl:when test=".='Formal falsche ISMN'"><xsl:text>08dbec41-c94d-48f4-92e2-18044e83259f</xsl:text></xsl:when>
        <xsl:when test=".='Identnummer der erstkatalogisierenden Institution'"><xsl:text>8e33c1be-e2c4-43ac-a975-8fb50f71137a</xsl:text></xsl:when>
        <xsl:when test=".='ISBN der parallelen Ausgabe auf einem anderen Datenträger'"><xsl:text>cfbf1033-2809-44e3-b4a1-25ad2fc703d3</xsl:text></xsl:when>
        <xsl:when test=".='ISBN der parallelen Ausgabe im Fernzugriff'"><xsl:text>a9ed691a-8773-4ece-88d1-c9703ab11e44</xsl:text></xsl:when>
        <xsl:when test=".='ISBN der parallelen Druckausgabe'"><xsl:text>d9f789b1-69f2-4992-8b5f-fde5d0c75d59</xsl:text></xsl:when>
        <xsl:when test=".='ISBN der Sekundärausgabe'"><xsl:text>b99408a2-5116-4ae1-a16e-d379731d8814</xsl:text></xsl:when>
        <xsl:when test=".='ISBN einer Manifestation in anderer physischer Form'"><xsl:text>55feb40b-0de9-461b-8c34-3b638164ea6c</xsl:text></xsl:when>
        <xsl:when test=".='ISBN für parallele Ausgabe in einer anderen physischen Form'"><xsl:text>243e86bb-3192-4e6d-b58d-dc9bb4e26651</xsl:text></xsl:when>
        <xsl:when test=".='ISMN'"><xsl:text>ce741fff-9dc7-4ebb-9a28-8c5174c3a962</xsl:text></xsl:when>
        <xsl:when test=".='ISRN'"><xsl:text>22a144d5-0e43-4c71-b6f7-aac4ff6b9d3e</xsl:text></xsl:when>
        <xsl:when test=".='ISSN für parallele Ausgaben auf einem anderen Datenträger'"><xsl:text>2c4d47a4-d776-469e-9514-05d1faca89b8</xsl:text></xsl:when>
        <xsl:when test=".='ISSN für parallele Ausgaben im Fernzugriff'"><xsl:text>45ea57d6-9595-4fcf-bdd4-8339418a1553</xsl:text></xsl:when>
        <xsl:when test=".='ISSN für parallele Druckausgaben'"><xsl:text>27e37c19-c77f-4452-bfe8-a05f6e3a4af4</xsl:text></xsl:when>
        <xsl:when test=".='ISSN paralleler Ausgaben'"><xsl:text>1e4fb6ec-8fca-4bd3-ab21-2021a5f0e28a</xsl:text></xsl:when>
<!--    <xsl:when test=".='Produktsigel Gesamtpaket'"><xsl:text>0bb41e81-86b8-4d31-a578-17745b06b9fb</xsl:text></xsl:when> -->
        <xsl:when test=".='Produktsigel, Arbeitsfeld für sonstige Produktsigel'"><xsl:text>6966e5f6-efaf-4378-86f1-7863ae1ecc6c</xsl:text></xsl:when>
        <xsl:when test=".='Digital Object Identifier (DOI) im Druckwerk'"><xsl:text>91b2bf6d-6d14-4c2e-9a26-b8fee9a0a14a</xsl:text></xsl:when>
        <xsl:when test=".='SWB-OCLC-Nummer'"><xsl:text>da3478c6-efa1-4fcb-a914-fde46a170c82</xsl:text></xsl:when>
        <xsl:when test=".='CIP-Nummer'"><xsl:text>aaeec26d-72e9-4952-b59e-86bd9fbfedd3</xsl:text></xsl:when>
        <xsl:when test=".='WV-Nummer'"><xsl:text>217a56e1-5e45-4253-b942-d2199cca183e</xsl:text></xsl:when>
        <xsl:when test=".='ZDB-Nummer'"><xsl:text>7d09e4a5-31c9-43de-9b07-e02cf0e49252</xsl:text></xsl:when>
        <xsl:when test=".='SWB-PPN des umgelenkten Satzes'"><xsl:text>076b9fed-7957-4b11-b8ac-0fe368939cbe</xsl:text></xsl:when>
        <xsl:when test=".='Weitere Verbundidentnummern'"><xsl:text>24f03461-e76a-49cb-baba-8f5dd505bac4</xsl:text></xsl:when>
        <xsl:when test=".='Identnummern weiterer Fremddatenlieferanten'"><xsl:text>623d4545-073d-456f-9173-07116107bf0a</xsl:text></xsl:when>
        <xsl:when test=".='PPN des umgelenkten GBV- bzw. K10plus-Satzes'"><xsl:text>1035a102-9fdd-4556-9efd-bf9308e035f6</xsl:text></xsl:when>
        <xsl:when test=".='Swets-Nummer'"><xsl:text>8334b288-2235-41d1-bcf2-a943255ff12c</xsl:text></xsl:when>
        <xsl:when test=".='VD16-Nummer'"><xsl:text>ba9fb70d-a6bc-4eb9-9693-0a86bc9adc9c</xsl:text></xsl:when>
        <xsl:when test=".='VD17-Nummer'"><xsl:text>f3b48441-336e-46da-9d34-5a97a12dfb84</xsl:text></xsl:when>
        <xsl:when test=".='VD18-Nummer'"><xsl:text>1cfbd85f-4744-4107-8f8c-22f65fcef077</xsl:text></xsl:when>
        <xsl:when test=".='Sonstige Standardnummern'"><xsl:text>6660c49d-a70e-4fcc-ae09-aaedb5bf92e5</xsl:text></xsl:when>
        <xsl:when test=".='Identnummern (allgemein)'"><xsl:text>920062a7-384a-4150-8573-4b6f15a992d6</xsl:text></xsl:when>
        <xsl:when test=".='GTIN (vormals EAN)'"><xsl:text>7836bced-1d36-4ee0-b263-5d63db38676a</xsl:text></xsl:when>
        <xsl:when test=".='Universal Product Code (UPC)'"><xsl:text>0b9e3fe0-7452-445f-8696-e39f9f48ace3</xsl:text></xsl:when>
        <xsl:when test=".='Verlags-, Produktions- und Bestellnummer'"><xsl:text>e0f6787d-a556-4d03-9850-e60c5a2baec1</xsl:text></xsl:when>
        <xsl:when test=".='Other standard identifier'">2e8b3b6c-0e7d-4e48-bca2-b0b23b376af5</xsl:when>
        <xsl:otherwise>2e8b3b6c-0e7d-4e48-bca2-b0b23b376af5</xsl:otherwise> <!-- Other standard identifier -->
      </xsl:choose>
    </identifierTypeId>
  </xsl:template>
  
  <!-- Map classification types -->
  <xsl:template match="classificationTypeId"> <!-- Level 1: ILN-specific  -->
    <classificationTypeId>
    <xsl:choose>
      <xsl:when test=".='Lokale Klassifikation'">720a846a-85db-4d3a-bfd9-7dfd2f55ae4a</xsl:when>
    </xsl:choose>
    </classificationTypeId>
  </xsl:template>

  <!-- Map holdings types -->
  <xsl:template match="holdingsTypeId"> <!-- Level 0: FOLIO -->
    <holdingsTypeId>
      <xsl:choose>
        <xsl:when test=".='electronic'">996f93e2-5b5e-4cf2-9168-33ced1f95eed</xsl:when>
        <xsl:when test=".='physical'">0c422f92-0f4d-4d32-8cbe-390ebc33a3e5</xsl:when>
      </xsl:choose>
    </holdingsTypeId>
  </xsl:template>

  <!-- Map holdings source -->
  <xsl:template match="sourceId"> <!-- Level 2: hebis-wide -->
    <sourceId>
      <xsl:choose>
        <xsl:when test=".='hebis'"><xsl:text>ed96edb1-d91d-4a31-9c40-006f5199d782</xsl:text></xsl:when> <!-- hebis wide -->
        <xsl:otherwise>f32d531e-df79-46b3-8932-cdd35f7a2264</xsl:otherwise> <!-- FOLIO -->
      </xsl:choose>
    </sourceId>
  </xsl:template>

  <!-- Map instance types -->
  <xsl:template match="instanceTypeId">
    <instanceTypeId>
      <xsl:choose>
        <xsl:when test=".='Kartografischer Datensatz'">3363cdb1-e644-446c-82a4-dc3a1d4395b9</xsl:when>
        <xsl:when test=".='Kartografisches Bild'">526aa04d-9289-4511-8866-349299592c18</xsl:when>
        <xsl:when test=".='Kartografisches bewegtes Bild'">80c0c134-0240-4b63-99d0-6ca755d5f433</xsl:when>
        <xsl:when test=".='Kartografisches taktiles Bild'">408f82f0-e612-4977-96a1-02076229e312</xsl:when>
        <xsl:when test=".='Kartografische taktile dreidimensionale Form'">e5136fa2-1f19-4581-b005-6e007a940ca8</xsl:when>
        <xsl:when test=".='Kartografische dreidimensionale Form'">2022aa2e-bdde-4dc4-90bc-115e8894b8b3</xsl:when>
        <xsl:when test=".='Computerdaten'">df5dddff-9c30-4507-8b82-119ff972d4d7</xsl:when>
        <xsl:when test=".='Computerprogramm'">c208544b-9e28-44fa-a13c-f4093d72f798</xsl:when>
        <xsl:when test=".='Bewegungsnotation'">fbe264b5-69aa-4b7c-a230-3b53337f6440</xsl:when>
        <xsl:when test=".='Noten'">497b5090-3da2-486c-b57f-de5bb3c2e26d</xsl:when>
        <xsl:when test=".='Aufgeführte Musik'">3be24c14-3551-4180-9292-26a786649c8b</xsl:when>
        <xsl:when test=".='Geräusche'">9bce18bd-45bf-4949-8fa8-63163e4b7d7f</xsl:when>
        <xsl:when test=".='Gesprochenes Wort'">c7f7446f-4642-4d97-88c9-55bae2ad6c7f</xsl:when>
        <xsl:when test=".='Unbewegtes Bild'">535e3160-763a-42f9-b0c0-d8ed7df6e2a2</xsl:when>
        <xsl:when test=".='Taktiles Bild'">efe2e89b-0525-4535-aa9b-3ff1a131189e</xsl:when>
        <xsl:when test=".='Taktile Bewegungsnotation'">e6a278fb-565a-4296-a7c5-8eb63d259522</xsl:when>
        <xsl:when test=".='Taktile Noten'">a67e00fd-dcce-42a9-9e75-fd654ec31e89</xsl:when>
        <xsl:when test=".='Taktiler Text'">8105bd44-e7bd-487e-a8f2-b804a361d92f</xsl:when>
        <xsl:when test=".='Taktile dreidimensionale Form'">82689e16-629d-47f7-94b5-d89736cf11f2</xsl:when>
        <xsl:when test=".='Text'">6312d172-f0cf-40f6-b27d-9fa8feaf332f</xsl:when>
        <xsl:when test=".='Dreidimensionale Form'">c1e95c2b-4efc-48cf-9e71-edb622cf0c22</xsl:when>
        <xsl:when test=".='Dreidimensionales bewegtes Bild'">3e3039b7-fda0-4ac4-885a-022d457cb99c</xsl:when>
        <xsl:when test=".='Zweidimensionales bewegtes Bild'">225faa14-f9bf-4ecd-990d-69433c912434</xsl:when>
        <xsl:when test=".='Nicht spezifiziert'">30fffe0e-e985-4144-b2e2-1e8179bdb41f</xsl:when>
        <xsl:when test=".='Sonstige'">a2c91e87-6bab-44d6-8adb-1fd02481fc4f</xsl:when>
        <xsl:otherwise>30fffe0e-e985-4144-b2e2-1e8179bdb41f</xsl:otherwise>
      </xsl:choose>
    </instanceTypeId>
  </xsl:template>

  <!-- Map issuance modes -->
  <xsl:template match="modeOfIssuanceId">
    <modeOfIssuanceId>
      <xsl:choose>
        <xsl:when test=".='integrierende Ressource'">4fc0f4fe-06fd-490a-a078-c4da1754e03a</xsl:when>
        <xsl:when test=".='mehrteilige Monografie'">f5cc2ab6-bb92-4cab-b83f-5a3d09261a41</xsl:when>
        <xsl:when test=".='fortlaufende Ressource'">068b5344-e2a6-40df-9186-1829e13cd344</xsl:when>
        <xsl:when test=".='nicht spezifiziert'">612bbd3d-c16b-4bfb-8517-2afafc60204a</xsl:when>
        <xsl:otherwise>9d18a02f-5897-4c31-9106-c9abb5c7ae8b</xsl:otherwise>
      </xsl:choose>
    </modeOfIssuanceId>
  </xsl:template>

  <!-- Map instance formats -->
  <xsl:template match="instanceFormatIds/arr/i">
    <i>
      <xsl:choose>
        <xsl:when test=".='Audio - Audio Belt'">0d9b1c3d-2d13-4f18-9472-cc1b91bf1752</xsl:when>
        <xsl:when test=".='Audio - Audiocartridge'">5642320a-2ab9-475c-8ca2-4af7551cf296</xsl:when>
        <xsl:when test=".='Audio - Audiokassette'">6d749f00-97bd-4eab-9828-57167558f514</xsl:when>
        <xsl:when test=".='Audio - Phonographenzylinder'">485e3e1d-9f46-42b6-8c65-6bb7bd4b37f8</xsl:when>
        <xsl:when test=".='Audio - Audiodisk'">5cb91d15-96b1-4b8a-bf60-ec310538da66</xsl:when>
        <xsl:when test=".='Audio - Notenrolle'">7fde4e21-00b5-4de4-a90a-08a84a601aeb</xsl:when>
        <xsl:when test=".='Audio - Tonbandspule'">7612aa96-61a6-41bd-8ed2-ff1688e794e1</xsl:when>
        <xsl:when test=".='Audio - Audio Wire Reel'">6a679992-b37e-4b57-b6ea-96be6b51d2b4</xsl:when>
        <xsl:when test=".='Audio - Sonstige'">a3549b8c-3282-4a14-9ec3-c1cf294043b9</xsl:when>
        <xsl:when test=".='Audio - Tonspurspule'">5bfb7b4f-9cd5-4577-a364-f95352146a56</xsl:when>
        <xsl:when test=".='Computermedien - Speicherkarte'">549e3381-7d49-44f6-8232-37af1cb5ecf3</xsl:when>
        <xsl:when test=".='Computermedien - Computerchip-Cartridge'">88f58dc0-4243-4c6b-8321-70244ff34a83</xsl:when>
        <xsl:when test=".='Computermedien - Computerdisk'">ac9de2b9-0914-4a54-8805-463686a5489e</xsl:when>
        <xsl:when test=".='Computermedien - Computerdisk-Cartridge'">e05f2613-05df-4b4d-9292-2ee9aa778ecc</xsl:when>
        <xsl:when test=".='Computermedien - Magnetbandcartridge'">f4f30334-568b-4dd2-88b5-db8401607daf</xsl:when>
        <xsl:when test=".='Computermedien - Magnetbandkassette'">e5aeb29a-cf0a-4d97-8c39-7756c10d423c</xsl:when>
        <xsl:when test=".='Computermedien - Magnetbandspule'">d16b19d1-507f-4a22-bb8a-b3f713a73221</xsl:when>
        <xsl:when test=".='Computermedien - Online-Ressource'">f5e8210f-7640-459b-a71f-552567f92369</xsl:when>
        <xsl:when test=".='Computermedien - Sonstige'">fe1b9adb-e0cf-4e05-905f-ce9986279404</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofilmlochkarte'">cb3004a3-2a85-4ed4-8084-409f93d6d8ba</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofiche'">fc3e32a0-9c85-4454-a42e-39fca788a7dc</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofichekassette'">b72e66e2-d946-4b01-a696-8fab07051ff8</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofilm-Cartridge'">fc9bfed9-2cb0-465f-8758-33af5bba750b</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofilmkassette'">b71e5ec6-a15d-4261-baf9-aea6be7af15b</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofilmspule'">7bfe7e83-d4aa-46d1-b2a9-f612b18d11f4</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofilmrolle'">cb96199a-21fb-4f11-b003-99291d8c9752</xsl:when>
        <xsl:when test=".='Mikroform - Mikrofilmstreifen'">33009ba2-b742-4aab-b592-68b27451e94f</xsl:when>
        <xsl:when test=".='Mikroform - Lichtundurchlässiger Mikrofiche'">788aa9a6-5f0b-4c52-957b-998266ee3bd3</xsl:when>
        <xsl:when test=".='Mikroform - Sonstige'">a0f2612b-f24f-4dc8-a139-89c3da5a38f1</xsl:when>
        <xsl:when test=".='Mikroskopisch - Objektträger'">b1c69d78-4afb-4d8b-9624-8b3cfa5288ad</xsl:when>
        <xsl:when test=".='Mikroskopisch - Sonstige'">55d3b8aa-304e-4967-8b78-55926d7809ac</xsl:when>
        <xsl:when test=".='Projizierbar - Filmdose'">6bf2154b-df6e-4f11-97d0-6541231ac2be</xsl:when>
        <xsl:when test=".='Projizierbar - Filmkassette'">47b226c0-853c-40f4-ba2e-2bd5ba82b665</xsl:when>
        <xsl:when test=".='Projizierbar - Filmspule'">55a66581-3921-4b50-9981-4fe53bf35e7f</xsl:when>
        <xsl:when test=".='Projizierbar - Filmrolle'">f0e689e8-e62d-4aac-b1c1-198ac9114aca</xsl:when>
        <xsl:when test=".='Projizierbar - Filmstreifen'">53f44ae4-167b-4cc2-9a63-4375c0ad9f58</xsl:when>
        <xsl:when test=".='Projizierbar - Filmstreifen für Einzelbildvorführung'">8e04d356-2645-4f97-8de8-9721cf11ccef</xsl:when>
        <xsl:when test=".='Projizierbar - Filmstreifen-Cartridge'">f7107ab3-9c09-4bcb-a637-368f39e0b140</xsl:when>
        <xsl:when test=".='Projizierbar - Sonstige'">9166e7c9-7edb-4180-b57e-e495f551297f</xsl:when>
        <xsl:when test=".='Projizierbar - Overheadfolie'">eb860cea-b842-4a8b-ab8d-0739856f0c2c</xsl:when>
        <xsl:when test=".='Projizierbar - Dia'">b2b39d2f-856b-4419-93d3-ed1851f91b9f</xsl:when>
        <xsl:when test=".='Stereografisch - Sonstige'">7c9b361d-66b6-4e4c-ae4b-2c01f655612c</xsl:when>
        <xsl:when test=".='Stereografisch - Stereobild'">e62f4860-b3b0-462e-92b6-e032336ab663</xsl:when>
        <xsl:when test=".='Stereografisch - Stereografische Disk'">c3f41d5e-e192-4828-805c-6df3270c1910</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Karte'">5fa3e09f-2192-41a9-b4bf-9eb8aef0af0a</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Flipchart'">affd5809-2897-42ca-b958-b311f3e0dcfb</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Gegenstand'">926662e9-2486-4bb9-ba3b-59bd2e7f2a0c</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Sonstige'">2802b285-9f27-4c86-a9d7-d2ac08b26a79</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Rolle'">68e7e339-f35c-4be2-b161-0b94d7569b7b</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Blatt'">5913bb96-e881-4087-9e71-33a43f68e12e</xsl:when>
        <xsl:when test=".='Ohne Hilfsmittel zu benutzen - Band'">8d511d33-5e85-4c5d-9bce-6e3c9cd0c324</xsl:when>
        <xsl:when test=".='Nicht spezifiziert - Nicht spezifiziert'">98f0caa9-d38e-427b-9ec4-454de81a94d7</xsl:when>
        <xsl:when test=".='Video - Sonstige'">e3179f91-3032-43ee-be97-f0464f359d9c</xsl:when>
        <xsl:when test=".='Video - Videocartridge'">132d70db-53b3-4999-bd79-0fac3b8b9b98</xsl:when>
        <xsl:when test=".='Video - Videokassette'">431cc9a0-4572-4613-b267-befb0f3d457f</xsl:when>
        <xsl:when test=".='Video - Videodisk'">7f857834-b2e2-48b1-8528-6a1fe89bf979</xsl:when>
        <xsl:when test=".='Video - Videobandspule'">ba0d7429-7ccf-419d-8bfb-e6a1200a8d20</xsl:when>
      </xsl:choose>
    </i>
  </xsl:template>

  <!-- Map nature of content terms -->
  <xsl:template match="natureOfContentTermIds/arr/i">
    <i>
      <xsl:choose>
        <xsl:when test=".='Ausstellungskatalog'"><xsl:text>b82b3a0d-00fa-4811-96da-04f531da8ea8</xsl:text></xsl:when>
        <xsl:when test=".='Autobiografie'"><xsl:text>04a6a8d2-f902-4774-b15f-d8bd885dc804</xsl:text></xsl:when>
        <xsl:when test=".='Bibliografie'"><xsl:text>f5908d05-b16a-49cf-b192-96d55a94a0d1</xsl:text></xsl:when>
        <xsl:when test=".='Bildband'"><xsl:text>631893b6-5d8a-4e1a-9e6b-5344e2945c74</xsl:text></xsl:when>
        <xsl:when test=".='Biografie'"><xsl:text>b6e214bd-82f5-467f-af5b-4592456dc4ab</xsl:text></xsl:when>
        <xsl:when test=".='Comic'"><xsl:text>acceb2d6-4f05-408f-9a88-a92de26441ce</xsl:text></xsl:when>
        <xsl:when test=".='Festschrift'"><xsl:text>b29d4dc1-f78b-48fe-b3e5-df6c37cdc58d</xsl:text></xsl:when>
        <xsl:when test=".='Hochschulschrift'"><xsl:text>94f6d06a-61e0-47c1-bbcb-6186989e6040</xsl:text></xsl:when>
        <xsl:when test=".='Hörbuch'"><xsl:text>96879b60-098b-453b-bf9a-c47866f1ab2a</xsl:text></xsl:when>
        <xsl:when test=".='Konferenzschrift'"><xsl:text>073f7f2f-9212-4395-b039-6f9825b11d54</xsl:text></xsl:when>
        <xsl:when test=".='Monografische Reihe'"><xsl:text>536da7c1-9c35-45df-8ea1-c3545448df92</xsl:text></xsl:when>
        <xsl:when test=".='Schulbuch'"><xsl:text>44cd89f3-2e76-469f-a955-cc57cb9e0395</xsl:text></xsl:when>
        <xsl:when test=".='Website'"><xsl:text>2fbc8a7b-b432-45df-ba37-46031b1f6545</xsl:text></xsl:when>
        <xsl:when test=".='Zeitschrift'"><xsl:text>0abeee3d-8ad2-4b04-92ff-221b4fce1075</xsl:text></xsl:when>
        <xsl:when test=".='Zeitung'"><xsl:text>ebbbdef1-00e1-428b-bc11-314dc0705074</xsl:text></xsl:when>
        <xsl:when test=".='Adressbuch'"><xsl:text>be3b8c89-93fe-4e92-b4e8-c4377ce5b474</xsl:text></xsl:when>
        <xsl:when test=".='Altkarte'"><xsl:text>046f525f-e55f-44ba-8482-1ef9c39706e1</xsl:text></xsl:when>
        <xsl:when test=".='Amtliche Publikation'"><xsl:text>7de7e987-e5c4-4302-bbc6-1ab1aed6d02d</xsl:text></xsl:when>
        <xsl:when test=".='Anleitung'"><xsl:text>eb9aa437-5c89-499e-8e8c-99ff1bcd5c71</xsl:text></xsl:when>
        <xsl:when test=".='Anthologie'"><xsl:text>deebea24-0eeb-4b1e-9bec-cd8639b09a2c</xsl:text></xsl:when>
        <xsl:when test=".='Antiquariatskatalog'"><xsl:text>928d8236-aa3a-46d8-a023-c1f90b7b04f5</xsl:text></xsl:when>
        <xsl:when test=".='Anzeigenblatt'"><xsl:text>c9c8a62e-2a04-4693-b4b6-b036a32cd391</xsl:text></xsl:when>
        <xsl:when test=".='Atlas'"><xsl:text>1fc3ab4f-21de-442f-b521-a93b9d38093d</xsl:text></xsl:when>
        <xsl:when test=".='Aufgabensammlung'"><xsl:text>7657057f-d960-45f4-87d3-585e317c440b</xsl:text></xsl:when>
        <xsl:when test=".='Aufsatzsammlung'"><xsl:text>7766744c-1ec7-48d6-abb9-dd823648c71e</xsl:text></xsl:when>
        <xsl:when test=".='Auktionskatalog'"><xsl:text>e986b80f-9ab1-49be-900f-02d1831d5ab7</xsl:text></xsl:when>
        <xsl:when test=".='Autograf'"><xsl:text>2aaff598-df0e-402f-a20c-432cbe61956d</xsl:text></xsl:when>
        <xsl:when test=".='Backbuch'"><xsl:text>83460946-76a3-4f90-9f9b-00902e9182c4</xsl:text></xsl:when>
        <xsl:when test=".='Beispielsammlung'"><xsl:text>1f45f6f8-3646-487a-a664-9370d18f2122</xsl:text></xsl:when>
        <xsl:when test=".='Bericht'"><xsl:text>71b43e3a-8cdd-4d22-9751-020f34fb6ef8</xsl:text></xsl:when>
        <xsl:when test=".='Bestimmungsbuch'"><xsl:text>6de95e6e-13a5-4314-ae18-fdfc34481fa8</xsl:text></xsl:when>
        <xsl:when test=".='Bild'"><xsl:text>6ca89a5f-53e4-4a6e-ba9e-05c3319ed198</xsl:text></xsl:when>
        <xsl:when test=".='Bilderbogen'"><xsl:text>6106d870-d587-4136-b63a-c9ae7c71d208</xsl:text></xsl:when>
        <xsl:when test=".='Bilderbuch'"><xsl:text>926fc409-a95f-4b7b-b7ea-86078c9572fe</xsl:text></xsl:when>
        <xsl:when test=".='Bildnis'"><xsl:text>06ad760f-a9e6-41d3-86fb-afb304f3b020</xsl:text></xsl:when>
        <xsl:when test=".='Bildwörterbuch'"><xsl:text>3a61e1c9-4cda-404a-91b4-a6ebd118c6ca</xsl:text></xsl:when>
        <xsl:when test=".='Blindendruck'"><xsl:text>eafd829e-5d97-40b1-9d54-5eb9445203b2</xsl:text></xsl:when>
        <xsl:when test=".='Brief'"><xsl:text>4eef98e9-57c1-401c-90ec-6808cee49cee</xsl:text></xsl:when>
        <xsl:when test=".='Briefsammlung'"><xsl:text>0ac4b27d-5575-4638-90d1-5d22079f5da3</xsl:text></xsl:when>
        <xsl:when test=".='Checkliste'"><xsl:text>adec9237-c1bf-4105-9af4-24fcad032de7</xsl:text></xsl:when>
        <xsl:when test=".='Datenbank'"><xsl:text>ee016802-2344-4779-8901-8f94e432c95a</xsl:text></xsl:when>
        <xsl:when test=".='Datensammlung'"><xsl:text>d810d631-8628-40e7-92bb-c9c2c601b499</xsl:text></xsl:when>
        <xsl:when test=".='Diagramm'"><xsl:text>0b9d9ff8-6d44-4729-ae4c-5f4d2ffc5165</xsl:text></xsl:when>
        <xsl:when test=".='Diskografie'"><xsl:text>62c5afff-fea8-4812-ac81-2dea23ca8742</xsl:text></xsl:when>
        <xsl:when test=".='Drehbuch'"><xsl:text>46c9cf33-e782-47b4-ad2d-1e8b1111904a</xsl:text></xsl:when>
        <xsl:when test=".='Einblattdruck'"><xsl:text>22891bd4-f6ce-41db-a7a3-cd4f2483b36b</xsl:text></xsl:when>
        <xsl:when test=".='Einführung'"><xsl:text>250b66e5-f4db-4cbb-9e3d-a2c9a694c909</xsl:text></xsl:when>
        <xsl:when test=".='Entscheidungssammlung'"><xsl:text>5137143b-08be-4b0d-b260-d2d9e6c96366</xsl:text></xsl:when>
        <xsl:when test=".='Enzyklopädie'"><xsl:text>26e98583-cf35-4b41-a6ea-6f2a264c7368</xsl:text></xsl:when>
        <xsl:when test=".='Erlebnisbericht'"><xsl:text>c0d52f31-aabb-4c55-bf81-fea7fdda94a4</xsl:text></xsl:when>
        <xsl:when test=".='Fachkunde'"><xsl:text>d4f047f9-236d-406b-9f80-759f36d53307</xsl:text></xsl:when>
        <xsl:when test=".='Fahrplan'"><xsl:text>b493f8ed-afa8-4594-a51c-5d91d7fff76a</xsl:text></xsl:when>
        <xsl:when test=".='Faksimile'"><xsl:text>9e56aa8d-2cc8-4a2e-a31d-676959ab1a4f</xsl:text></xsl:when>
        <xsl:when test=".='Fallsammlung'"><xsl:text>c0e1a410-173b-4095-a3a0-a5dbc2921973</xsl:text></xsl:when>
        <xsl:when test=".='Fallstudiensammlung'"><xsl:text>3c0b6823-37ab-44b8-8e24-081da639614a</xsl:text></xsl:when>
        <xsl:when test=".='Fiktionale Darstellung'"><xsl:text>76778eff-5641-4b35-a630-ebe0f9457317</xsl:text></xsl:when>
        <xsl:when test=".='Film'"><xsl:text>6dc73545-b18e-4681-b729-bf95d4ab5bf0</xsl:text></xsl:when>
        <xsl:when test=".='Filmografie'"><xsl:text>2d0c031e-e79f-40c4-9d85-36bac930aa01</xsl:text></xsl:when>
        <xsl:when test=".='Flugblatt'"><xsl:text>f13fd271-6d55-47f5-af4e-59c5a82d43b4</xsl:text></xsl:when>
        <xsl:when test=".='Flugschrift'"><xsl:text>c1534de8-e86c-411c-b7c3-dc4e53ce53eb</xsl:text></xsl:when>
        <xsl:when test=".='Formelsammlung'"><xsl:text>85567bf8-874a-49db-8e29-81e45176ecad</xsl:text></xsl:when>
        <xsl:when test=".='Formularsammlung'"><xsl:text>a559334b-cc0d-4f62-b484-3103c4f729f1</xsl:text></xsl:when>
        <xsl:when test=".='Forschungsbericht'"><xsl:text>4570a93e-ddb6-4200-8e8b-283c8f5c9bfa</xsl:text></xsl:when>
        <xsl:when test=".='Forschungsdaten'"><xsl:text>5c8ac65d-1ded-4383-8465-d647ab7fef31</xsl:text></xsl:when>
        <xsl:when test=".='Fotografie'"><xsl:text>f50440ca-0853-4aea-9857-a6d04832c379</xsl:text></xsl:when>
        <xsl:when test=".='Führer'"><xsl:text>b627e05d-a968-4269-935e-f9103e653d4f</xsl:text></xsl:when>
        <xsl:when test=".='Fundstellenverzeichnis'"><xsl:text>b9c39312-f988-45c0-8132-3d44f0fdd445</xsl:text></xsl:when>
        <xsl:when test=".='Genealogische Tafel'"><xsl:text>c63dd1de-1d6f-4e12-b8aa-6be13404d325</xsl:text></xsl:when>
        <xsl:when test=".='Gespräch'"><xsl:text>f9d113bd-e0a2-437c-8316-c1b0a2fc2a66</xsl:text></xsl:when>
        <xsl:when test=".='Globus'"><xsl:text>0342bfc3-53e1-41eb-96ee-8980e29f20b3</xsl:text></xsl:when>
        <xsl:when test=".='Grafik'"><xsl:text>a963838f-d1f0-48e0-9a48-b5a44442dce8</xsl:text></xsl:when>
        <xsl:when test=".='Graphzine'"><xsl:text>74ae4790-38bd-4ce6-bc73-d5cbe0f49ea3</xsl:text></xsl:when>
        <xsl:when test=".='Handschrift'"><xsl:text>de934b9d-4382-4a48-aeca-8ed24598e012</xsl:text></xsl:when>
        <xsl:when test=".='Haushaltsplan'"><xsl:text>8adf1c74-7d09-4b00-8159-bdd6fc1ac264</xsl:text></xsl:when>
        <xsl:when test=".='Hörspiel'"><xsl:text>be95066d-4342-44c6-91b6-31559bbe5b29</xsl:text></xsl:when>
        <xsl:when test=".='Humoristische Darstellung'"><xsl:text>5e075c73-76c3-407d-8367-01f22278c3e5</xsl:text></xsl:when>
        <xsl:when test=".='Inkunabel'"><xsl:text>c92d2e28-3444-4bb3-9da0-ddba560b652e</xsl:text></xsl:when>
        <xsl:when test=".='Interview'"><xsl:text>afeb9dcb-5e63-4013-862f-adc08bb7d88a</xsl:text></xsl:when>
        <xsl:when test=".='Inventar'"><xsl:text>0a530f13-465f-44bd-92a6-19247ec2b9d0</xsl:text></xsl:when>
        <xsl:when test=".='Jugendbuch'"><xsl:text>1ef59947-2244-4a13-a824-9bef6cfac317</xsl:text></xsl:when>
        <xsl:when test=".='Jugendsachbuch'"><xsl:text>c972d5b6-affc-4b49-ac2f-e1417f62aa33</xsl:text></xsl:when>
        <xsl:when test=".='Kalender'"><xsl:text>591c7745-8013-4475-86d1-f26b31f771cb</xsl:text></xsl:when>
        <xsl:when test=".='Karikatur'"><xsl:text>95795710-0933-408c-bbf7-3fc947dc0dac</xsl:text></xsl:when>
        <xsl:when test=".='Karte'"><xsl:text>e437177b-5656-4027-87fb-15b80f7ae00e</xsl:text></xsl:when>
        <xsl:when test=".='Katalog'"><xsl:text>9250535a-348e-4d28-9ae3-136c6c797172</xsl:text></xsl:when>
        <xsl:when test=".='Kinderbuch'"><xsl:text>7c543859-a312-411a-b6f4-eaf62f7bfd75</xsl:text></xsl:when>
        <xsl:when test=".='Kindersachbuch'"><xsl:text>931d63ff-2a7c-4be0-84f2-28f67a64e508</xsl:text></xsl:when>
        <xsl:when test=".='Kochbuch'"><xsl:text>9eb08843-acd2-466c-beac-2912b58c37ed</xsl:text></xsl:when>
        <xsl:when test=".='Kolumnensammlung'"><xsl:text>86c64437-1d04-4fb4-b391-0116ea8fc476</xsl:text></xsl:when>
        <xsl:when test=".='Kommentar'"><xsl:text>7434eb7e-1bea-456e-82eb-57f6625bd122</xsl:text></xsl:when>
        <xsl:when test=".='Konkordanz'"><xsl:text>7e926824-b9bc-4b41-a374-0cd19bca35ae</xsl:text></xsl:when>
        <xsl:when test=".='Kunstführer'"><xsl:text>b9bec2ba-6b00-46f6-bbec-df3bbeaf1065</xsl:text></xsl:when>
        <xsl:when test=".='Künstlerbuch'"><xsl:text>752e7245-0ccb-4bd4-a728-c474e6cd5eea</xsl:text></xsl:when>
        <xsl:when test=".='Laudatio'"><xsl:text>426499e0-a758-434c-a734-d2aa76d38197</xsl:text></xsl:when>
        <xsl:when test=".='Lehrbuch'"><xsl:text>b940e0c5-4caa-4197-a214-ca8ddd6f5666</xsl:text></xsl:when>
        <xsl:when test=".='Lehrerhandbuch'"><xsl:text>8d1c4fb4-b006-49d0-8e40-a2e08f1ea619</xsl:text></xsl:when>
        <xsl:when test=".='Lehrmittel'"><xsl:text>176321da-6b23-48f5-b992-b25da1762061</xsl:text></xsl:when>
        <xsl:when test=".='Lehrplan'"><xsl:text>f0ca549e-25fe-4395-82da-f7de77108b55</xsl:text></xsl:when>
        <xsl:when test=".='Lernsoftware'"><xsl:text>f9708b8d-c0c3-4c3e-b1d0-2dfb26065609</xsl:text></xsl:when>
        <xsl:when test=".='Lesebuch'"><xsl:text>8b946df0-b673-4306-ae0d-0e0fab472bfb</xsl:text></xsl:when>
        <xsl:when test=".='Liederbuch'"><xsl:text>a8935409-8601-492e-bb85-0ec6498726ed</xsl:text></xsl:when>
        <xsl:when test=".='Literaturbericht'"><xsl:text>31572023-f4c9-4cf3-80a2-0543c9eda884</xsl:text></xsl:when>
        <xsl:when test=".='Loseblattsammlung'"><xsl:text>a26421f0-7138-496f-938d-7f2bba64144b</xsl:text></xsl:when>
        <xsl:when test=".='Mehrsprachiges Wörterbuch'"><xsl:text>11fe0ed8-e5f3-4af0-924c-99b2092ae270</xsl:text></xsl:when>
        <xsl:when test=".='Mitgliederverzeichnis'"><xsl:text>4de743d8-b943-4dc2-a51b-b89dbebc8722</xsl:text></xsl:when>
        <xsl:when test=".='Modell'"><xsl:text>765b2f6b-31de-45b6-b017-864bb4f02a9a</xsl:text></xsl:when>
        <xsl:when test=".='Musikhandschrift'"><xsl:text>dd2ab33c-5345-46f5-83cd-df948dfa9649</xsl:text></xsl:when>
        <xsl:when test=".='Nachruf'"><xsl:text>c68cbdfe-918e-454f-bb2a-bd18c52848eb</xsl:text></xsl:when>
        <xsl:when test=".='Norm'"><xsl:text>5ce7e9f6-dd50-403a-a956-ec2efe590634</xsl:text></xsl:when>
        <xsl:when test=".='Ortsverzeichnis'"><xsl:text>3f846131-2d10-40e2-9599-a72bde56110f</xsl:text></xsl:when>
        <xsl:when test=".='Papyrus'"><xsl:text>72e117fc-28d2-442c-8978-4d9f2bd47a1e</xsl:text></xsl:when>
        <xsl:when test=".='Patentschrift'"><xsl:text>5f7974b5-9011-4b67-9468-a6d1a5b581e2</xsl:text></xsl:when>
        <xsl:when test=".='Plakat'"><xsl:text>438c4de1-e1c6-409a-9cf7-ce9ba54aba97</xsl:text></xsl:when>
        <xsl:when test=".='Plan'"><xsl:text>41e647c6-7549-48bf-b44e-2df8399101b3</xsl:text></xsl:when>
        <xsl:when test=".='Podcast'"><xsl:text>e78f29eb-2e6d-48a4-9177-6d14cf9ed11d</xsl:text></xsl:when>
        <xsl:when test=".='Postkarte'"><xsl:text>286ecd88-2796-4af2-a611-e68f934e8391</xsl:text></xsl:when>
        <xsl:when test=".='Praktikum'"><xsl:text>a2de79af-7816-4aa0-8bb8-5b1bf5b2b170</xsl:text></xsl:when>
        <xsl:when test=".='Predigthilfe'"><xsl:text>ce3d93b8-898b-4583-a279-6ab4bd946f72</xsl:text></xsl:when>
        <xsl:when test=".='Pressendruck'"><xsl:text>2bf1cc39-c635-44d8-bcd1-8e53889b1ab9</xsl:text></xsl:when>
        <xsl:when test=".='Pressestimme'"><xsl:text>f978b2f7-9cf2-4756-bc4f-80f9fae93311</xsl:text></xsl:when>
        <xsl:when test=".='Programmheft'"><xsl:text>8b9af06e-6169-446e-9ef2-1524d779ba81</xsl:text></xsl:when>
        <xsl:when test=".='Puzzle'"><xsl:text>d5bf4b5a-6f25-42ff-9de5-807fc4fc9f88</xsl:text></xsl:when>
        <xsl:when test=".='Quelle'"><xsl:text>7a718575-d5b3-4e91-974a-4ab61dd34367</xsl:text></xsl:when>
        <xsl:when test=".='Ratgeber'"><xsl:text>28b9ea19-48f5-4481-ad86-17f968db740c</xsl:text></xsl:when>
        <xsl:when test=".='Rede'"><xsl:text>0a809a24-b486-4ae3-a212-bd5bf64993f7</xsl:text></xsl:when>
        <xsl:when test=".='Referateorgan'"><xsl:text>367dbc86-89d9-45d4-a3c8-cc0072727011</xsl:text></xsl:when>
        <xsl:when test=".='Regest'"><xsl:text>ae187a86-ae7b-46a0-8042-d431faa073c9</xsl:text></xsl:when>
        <xsl:when test=".='Reisebericht'"><xsl:text>9419a20e-6c8f-4ae1-85a7-8c184a1f4762</xsl:text></xsl:when>
        <xsl:when test=".='Reportagensammlung'"><xsl:text>98f15f24-d372-4377-b305-2f998a486372</xsl:text></xsl:when>
        <xsl:when test=".='Rezension'"><xsl:text>8b6d17b3-9c33-4c61-9581-5ce24f1e9043</xsl:text></xsl:when>
        <xsl:when test=".='Richtlinie'"><xsl:text>5d4b3eb3-2707-4857-b000-cdd10a85098e</xsl:text></xsl:when>
        <xsl:when test=".='Röntgenbild'"><xsl:text>f00b6d1d-2a80-4f66-9371-66dbb7793542</xsl:text></xsl:when>
        <xsl:when test=".='Rückläufiges Wörterbuch'"><xsl:text>47b3f15a-894a-4098-99f0-f6f78a3cc3eb</xsl:text></xsl:when>
        <xsl:when test=".='Sachbilderbuch'"><xsl:text>04c8e884-9d2c-4f30-b30e-0a2920c73e36</xsl:text></xsl:when>
        <xsl:when test=".='Satzung'"><xsl:text>dacb1c74-b65d-4176-b8dd-fb1aa536719e</xsl:text></xsl:when>
        <xsl:when test=".='Schematismus'"><xsl:text>53e59662-f535-4783-a3b5-649225518d6d</xsl:text></xsl:when>
        <xsl:when test=".='Schulprogramm'"><xsl:text>85657646-6b6f-4e71-b54c-d47f3b95a5ed</xsl:text></xsl:when>
        <xsl:when test=".='Software'"><xsl:text>d506f599-ff59-4d0d-8f20-5359e4e01f48</xsl:text></xsl:when>
        <xsl:when test=".='Spiel'"><xsl:text>c2ceac3c-2f1c-4657-b84f-a1bb4915025f</xsl:text></xsl:when>
        <xsl:when test=".='Sprachatlas'"><xsl:text>4d2f3df4-ad09-41aa-bf74-0a2bbb67dfff</xsl:text></xsl:when>
        <xsl:when test=".='Sprachführer'"><xsl:text>9730e60d-94f1-4130-aea0-95be3fed8157</xsl:text></xsl:when>
        <xsl:when test=".='Stadtplan'"><xsl:text>56a2b5f2-9bdf-4114-bada-c1cb1c0763ba</xsl:text></xsl:when>
        <xsl:when test=".='Statistik'"><xsl:text>b56cfee4-e602-4740-ae2c-b4802763e998</xsl:text></xsl:when>
        <xsl:when test=".='Tabelle'"><xsl:text>a0fb9bee-55df-436c-96ed-4d98997b85d1</xsl:text></xsl:when>
        <xsl:when test=".='Tafel'"><xsl:text>b86be70b-e5be-4959-ae36-01e05459ce8b</xsl:text></xsl:when>
        <xsl:when test=".='Tagebuch'"><xsl:text>cbd7205e-621a-4cc1-9c37-8d78d321c43c</xsl:text></xsl:when>
        <xsl:when test=".='Technische Zeichnung'"><xsl:text>eedd5683-b8ad-4016-a525-d9044abfbd8b</xsl:text></xsl:when>
        <xsl:when test=".='Telefonbuch'"><xsl:text>e1d95ebb-a274-46fc-98ed-6cb9318cace3</xsl:text></xsl:when>
        <xsl:when test=".='Testmaterial'"><xsl:text>7e469bcb-d4f1-4a43-ba9c-957fcc9d904c</xsl:text></xsl:when>
        <xsl:when test=".='Theaterstück'"><xsl:text>04e878fb-76a6-4196-aa01-8a5b31270ad6</xsl:text></xsl:when>
        <xsl:when test=".='Thesaurus'"><xsl:text>706f80d2-5ebe-499c-ab33-de0c9f6b7a03</xsl:text></xsl:when>
        <xsl:when test=".='Übungssammlung'"><xsl:text>9d027e90-4585-416e-8ec1-24107665a533</xsl:text></xsl:when>
        <xsl:when test=".='Umfrage'"><xsl:text>9554d351-bbe9-418b-ba45-fc2fcadc6787</xsl:text></xsl:when>
        <xsl:when test=".='Unterrichtseinheit'"><xsl:text>ddf18bbb-f443-4293-bba1-deb50d361323</xsl:text></xsl:when>
        <xsl:when test=".='Urkunde'"><xsl:text>b1f81304-18f8-44aa-9861-fee08674355c</xsl:text></xsl:when>
        <xsl:when test=".='Verkaufskatalog'"><xsl:text>68a7b19d-222e-4b8e-ac0f-35451c2b17fa</xsl:text></xsl:when>
        <xsl:when test=".='Verzeichnis'"><xsl:text>bba7b7ae-e3f0-4bd9-b490-728e6b9c44f5</xsl:text></xsl:when>
        <xsl:when test=".='Vorlesungsverzeichnis'"><xsl:text>c3bb3529-f3a6-41bf-b552-7e055b94cf13</xsl:text></xsl:when>
        <xsl:when test=".='Weblog'"><xsl:text>c85d3e92-a182-41b6-a4fc-6091061e7f23</xsl:text></xsl:when>
        <xsl:when test=".='Weltkarte'"><xsl:text>1ba6f9f9-ad22-49eb-ac5e-c3d20bf08728</xsl:text></xsl:when>
        <xsl:when test=".='Werkverzeichnis'"><xsl:text>3af8983e-309c-4c24-8a10-a9a9cd37ab56</xsl:text></xsl:when>
        <xsl:when test=".='Werkzeitschrift'"><xsl:text>5eb0568a-962f-40a2-a53e-5d5d94b4f488</xsl:text></xsl:when>
        <xsl:when test=".='Wörterbuch'"><xsl:text>2cc014ec-4ae2-4bdf-ac1b-65889482332a</xsl:text></xsl:when>
        <xsl:when test=".='Zeichnung'"><xsl:text>c9abd8ad-79c2-4012-92a2-ea042e796fad</xsl:text></xsl:when>
        <xsl:when test=".='Zeittafel'"><xsl:text>d1371500-3f65-43e7-855f-2b385a50a7fd</xsl:text></xsl:when>
        <xsl:when test=".='Zitatensammlung'"><xsl:text>f31cdb4a-8c7d-442b-a3a1-7351a2f00b3c</xsl:text></xsl:when>
      </xsl:choose>
    </i>
  </xsl:template>

  <!-- Map contributor name types -->
  <xsl:template match="contributorNameTypeId">
    <contributorNameTypeId>
      <xsl:choose>
        <xsl:when test=".='Personenname'">2b94c631-fca9-4892-a730-03ee529ffe2a</xsl:when>
        <xsl:when test=".='Körperschaftsname'">2e48e713-17f3-4c13-a9f8-23845bb210aa</xsl:when>
      </xsl:choose>
    </contributorNameTypeId>
  </xsl:template>

  <!-- Map electronic access relationship types -->
  <xsl:template match="relationshipId">
    <relationshipId>
      <xsl:choose>
        <xsl:when test=".='Ressource'">f5d0068e-6272-458e-8a81-b85e7b9a14aa</xsl:when>
        <xsl:when test=".='URL für Volltext und Kataloganreicherung  (3433)'">1e178616-2b75-4ecf-a8c8-99b85273dcfc</xsl:when>
      </xsl:choose>
    </relationshipId>
  </xsl:template>

  <!-- Map instance relationship types -->
  <xsl:template match="instanceRelationshipTypeId">
    <instanceRelationshipTypeId>
      <xsl:choose>
        <xsl:when test=".='Aufsatz'">6366b68c-aeeb-4dfe-9cd5-92518b2244a0</xsl:when>
        <xsl:when test=".='Band'">23651816-7176-406a-8915-52e25b3a9411</xsl:when>
        <xsl:when test=".='Mehrteilige Monografie'">a17daf0a-f057-43b3-9997-13d0724cdf51</xsl:when>
        <xsl:when test=".='Schriftenreihe'">30773a27-b485-4dab-aeb6-b8c04fa3cb17</xsl:when>
      </xsl:choose>
    </instanceRelationshipTypeId>
  </xsl:template>
  
  <!-- Map processing statistical codes -->
  <xsl:template match="processing/*/statisticalCoding/arr/i/setCode">
    <setCode>
      <xsl:choose>
        <xsl:when test=".='ITEM_STATUS'"><xsl:text>e7b3071c-8cc0-48cc-9cd0-dfc82c4e4602</xsl:text></xsl:when>
        <xsl:when test=".='PO_LINE_REFERENCE'"><xsl:text>dcf1220f-5524-4f1e-8e40-5da3366e8478</xsl:text></xsl:when>
        <xsl:when test=".='ITEM_PATTERN_MATCH'"><xsl:text>970b8b4e-ee88-4037-b954-a10ee75340f0</xsl:text></xsl:when>
        <xsl:when test=".='HOLDINGS_RECORD_PATTERN_MATCH'"><xsl:text>ac9bae48-d14c-4414-919a-292d539f9967</xsl:text></xsl:when>
        <xsl:otherwise>unknown</xsl:otherwise>
      </xsl:choose>
    </setCode>
  </xsl:template>
  
  <xsl:template match="original"/>
</xsl:stylesheet>
