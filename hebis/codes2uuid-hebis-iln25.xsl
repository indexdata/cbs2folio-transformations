<?xml version="1.0" encoding="UTF-8"?> 
<!-- date of last edit: 2023-06-16 (YYYY-MM-DD) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- ILN 25 UB Mainz -->

  <!-- Map locations 
       For Mainz, the IDs are the location names in FOLIO, generated from 209A $f and other pica fields -->
  
  <xsl:template match="permanentLocationId"> <!-- ILN -->
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='DUMMY'">87764786-c5c8-47d0-a480-df506c751d76</xsl:when>
        <xsl:when test=".='FBÄGYPT'">18fe087a-125a-4082-a578-7c79fd9f64ff</xsl:when>
	    	<xsl:when test=".='FBAVFGA'">3b92f4b4-b21b-4c58-b968-727a03f0dfec</xsl:when>
        <xsl:when test=".='FBGESANG'">86f574fa-7ff2-4e54-a248-1867184b7139</xsl:when>
        <xsl:when test=".='FBGTEM'">9c231ef4-d653-4b1a-839b-8375307b8bc7</xsl:when>
        <xsl:when test=".='FBIGL'">bb1e44b8-d9ab-4660-8758-b3adf2f70132</xsl:when>
        <xsl:when test=".='FBKUNST'">f3956a73-496a-4ffc-aa28-f638b54987f4</xsl:when>
        <xsl:when test=".='FBMPI'">404d2702-7cab-4086-b758-352988354e94</xsl:when>
        <xsl:when test=".='FBPSY'">ef19f548-1910-470a-b5bc-9c71421388bf</xsl:when>
        <xsl:when test=".='GFGFILM'">eefdca5d-5541-459f-877e-84c184ce5899</xsl:when>
        <xsl:when test=".='GFGGEO'">71cd6589-995b-473a-9db7-592cf12189ed</xsl:when>
        <xsl:when test=".='GFGJOUR'">209db366-27c5-4bfc-981e-25d9671b0348</xsl:when>
        <xsl:when test=".='GFGKUN'">408a35b0-2dda-4f21-a464-a70dcdc2e021</xsl:when>
        <xsl:when test=".='GFGPÄD'">c7755ebd-cfc2-4c11-b805-52a0ec35b8d0</xsl:when>
        <xsl:when test=".='GFGPOL'">6d355c5b-a431-4953-9a2a-7765add6aff8</xsl:when>
        <xsl:when test=".='GFGPSYCH'">b9ea457f-a772-4794-b894-5bc36f26db11</xsl:when>
        <xsl:when test=".='GFGPUB'">866f255b-b1b1-48d4-8c06-4afbdb257844</xsl:when>
        <xsl:when test=".='GFGSOZ'">ff802b22-40e4-4461-8bde-bc70289db467</xsl:when>
        <xsl:when test=".='GFGSPO'">55f9eac6-8151-46f8-b022-f7952df083fe</xsl:when>
        <xsl:when test=".='GFGUSA'">2a938c6c-e569-4860-a426-aad0bd0fa702</xsl:when>
        <xsl:when test=".='GFGZEB'">889a833b-720c-427c-a519-d9471f9ae084</xsl:when>
        <xsl:when test=".='GHFAK'">18becce3-6ad7-4265-8689-4024fa2877aa</xsl:when>
        <xsl:when test=".='GHFL'">e651307a-36a0-45a9-a6b1-6b794ccd223e</xsl:when>
        <xsl:when test=".='GHFLLS'">2c081049-c022-400d-93a2-548f67654817</xsl:when>
        <xsl:when test=".='GHFREI'">b4b60a5e-77e0-4555-a733-644617e3659c</xsl:when>
        <xsl:when test=".='GHLBS'">1c2fca3c-d857-4924-b687-8ea6a3f6d25a</xsl:when>
        <xsl:when test=".='GHLS'">d525e5e1-457a-462c-beed-2f72e28dc721</xsl:when>
        <xsl:when test=".='GHMAG'">e0543e59-7789-48e1-9806-402e74005a03</xsl:when>
        <xsl:when test=".='GHSEP'">151afc29-859f-476e-8b6f-8ff388de03a7</xsl:when>
        <xsl:when test=".='GHZEB'">094be189-54da-4f93-a290-33ef408e98ec</xsl:when>
        <xsl:when test=".='MINT'">a2b4dab0-da03-4b49-aa2a-8f0ed9c0e7dd</xsl:when>
        <xsl:when test=".='MINTLBS'">1ceaeeb6-acf6-4e28-b988-bc0c5d6b2f06</xsl:when>
        <xsl:when test=".='MINTFAK'">0bbd1c4d-6ced-46e1-b0ca-c6de67856313</xsl:when>
        <xsl:when test=".='ONLINE'">2947e228-3ba6-4714-8ef4-bb31c254ea49</xsl:when>
        <xsl:when test=".='PHALG'">904349f3-ccdf-4f40-a175-1d6ce394a079</xsl:when>
        <xsl:when test=".='PHAVL'">b6742937-3cd5-42ac-a3f4-83ebe557215f</xsl:when>
        <xsl:when test=".='PHANG'">7e42e23b-1d05-409e-a620-e39da09860c2</xsl:when>
        <xsl:when test=".='PHAVS'">4b9ee306-7515-4c1e-9311-30891d3a7255</xsl:when>
        <xsl:when test=".='PHBUW'">9bad5803-6654-45d7-9810-88fd862104c3</xsl:when>
        <xsl:when test=".='PHBYZ'">976bdf60-8978-485d-b7af-2a7595a3c002</xsl:when>
        <xsl:when test=".='PHGER'">a12555c4-26b6-4e10-8c91-76eb3af1efa1</xsl:when>
        <xsl:when test=".='PHHFMFREI'">c94d7179-a254-4115-90c9-1f5ca7850e9e</xsl:when>
        <xsl:when test=".='PHHFMMAG'">67a86c11-ff12-4c8a-9ad0-a68be2fad894</xsl:when>
        <xsl:when test=".='PHKLA'">642f2956-cb86-4fd5-be8d-f42851383504</xsl:when>
        <xsl:when test=".='PHKLP'">4e2e7695-ce87-4f7b-9cba-5d86d202ecc7</xsl:when>
        <xsl:when test=".='PHKLW'">3b099a07-17ab-44f2-92b7-d61f0cab5390</xsl:when>
        <xsl:when test=".='PHMAG'">4ef3f125-4b94-4e43-997d-505f3d7439aa</xsl:when>
        <xsl:when test=".='PHMNG'">e91db274-7795-4a57-abff-f55cb0535c64</xsl:when>
        <xsl:when test=".='PHMUW'">771b46aa-76ab-4800-9f3b-177b89b6f853</xsl:when>
        <xsl:when test=".='PHOEG'">af40b5e2-180c-4450-b4e3-bad8e8b8783d</xsl:when>
        <xsl:when test=".='PHPHI'">e8d099fb-53ce-4042-8824-35fb49ef42e0</xsl:when>
        <xsl:when test=".='PHPOL'">522ab11a-9387-46f5-a9d4-61ed87d9aa32</xsl:when>
        <xsl:when test=".='PHROM'">8ac4aea8-692f-4e3a-9095-b53dfb6a3aa2</xsl:when>
        <xsl:when test=".='PHSLAV'">e8d25e8a-9fe8-4e46-9b8b-79f7de9c3bc8</xsl:when>
        <xsl:when test=".='PHTHW'">4e0e57d9-f094-4e82-9bc8-8f6a55e5041c</xsl:when>		
        <xsl:when test=".='RW'">98fcae0c-df5d-472a-8dcd-25ce4252e936</xsl:when>
        <xsl:when test=".='RWETH'">9bf8ba06-3a78-4cdc-84fb-c3a15eecd722</xsl:when>
        <xsl:when test=".='RWFAK'">7970efa9-5057-4bf3-bcac-b01287dfcdd4</xsl:when>
        <xsl:when test=".='RWLBS'">22d4af1b-3d9c-4ad8-afa2-ff7076bfe7c1</xsl:when>
        <xsl:when test=".='RWTURK'">129a4323-01a0-4bad-bac5-2e0487d8e67c</xsl:when>
        <xsl:when test=".='TH'">395d036a-83fd-4809-bf45-e607c086f13b</xsl:when>
        <xsl:when test=".='THLBS'">3c7c0478-2383-4c17-beda-6d8d87dfd421</xsl:when>
        <xsl:when test=".='THPSYCH'">b2644e50-dd57-49f6-b4ea-c22f119e0b59</xsl:when>
        <xsl:when test=".='THRARA'">b884da52-8aad-4109-a711-dd963ccb3457</xsl:when>
        <xsl:when test=".='UMFH'">155b41db-5816-4066-ae06-5b2837662983</xsl:when>
        <xsl:when test=".='UMLBS'">0152224d-0d32-4813-a3c7-47b2ddc9cc96</xsl:when>
        <xsl:when test=".='UMLS'">a21adfe3-b5ee-4248-85a3-37a6a09fd6e8</xsl:when>
        <xsl:when test=".='UMPSY'">a6bf3e9e-c3c4-4795-94a6-500726d201c2</xsl:when>
	    	<xsl:when test=".='UMRMED'">e9abed70-7bd4-464b-b5fe-8340bbe7b9cd</xsl:when>
        <xsl:when test=".='UMZMK'">28b03a76-c660-4610-a79b-c54cc11e7f74</xsl:when>		
        <xsl:when test=".='ZBFREI'">ea51b803-8bc4-4441-84e0-30a8e29c7a51</xsl:when>
        <xsl:when test=".='ZBLBS'">67ae08e9-89f9-4939-8def-5666cf7bfc3d</xsl:when>
        <xsl:when test=".='ZBLS'">c23399ef-6776-4442-a53a-dfca759c3b9f</xsl:when>
        <xsl:when test=".='ZBMAG'">413fe054-a4f3-423e-a62f-088eb111ea8d</xsl:when>
        <xsl:when test=".='ZBRARA'">61fac3e8-8a32-4117-9005-38d2a4847f00</xsl:when>
        <xsl:when test=".='ZBZEB'">802ea709-f017-49e7-9795-5fa0053668cb</xsl:when>
        <xsl:otherwise>413fe054-a4f3-423e-a62f-088eb111ea8d</xsl:otherwise> <!-- ZBMAG -->
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <xsl:template match="permanentLoanTypeId"> <!-- ILN -->
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='u'"><xsl:text>7a03b2e2-c995-47a4-83d0-04bbe1930af4</xsl:text></xsl:when> <!-- 0 u ausleihbar -->
        <xsl:when test=".='b'"><xsl:text>df64c252-595d-463c-aad8-3bda0ba101aa</xsl:text></xsl:when> <!-- 1 b Kurzausleihe -->
        <xsl:when test=".='c'"><xsl:text>d1ba00c9-3f08-4df9-9d70-c7e1ab3b1702</xsl:text></xsl:when> <!-- 2 c Lehrbuchsammlung -->
        <xsl:when test=".='s'"><xsl:text>1cecc65a-a7c4-437a-bb04-6756c23b422e</xsl:text></xsl:when> <!-- 3 s Präsenzbestand Lesesaal -->
        <xsl:when test=".='d'"><xsl:text>31c550e8-86b7-4674-bab0-7011ba94148e</xsl:text></xsl:when> <!-- 4 d Präsenzbestand Wochenendausleihe -->
        <xsl:when test=".='i'"><xsl:text>e04e82c1-1257-4046-bc5e-d742bbe061da</xsl:text></xsl:when> <!-- 5 i nur für den Lesesaal -->
        <xsl:when test=".='e'"><xsl:text>cbd4ec80-1622-420e-8b7c-644b04109367</xsl:text></xsl:when> <!-- 8 e vermisst -->
        <xsl:when test=".='a'"><xsl:text>8cef8fa7-0a78-4bdd-84d3-25ce207ef8c8</xsl:text></xsl:when> <!-- 9 a bestellt -->
        <xsl:when test=".='g'"><xsl:text>20c359cb-b422-47cc-8c40-e8f6655f2b70</xsl:text></xsl:when> <!-- 9 g nicht ausleihbar -->
        <xsl:when test=".='Test'"><xsl:text>3b23397c-93ec-40ad-bb8a-9113f9fe9de2</xsl:text></xsl:when> <!-- 9 Test -->
        <xsl:when test=".='z'"><xsl:text>661ffe64-2e47-4203-845f-96d820aa48f2</xsl:text></xsl:when> <!-- 9 z Verlust -->
        <xsl:when test=".='dummy'"><xsl:text>80ff439c-3ccb-48df-9758-c11011cef6d0</xsl:text></xsl:when> <!-- dummy -->
        <xsl:otherwise>7a03b2e2-c995-47a4-83d0-04bbe1930af4</xsl:otherwise> <!-- 0 u ausleihbar -->
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
              <xsl:when test=".='BASIS'">0ac04835-6a08-4043-9453-38908ff91129</xsl:when>
              <xsl:when test=".='00015'">a59d4a4e-0339-4243-9039-bd64c8a9c941</xsl:when>
              <xsl:when test=".='00016'">e70c1e74-d136-4d59-bdb9-1ec2f33c6a93</xsl:when>
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

</xsl:stylesheet>
