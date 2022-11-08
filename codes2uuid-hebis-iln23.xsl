<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 23 UB Kassel -->
  <!-- Map locations (codes2uuid-iln23.xsl)
       the IDs are the location names in FOLIO, generated from 209A $f and other pica fields -->

  <xsl:template match="permanentLocationId"> <!-- ILN -->
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='999_XYZ'">55c66b59-721a-407c-9c65-eefcf0017c6d</xsl:when>
        <xsl:when test=".='030_MAG'">cc52f53f-0b6b-48ce-8a6f-6c8cec89246b</xsl:when>
        <xsl:when test=".='021_FHD'">333ced83-3dd3-4ef1-a8cf-fac6945bd906</xsl:when>
        <xsl:when test=".='021_HDB'">d36c4252-7a8a-472e-a8a2-6a038f9ab191</xsl:when>
        <xsl:when test=".='030_BGG'">0da211f0-f136-4865-bdef-a79d6d2ec47a</xsl:when>
        <xsl:when test=".='030_CBM'">6a83aa6f-99ad-4e1f-b6d8-ff8117d975e2</xsl:when>
        <xsl:when test=".='030_EUL'">0bfecb78-3c84-4dfa-b9ff-416a0c57179c</xsl:when>
        <xsl:when test=".='030_FEU'">f94c8382-7727-40e1-9756-501e8b0050cc</xsl:when>
        <xsl:when test=".='030_FHD'">d00458fb-9395-47c1-8a8a-9af37b85b7e1</xsl:when>
        <xsl:when test=".='030_GRO'">4d784567-ad1b-4bbc-b6a6-e573b0fae118</xsl:when>
        <xsl:when test=".='030_KHS'">6b01c201-c98f-4d6a-b22a-259a84457ccf</xsl:when>
        <xsl:when test=".='030_OZW'">23fbd29c-444e-4d03-8495-93b879775795</xsl:when>
        <xsl:when test=".='030_PRA'">cdbe6a14-b750-4cbb-be1d-f3ac1593a2bc</xsl:when>
        <xsl:when test=".='030_RAR'">5355178d-834d-458b-81dc-7aa353e75b8a</xsl:when>
        <xsl:when test=".='030_SLS'">a31525f5-ef9c-4d3d-a276-70a3ad0f5bd4</xsl:when>
        <xsl:when test=".='030_TRE'">48617f99-7aa9-4661-96ba-bac0367d42f8</xsl:when>
        <xsl:when test=".='030_ZTG'">8f4f169c-59ea-499a-b834-b0ab017aad62</xsl:when>
        <xsl:when test=".='030_ZZN'">fde773fc-e842-4573-a247-02bdef0e6ab7</xsl:when>
        <xsl:when test=".='031_OZW'">ed602bc1-f38b-4a77-8439-88ed99a932de</xsl:when>
        <xsl:when test=".='032_CBM'">6dd56c96-8fb4-4036-ac20-317725f71994</xsl:when>
        <xsl:when test=".='033_BGG'">04b899ba-78d3-4f0a-a8ac-a532fdf160f0</xsl:when>
        <xsl:when test=".='033_CBM'">a0969c9b-7393-4b8a-8690-a47d6b173a02</xsl:when>
        <xsl:when test=".='033_RAR'">579ef1aa-d1af-4532-9d72-0eb063cf8051</xsl:when>
        <xsl:when test=".='034_FEU'">78f157b9-6815-4151-a1e2-7c7dfdcda28f</xsl:when>
        <xsl:when test=".='036_OZW'">adbcf00e-6632-4457-b944-74e1134a83c8</xsl:when>
        <xsl:when test=".='039_FEU'">e37f847f-047b-47fa-b574-f91498329082</xsl:when>
        <xsl:when test=".='039_MAG'">91649596-70e7-4880-9131-e4b6e90e23f9</xsl:when>
        <xsl:when test=".='200_DIT'">f4cda45c-53ea-47f8-93a6-925266dbe710</xsl:when>
        <xsl:when test=".='999_XYZ'">55c66b59-721a-407c-9c65-eefcf0017c6d</xsl:when>
        <xsl:when test=".='035_FWH'">7d7d8db3-e9c9-414f-9b44-dca69a843bd2</xsl:when>
        <xsl:when test=".='070_FHD'">6d680dab-41a6-4fea-b820-98d31efd5791</xsl:when>
        <xsl:when test=".='070_GRO'">e764c291-0c80-4846-a7c0-ef2e00a7f218</xsl:when>
        <xsl:when test=".='070_MAG'">5c2ac978-ef2f-410e-b255-d46345c94820</xsl:when>
        <xsl:when test=".='070_MDR'">d49c7526-46d4-4997-a296-2c4759689b62</xsl:when>
        <xsl:when test=".='070_ZTG'">f9ff0e99-91d5-4d41-bb2a-37555e32455d</xsl:when>
        <xsl:when test=".='090_FHD'">03ba23c9-4cf7-482d-9aca-4de3b447ac25</xsl:when>
        <xsl:when test=".='090_GRO'">d06ee225-efed-4568-92e3-419905a23e11</xsl:when>
        <xsl:when test=".='090_MDR'">4364da73-6f3f-4c39-b563-89736170ef7e</xsl:when>
        <xsl:when test=".='090_ZTG'">d75a8524-31a5-4af1-b068-ec5c9927e1f4</xsl:when>
        <xsl:when test=".='010_ALL'">81cbb095-056f-42c0-aefc-2f42dde3938f</xsl:when>
        <xsl:when test=".='022_WAS'">75f20517-d834-4dec-8735-82444a47b265</xsl:when>
        <xsl:when test=".='050_FHD'">29a1beab-6103-4a37-9b88-b89a76cb0f7e</xsl:when>
        <xsl:when test=".='050_ZTG'">2ca5b553-8b69-45d1-ac42-5a72a5fd3773</xsl:when>
        <xsl:when test=".='080_SON'">734c50db-9174-4a10-b47f-428e6703784a</xsl:when>
        <xsl:when test=".='080_FHD'">87f06891-7deb-4118-b4f0-6470653ba875</xsl:when>
        <xsl:when test=".='080_MAG'">398ddef5-efa6-4dcc-9050-76ae07201171</xsl:when>
        <xsl:when test=".='080_ZTG'">4e9d3643-cafa-4112-9800-3276d0e2b975</xsl:when>
        <xsl:when test=".='020_HAP'">8215a497-554a-411f-bb72-a0dd794e7bdf</xsl:when>
        <xsl:when test=".='020_INC'">4e8f8b26-ffa9-4db6-ad0c-69c02d1e5926</xsl:when>
        <xsl:when test=".='022_IMU'">0e4b2cb6-5505-460e-a476-9f487d836f14</xsl:when>
        <xsl:when test=".='020_SON'">c5a5a110-ede6-4993-9419-875bf46bfe12</xsl:when>
        <xsl:when test=".='026_LFS'">3ee4a93c-ab0b-4500-85b1-82969fe76715</xsl:when>
        <xsl:when test=".='021_MAG'">b71ef57b-d311-4a9d-bec2-de3907829d56</xsl:when>
        <xsl:when test=".='021_STK'">8cfedcd8-9112-43ae-9dce-305c20a0e732</xsl:when>
        <xsl:when test=".='021_ZTG'">ab87711b-dab5-433f-9328-020e1ec25127</xsl:when>
        <xsl:when test=".='020_IAL'">74e20f04-35ab-4bda-a6d4-fa934b1902dd</xsl:when>
        <xsl:when test=".='000_UBG'">fe0bf573-e3bb-4357-9fa3-412a43fad95d</xsl:when>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->
  <!-- ILN 8: 6 nicht genutzt + 7 als Sonderfall = im LBS3-OUS nur manuell in Bandsatz eingetragen -->
  <xsl:template match="permanentLoanTypeId"> <!-- ILN -->
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='0 u Ausleihbar'"><xsl:text>fe9cea09-7e93-4c44-b411-3be611478db8</xsl:text></xsl:when> 
        <xsl:when test=".='1 b Fernleihe - passiv'"><xsl:text>c008217e-e88f-48da-aa53-6857c2922fff</xsl:text></xsl:when>
        <xsl:when test=".='2 c Filme (KHS)'"><xsl:text>af408d3d-5b7c-4808-a81e-81706fc0de0f</xsl:text></xsl:when>
        <xsl:when test=".='3 s Präsenzbestand'"><xsl:text>31d3f7b2-5a57-4352-8d54-293c396af4c1</xsl:text></xsl:when>
        <xsl:when test=".='4 d Fernleihe - passiv'"><xsl:text>ebfe3eba-be17-41ed-9ae9-6f7d20b1eba5</xsl:text></xsl:when>
        <xsl:when test=".='5 i nur für den Lesesaal'"><xsl:text>e69e21d4-0484-42ba-a5a9-9f34330ce52e</xsl:text></xsl:when>
        <xsl:when test=".='8 e Studienkolleg'"><xsl:text>0b903d57-37e6-44c0-8891-d736367a408d</xsl:text></xsl:when>
        <xsl:when test=".='9 a bestellt (Erwerbung)'"><xsl:text>b435a58b-3183-488e-884b-defd9225e3ce</xsl:text></xsl:when>
        <xsl:when test=".='9 f Nur BGP-kein Zugriff-verpackt (Bau)'"><xsl:text>05e5a4ca-08f5-44ba-8a78-b09cf6b67257</xsl:text></xsl:when>
        <xsl:when test=".='9 g nicht ausleihbar'"><xsl:text>c21b9928-023e-4e96-9281-59630de3ad8b</xsl:text></xsl:when>
        <xsl:when test=".='9 z nicht ausleihbar'"><xsl:text>154e5c51-5d56-40ca-99fe-a2bbbed8d564</xsl:text></xsl:when>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

</xsl:stylesheet>
