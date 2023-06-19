<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2023-04-28 (YYYY-MM-DD) -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
      </delete>
    </record>
  </xsl:template>

  <xsl:template match="record">
    <record>
      <original>
        <xsl:copy-of select="metadata/*"/>
      </original>
      <instance>
        <xsl:apply-templates select="metadata"/>
      </instance>
    </record>
  </xsl:template>

  <!-- hebis: added new templates -->
  <xsl:template name="parse-021x">
    <xsl:if test="./subfield[@code='a']">
      <xsl:value-of select="translate(./subfield[@code='a'], '@', '')"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='d']">
      <xsl:value-of select="concat(' : ', ./subfield[@code='d'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='e' or @code='h']">
      <xsl:value-of select="concat(' / ', ./subfield[@code='e' or @code='h'])"/>
    </xsl:if>
      <xsl:if test="./subfield[@code='f']">
      <xsl:value-of select="concat(' = ', ./subfield[@code='f'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='r']">
      <xsl:value-of select="translate(./subfield[@code='r'], '@', '')"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="parse-036x">
    <xsl:choose>
      <xsl:when test="./subfield[@code='m']">
        <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='m']))"/>
        <xsl:if test="./subfield[@code='a']">
          <xsl:value-of select="concat(', ', translate(./subfield[@code='a'], '@', ''))"/>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(concat('. ', translate(./subfield[@code='a'], '@', '')))"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./subfield[@code='d']">
      <xsl:value-of select="concat(' : ', ./subfield[@code='d'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='e' or @code='h']">
      <xsl:value-of select="concat(' / ', ./subfield[@code='e' or @code='h'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='f']">
      <xsl:value-of select="concat(' = ', ./subfield[@code='f'])"/>
    </xsl:if>
    <xsl:if test="./subfield[@code='l']">
      <xsl:value-of select="concat(' ; ', ./subfield[@code='l'])"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="metadata">
 <!--   <source>K10plus</source> -->
    <source>hebis</source> <!-- hebis: source changed -->
    <xsl:variable name="ppn" select="datafield[@tag='003@']/subfield[@code='0']"/>
    <hrid>
      <xsl:value-of select="$ppn"/>
    </hrid>
    <xsl:for-each select="datafield[@tag='001D']/subfield[@code='0'][not(contains(.,'99-99'))]">
      <statusUpdatedDate>
        <xsl:call-template name="pica-to-iso-date">
          <xsl:with-param name="input" select="."/>
        </xsl:call-template>
      </statusUpdatedDate>
    </xsl:for-each>
    <xsl:if test="datafield[@tag='002@']">
      <!-- statusId -->
      <statusId>
        <xsl:variable name="stcode" select="substring(datafield[@tag='002@']/subfield[@code='0'], 3, 1)"/>
        <xsl:choose>
          <xsl:when test="$stcode='u'">Autopsie</xsl:when>
          <xsl:when test="$stcode='v'">Bibliografisch vollständig</xsl:when>
          <xsl:when test="$stcode='a'">Erwerbungsdatensatz</xsl:when>
          <xsl:when test="$stcode='i'">Datensatz für internen Gebrauch</xsl:when>
          <xsl:when test="$stcode='k'">Lösch-Status</xsl:when>
          <xsl:when test="$stcode='n'">Maschinell konvertierte Daten</xsl:when>
          <xsl:when test="$stcode='r'">Katalogisat ohne Autopsie</xsl:when>
          <xsl:when test="$stcode='t'">Verwaltungsdatensatz</xsl:when>
          <xsl:when test="$stcode='x'">Fremddatensatz</xsl:when>
          <xsl:when test="$stcode='y'">Katalogisat nach Autopsie im Vorläufigkeitsstatus</xsl:when>
          <xsl:when test="$stcode='B'">Maschinelle Einspielung, möglicherweise dublett</xsl:when>
          <xsl:when test="$stcode='N'">Zunächst verdeckt eingespieltes Novum</xsl:when>
          <xsl:when test="$stcode='X'">Inhalt oder Struktur ist zu überprüfen</xsl:when>
        </xsl:choose>
      </statusId>
      <modeOfIssuanceId>
        <xsl:variable name="mii" select="substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1)"/>
        <xsl:variable name="noc" select="datafield[@tag='013D']/subfield[@code='9']"/>
        <xsl:choose>
          <xsl:when test="($noc='106354256' or $noc='32609296X' or $noc='344907406' or $noc='153776951') and ($mii='a' or $mii='f' or $mii='F' or $mii='s' or $mii='v')">4fc0f4fe-06fd-490a-a078-c4da1754e03a</xsl:when>
          <xsl:when test="$mii='c'">f5cc2ab6-bb92-4cab-b83f-5a3d09261a41</xsl:when>
          <xsl:when test="$mii='b' or $mii='d'">068b5344-e2a6-40df-9186-1829e13cd344</xsl:when>
          <xsl:when test="$mii='z'">612bbd3d-c16b-4bfb-8517-2afafc60204a</xsl:when>
          <xsl:otherwise>9d18a02f-5897-4c31-9106-c9abb5c7ae8b</xsl:otherwise>
        </xsl:choose>
      </modeOfIssuanceId>
    </xsl:if>
    <!-- Instance type ID (resource type) -->
    <instanceTypeId>
      <!-- UUIDs for resource types -->
      <xsl:variable name="ctype" select="datafield[@tag='002C'][1]/subfield[@code='b']"/>
      <xsl:choose>
        <xsl:when test="$ctype='crd'">3363cdb1-e644-446c-82a4-dc3a1d4395b9</xsl:when>
        <!-- cartographic dataset -->
        <xsl:when test="$ctype='cri'">526aa04d-9289-4511-8866-349299592c18</xsl:when>
        <!-- cartographic image -->
        <xsl:when test="$ctype='crm'">80c0c134-0240-4b63-99d0-6ca755d5f433</xsl:when>
        <!-- cartographic moving image -->
        <xsl:when test="$ctype='crt'">408f82f0-e612-4977-96a1-02076229e312</xsl:when>
        <!-- cartographic tactile image -->
        <xsl:when test="$ctype='crn'">e5136fa2-1f19-4581-b005-6e007a940ca8</xsl:when>
        <!-- cartographic tactile three-dimensional form -->
        <xsl:when test="$ctype='crf'">2022aa2e-bdde-4dc4-90bc-115e8894b8b3</xsl:when>
        <!-- cartographic three-dimensional form -->
        <xsl:when test="$ctype='cod'">df5dddff-9c30-4507-8b82-119ff972d4d7</xsl:when>
        <!-- computer dataset -->
        <xsl:when test="$ctype='cop'">c208544b-9e28-44fa-a13c-f4093d72f798</xsl:when>
        <!-- computer program -->
        <xsl:when test="$ctype='ntv'">fbe264b5-69aa-4b7c-a230-3b53337f6440</xsl:when>
        <!-- notated movement -->
        <xsl:when test="$ctype='ntm'">497b5090-3da2-486c-b57f-de5bb3c2e26d</xsl:when>
        <!-- notated music -->
        <xsl:when test="$ctype='prm'">3be24c14-3551-4180-9292-26a786649c8b</xsl:when>
        <!-- performed music -->
        <xsl:when test="$ctype='snd'">9bce18bd-45bf-4949-8fa8-63163e4b7d7f</xsl:when>
        <!-- sounds -->
        <xsl:when test="$ctype='spw'">c7f7446f-4642-4d97-88c9-55bae2ad6c7f</xsl:when>
        <!-- spoken word -->
        <xsl:when test="$ctype='sti'">535e3160-763a-42f9-b0c0-d8ed7df6e2a2</xsl:when>
        <!-- still image -->
        <xsl:when test="$ctype='tci'">efe2e89b-0525-4535-aa9b-3ff1a131189e</xsl:when>
        <!-- tactile image -->
        <xsl:when test="$ctype='tcn'">e6a278fb-565a-4296-a7c5-8eb63d259522</xsl:when>
        <!-- tactile notated movement -->
        <xsl:when test="$ctype='tcm'">a67e00fd-dcce-42a9-9e75-fd654ec31e89</xsl:when>
        <!-- tactile notated music -->
        <xsl:when test="$ctype='tct'">8105bd44-e7bd-487e-a8f2-b804a361d92f</xsl:when>
        <!-- tactile text -->
        <xsl:when test="$ctype='tcf'">82689e16-629d-47f7-94b5-d89736cf11f2</xsl:when>
        <!-- tactile three-dimensional form -->
        <xsl:when test="$ctype='txt'">6312d172-f0cf-40f6-b27d-9fa8feaf332f</xsl:when>
        <!-- text -->
        <xsl:when test="$ctype='tdf'">c1e95c2b-4efc-48cf-9e71-edb622cf0c22</xsl:when>
        <!-- three-dimensional form -->
        <xsl:when test="$ctype='tdm'">3e3039b7-fda0-4ac4-885a-022d457cb99c</xsl:when>
        <!-- three-dimensional moving image -->
        <xsl:when test="$ctype='tdi'">225faa14-f9bf-4ecd-990d-69433c912434</xsl:when>
        <!-- two-dimensional moving image -->
        <xsl:when test="$ctype='zzz'">30fffe0e-e985-4144-b2e2-1e8179bdb41f</xsl:when>
        <!-- unspecified -->
        <xsl:otherwise>a2c91e87-6bab-44d6-8adb-1fd02481fc4f</xsl:otherwise>
        <!--  : other -->
      </xsl:choose>
    </instanceTypeId>
    <!-- Formats -->
    <instanceFormatIds>
      <arr>
        <xsl:for-each select="datafield[@tag='002E']">
          <i>
            <xsl:choose>
              <xsl:when test="./subfield[@code='b']='sg'">5642320a-2ab9-475c-8ca2-4af7551cf296</xsl:when>
              <!-- audio : audio cartridge -->
              <xsl:when test="./subfield[@code='b']='ss'">6d749f00-97bd-4eab-9828-57167558f514</xsl:when>
              <!-- audio : audiocassette -->
              <xsl:when test="./subfield[@code='b']='se'">485e3e1d-9f46-42b6-8c65-6bb7bd4b37f8</xsl:when>
              <!-- audio : audio cylinder -->
              <xsl:when test="./subfield[@code='b']='sd'">5cb91d15-96b1-4b8a-bf60-ec310538da66</xsl:when>
              <!-- audio : audio disc -->
              <xsl:when test="./subfield[@code='b']='sq'">7fde4e21-00b5-4de4-a90a-08a84a601aeb</xsl:when>
              <!-- audio : audio roll -->
              <xsl:when test="./subfield[@code='b']='st'">7612aa96-61a6-41bd-8ed2-ff1688e794e1</xsl:when>
              <!-- audio : audiotape reel -->
              <xsl:when test="./subfield[@code='b']='sw'">6a679992-b37e-4b57-b6ea-96be6b51d2b4</xsl:when>
              <!-- audio : audio wire reel -->
              <xsl:when test="./subfield[@code='b']='sz'">a3549b8c-3282-4a14-9ec3-c1cf294043b9</xsl:when>
              <!-- audio : other -->
              <xsl:when test="./subfield[@code='b']='si'">5bfb7b4f-9cd5-4577-a364-f95352146a56</xsl:when>
              <!-- audio : sound track reel -->
              <xsl:when test="./subfield[@code='b']='ck'">549e3381-7d49-44f6-8232-37af1cb5ecf3</xsl:when>
              <!-- computer : computer card -->
              <xsl:when test="./subfield[@code='b']='cb'">88f58dc0-4243-4c6b-8321-70244ff34a83</xsl:when>
              <!-- computer : computer chip cartridge -->
              <xsl:when test="./subfield[@code='b']='cd'">ac9de2b9-0914-4a54-8805-463686a5489e</xsl:when>
              <!-- computer : computer disc -->
              <xsl:when test="./subfield[@code='b']='ce'">e05f2613-05df-4b4d-9292-2ee9aa778ecc</xsl:when>
              <!-- computer : computer disc cartridge -->
              <xsl:when test="./subfield[@code='b']='ca'">f4f30334-568b-4dd2-88b5-db8401607daf</xsl:when>
              <!-- computer : computer tape cartridge -->
              <xsl:when test="./subfield[@code='b']='cf'">e5aeb29a-cf0a-4d97-8c39-7756c10d423c</xsl:when>
              <!-- computer : computer tape cassette -->
              <xsl:when test="./subfield[@code='b']='ch'">d16b19d1-507f-4a22-bb8a-b3f713a73221</xsl:when>
              <!-- computer : computer tape reel -->
              <xsl:when test="./subfield[@code='b']='cr'">f5e8210f-7640-459b-a71f-552567f92369</xsl:when>
              <!-- computer : online resource -->
              <xsl:when test="./subfield[@code='b']='cz'">fe1b9adb-e0cf-4e05-905f-ce9986279404</xsl:when>
              <!-- computer : other -->
              <xsl:when test="./subfield[@code='b']='ha'">cb3004a3-2a85-4ed4-8084-409f93d6d8ba</xsl:when>
              <!-- microform : aperture card -->
              <xsl:when test="./subfield[@code='b']='he'">fc3e32a0-9c85-4454-a42e-39fca788a7dc</xsl:when>
              <!-- microform : microfiche -->
              <xsl:when test="./subfield[@code='b']='hf'">b72e66e2-d946-4b01-a696-8fab07051ff8</xsl:when>
              <!-- microform : microfiche cassette -->
              <xsl:when test="./subfield[@code='b']='hb'">fc9bfed9-2cb0-465f-8758-33af5bba750b</xsl:when>
              <!-- microform : microfilm cartridge -->
              <xsl:when test="./subfield[@code='b']='hc'">b71e5ec6-a15d-4261-baf9-aea6be7af15b</xsl:when>
              <!-- microform : microfilm cassette -->
              <xsl:when test="./subfield[@code='b']='hd'">7bfe7e83-d4aa-46d1-b2a9-f612b18d11f4</xsl:when>
              <!-- microform : microfilm reel -->
              <xsl:when test="./subfield[@code='b']='hj'">cb96199a-21fb-4f11-b003-99291d8c9752</xsl:when>
              <!-- microform : microfilm roll -->
              <xsl:when test="./subfield[@code='b']='hh'">33009ba2-b742-4aab-b592-68b27451e94f</xsl:when>
              <!-- microform : microfilm slip -->
              <xsl:when test="./subfield[@code='b']='hg'">788aa9a6-5f0b-4c52-957b-998266ee3bd3</xsl:when>
              <!-- microform : microopaque -->
              <xsl:when test="./subfield[@code='b']='hz'">a0f2612b-f24f-4dc8-a139-89c3da5a38f1</xsl:when>
              <!-- microform : other -->
              <xsl:when test="./subfield[@code='b']='pp'">b1c69d78-4afb-4d8b-9624-8b3cfa5288ad</xsl:when>
              <!-- microscopic : microscope slide -->
              <xsl:when test="./subfield[@code='b']='pz'">55d3b8aa-304e-4967-8b78-55926d7809ac</xsl:when>
              <!-- microscopic : other -->
              <xsl:when test="./subfield[@code='b']='mc'">6bf2154b-df6e-4f11-97d0-6541231ac2be</xsl:when>
              <!-- projected image : film cartridge -->
              <xsl:when test="./subfield[@code='b']='mf'">47b226c0-853c-40f4-ba2e-2bd5ba82b665</xsl:when>
              <!-- projected image : film cassette -->
              <xsl:when test="./subfield[@code='b']='mr'">55a66581-3921-4b50-9981-4fe53bf35e7f</xsl:when>
              <!-- projected image : film reel -->
              <xsl:when test="./subfield[@code='b']='mo'">f0e689e8-e62d-4aac-b1c1-198ac9114aca</xsl:when>
              <!-- projected image : film roll -->
              <xsl:when test="./subfield[@code='b']='gd'">53f44ae4-167b-4cc2-9a63-4375c0ad9f58</xsl:when>
              <!-- projected image : filmslip -->
              <xsl:when test="./subfield[@code='b']='gf'">8e04d356-2645-4f97-8de8-9721cf11ccef</xsl:when>
              <!-- projected image : filmstrip -->
              <xsl:when test="./subfield[@code='b']='gc'">f7107ab3-9c09-4bcb-a637-368f39e0b140</xsl:when>
              <!-- projected image : filmstrip cartridge -->
              <xsl:when test="./subfield[@code='b']='mz'">9166e7c9-7edb-4180-b57e-e495f551297f</xsl:when>
              <!-- projected image : other -->
              <xsl:when test="./subfield[@code='b']='gt'">eb860cea-b842-4a8b-ab8d-0739856f0c2c</xsl:when>
              <!-- projected image : overhead transparency -->
              <xsl:when test="./subfield[@code='b']='gs'">b2b39d2f-856b-4419-93d3-ed1851f91b9f</xsl:when>
              <!-- projected image : slide -->
              <xsl:when test="./subfield[@code='b']='ez'">7c9b361d-66b6-4e4c-ae4b-2c01f655612c</xsl:when>
              <!-- stereographic : other -->
              <xsl:when test="./subfield[@code='b']='eh'">e62f4860-b3b0-462e-92b6-e032336ab663</xsl:when>
              <!-- stereographic : stereograph card -->
              <xsl:when test="./subfield[@code='b']='es'">c3f41d5e-e192-4828-805c-6df3270c1910</xsl:when>
              <!-- stereographic : stereograph disc -->
              <xsl:when test="./subfield[@code='b']='no'">5fa3e09f-2192-41a9-b4bf-9eb8aef0af0a</xsl:when>
              <!-- unmediated : card -->
              <xsl:when test="./subfield[@code='b']='nn'">affd5809-2897-42ca-b958-b311f3e0dcfb</xsl:when>
              <!-- unmediated : flipchart -->
              <xsl:when test="./subfield[@code='b']='nr'">926662e9-2486-4bb9-ba3b-59bd2e7f2a0c</xsl:when>
              <!-- unmediated : object -->
              <xsl:when test="./subfield[@code='b']='nz'">2802b285-9f27-4c86-a9d7-d2ac08b26a79</xsl:when>
              <!-- unmediated : other -->
              <xsl:when test="./subfield[@code='b']='na'">68e7e339-f35c-4be2-b161-0b94d7569b7b</xsl:when>
              <!-- unmediated : roll -->
              <xsl:when test="./subfield[@code='b']='nb'">5913bb96-e881-4087-9e71-33a43f68e12e</xsl:when>
              <!-- unmediated : sheet -->
              <xsl:when test="./subfield[@code='b']='nc'">8d511d33-5e85-4c5d-9bce-6e3c9cd0c324</xsl:when>
              <!-- unmediated : volume -->
              <xsl:when test="./subfield[@code='b']='zu'">98f0caa9-d38e-427b-9ec4-454de81a94d7</xsl:when>
              <!-- unspecified : unspecified -->
              <xsl:when test="./subfield[@code='b']='vz'">e3179f91-3032-43ee-be97-f0464f359d9c</xsl:when>
              <!-- video : other -->
              <xsl:when test="./subfield[@code='b']='vc'">132d70db-53b3-4999-bd79-0fac3b8b9b98</xsl:when>
              <!-- video : video cartridge -->
              <xsl:when test="./subfield[@code='b']='vf'">431cc9a0-4572-4613-b267-befb0f3d457f</xsl:when>
              <!-- video : videocassette -->
              <xsl:when test="./subfield[@code='b']='vd'">7f857834-b2e2-48b1-8528-6a1fe89bf979</xsl:when>
              <!-- video : videodisc -->
              <xsl:when test="./subfield[@code='b']='vr'">ba0d7429-7ccf-419d-8bfb-e6a1200a8d20</xsl:when>
              <!-- video : videotape reel -->
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </instanceFormatIds>
    <!-- Identifiers -->
    <identifiers>
      <arr>
        <!-- hebis: added missing tags: 004R, 004U, 004V, 006B, 006N, 006X, 007Y -->
        <xsl:for-each select="datafield[@tag='003S' or @tag='003@' or @tag='004A' or @tag='004P' or @tag='004J' or @tag='004K' or @tag='004D' or @tag='005A' or @tag='005I' or @tag='005P' or @tag='005D' or @tag='004F' or @tag='004M' or @tag='004I' or @tag='006A' or @tag='006B' or @tag='006G' or @tag='006T' or @tag='006U' or @tag='006Z' or @tag='006S' or @tag='006L' or @tag='006N' or @tag='006V' or @tag='006W' or @tag='006X' or @tag='006M' or @tag='004V' or @tag='004R' or @tag='004W' or @tag='004L' or @tag='004C' or @tag='004U' or @tag='003O' or @tag='003T' or @tag='003D' or @tag='007C' or @tag='007D' or @tag='007G' or @tag='007Y' or @tag='017K' or @tag='017L']">
          <xsl:choose>
            <xsl:when test="./@tag='004A' or @tag='004D' or @tag='004P' or @tag='005A' or @tag='005P' or @tag='005D' or @tag='004F' or @tag='004M' or @tag='004I' or @tag='004R' or @tag='004U' or @tag='004V' or @tag='006B'">
              <xsl:variable name="id-value">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='f'] and ./subfield[@code='0']">
                    <xsl:value-of select="concat(./subfield[@code='0'],' ',./subfield[@code='f'])"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='f']">
                    <xsl:value-of select="./subfield[@code='f']"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='0']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='004A'">ISBN</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='a'">ISBN der parallelen Ausgabe auf einem anderen Datenträger</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='o'">ISBN der parallelen Ausgabe im Fernzugriff</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='p'">ISBN der parallelen Druckausgabe</xsl:when>
                  <xsl:when test="./@tag='004P' and ./subfield[@code='S']='u'">ISBN für parallele Ausgabe in einer anderen physischen Form</xsl:when>
                  <xsl:when test="./@tag='004P'">ISBN einer Manifestation in anderer physischer Form</xsl:when>
                  <xsl:when test="./@tag='005A'">ISSN</xsl:when>
                  <xsl:when test="./@tag='005D'">Invalid ISSN</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='a'">ISSN für parallele Ausgaben auf einem anderen Datenträger</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='o'">ISSN für parallele Ausgaben im Fernzugriff</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='p'">ISSN für parallele Druckausgaben</xsl:when>
                  <xsl:when test="./@tag='005P' and ./subfield[@code='S']='f'">Fehlerhafte ISSN der parallelen Ausgabe</xsl:when>
                  <xsl:when test="./@tag='005P'">ISSN paralleler Ausgaben</xsl:when>
                  <xsl:when test="./@tag='004D'">Invalid ISBN</xsl:when>
                  <xsl:when test="./@tag='004F'">ISMN</xsl:when>
                  <xsl:when test="./@tag='004M'">ISRN</xsl:when>
                  <xsl:when test="./@tag='004I'">Formal falsche ISMN</xsl:when>
                  <!-- hebis: added missing labels -->
                  <xsl:when test="./@tag='004R'">Handle</xsl:when>
                  <xsl:when test="./@tag='004U'">URN</xsl:when>
                  <xsl:when test="./@tag='004V'">DOI</xsl:when>
                  <xsl:when test="./@tag='006B'">BNB</xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
            <!-- hebis: $i won't occur without $0, but $0 might occur without $i -->
            <xsl:when test="./@tag='007G' or @tag='007D'">
              <xsl:variable name="id-value">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='i']">
                    <xsl:value-of select="concat(./subfield[@code='i'],': ',./subfield[@code='0'])"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='0']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='007G'">Identnummer der erstkatalogisierenden Institution</xsl:when>
                  <!-- hebis: added missing labels -->
                  <xsl:when test="./@tag='007D'">Verlags-, Produktions- und Bestellnummer</xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
            <xsl:when test="./@tag='017K' or ./@tag='017L'">
              <xsl:variable name="id-value">
                <xsl:call-template name="join">
                  <xsl:with-param name="list" select="./subfield[@code='a' or @code='b' or @code='c' or @code='d']"/>
                  <xsl:with-param name="separator" select="' '"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <!-- TBD: Label has changed in K10plus in the meantime, hasn't it? -->
                  <xsl:when test="./@tag='017L'">Produktsigel Teilpaket, Arbeitsfeld für sonstige Produktsigel</xsl:when>
                  <xsl:otherwise>Produktsigel Gesamtpaket</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
            <xsl:when test="./subfield[@code='0']">
              <xsl:variable name="id-value">
                <!-- hebis: added missing subfield $i -->
                <xsl:choose>
                  <xsl:when test="./subfield[@code='i']">
                    <xsl:value-of select="concat(./subfield[@code='i'],': ',./subfield[@code='0'])"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='0']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="id-type">
                <xsl:choose>
                  <xsl:when test="./@tag='003O'">OCLC</xsl:when>
                  <xsl:when test="./@tag='003S'">PPN SWB</xsl:when>
                  <xsl:when test="./@tag='003@'">PPN</xsl:when>
                  <xsl:when test="./@tag='004J'">ISBN der Reproduktion</xsl:when>
                  <xsl:when test="./@tag='004K'">Formal falsche ISBN der Reproduktion</xsl:when>
                  <xsl:when test="./@tag='005I'">Autorisierte ISSN</xsl:when>
                  <xsl:when test="./@tag='006A'">LCCN</xsl:when>
                  <xsl:when test="./@tag='006G'">DNB-Nummer</xsl:when>
                  <xsl:when test="./@tag='004W'">Digital Object Identifier (DOI) im Druckwerk</xsl:when>
                  <xsl:when test="./@tag='003T'">SWB-OCLC-Nummer</xsl:when>
                  <xsl:when test="./@tag='006T'">CIP-Nummer</xsl:when>
                  <xsl:when test="./@tag='006U'">WV-Nummer</xsl:when>
                  <xsl:when test="./@tag='006Z'">ZDB-Nummer</xsl:when>
                  <xsl:when test="./@tag='006S'">SWB-PPN des umgelenkten Satzes</xsl:when>
                  <xsl:when test="./@tag='006L'">Weitere Verbundidentnummern</xsl:when>
                  <xsl:when test="./@tag='006X'">Identnummern weiterer Fremddatenlieferanten</xsl:when>
                  <xsl:when test="./@tag='003D'">PPN des umgelenkten GBV- bzw. K10plus-Satzes</xsl:when>
                  <xsl:when test="./@tag='006N'">Swets-Nummer</xsl:when>
                  <xsl:when test="./@tag='006V'">VD16-Nummer</xsl:when>
                  <xsl:when test="./@tag='006W'">VD17-Nummer</xsl:when>
                  <xsl:when test="./@tag='006M'">VD18-Nummer</xsl:when>
                  <xsl:when test="./@tag='007Y'">Sonstige Standardnummern</xsl:when>
                  <xsl:when test="./@tag='006Y'">Identnummern (allgemein)</xsl:when>
                  <xsl:when test="./@tag='007C'">CODEN</xsl:when>
                  <xsl:when test="./@tag='004L'">GTIN (vormals EAN)</xsl:when>
                  <xsl:when test="./@tag='004C'">Universal Product Code (UPC)</xsl:when>
                  <xsl:when test="./@tag='007D'">Verlags-, Produktions- und Bestellnummer</xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($id-value) &gt; 0">
                <i>
                  <value>
                    <xsl:value-of select="$id-value"/>
                  </value>
                  <identifierTypeId>
                    <xsl:value-of select="$id-type"/>
                  </identifierTypeId>
                </i>
              </xsl:if>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </arr>
    </identifiers>

    <!-- hebis: 
       - added missing tags and subfields (parts of multipart resources with dependent title, "contained works")
       - corrected order of tags and subfields, e.g. remainder of title and statement of responsibility of titles with subsets
       - separated transcription and Non Latin script
    -->

    <!-- title -->

          <!-- hebis: special feature at hebis, 036A/XY doesn't exist at GBV -->
          <xsl:variable name="title-036A">
            <xsl:for-each select="datafield[(@tag='036A') and (not(./subfield[@code='U']) or (substring(./subfield[@code='U'],1,4) = 'Latn'))]">
              <xsl:call-template name="parse-036x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-036A-ori">
            <xsl:for-each select="datafield[(@tag='036A') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
              <xsl:call-template name="parse-036x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-036C">
            <xsl:for-each select="datafield[(@tag='036C') and (not(./subfield[@code='U']) or (substring(./subfield[@code='U'],1,4) = 'Latn'))]">
              <xsl:call-template name="parse-036x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-036C-ori">
            <xsl:for-each select="datafield[(@tag='036C') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
              <xsl:call-template name="parse-036x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-036C-idx">
            <xsl:for-each select="datafield[(@tag='036C') and (not(./subfield[@code='U']) or (substring(./subfield[@code='U'],1,4) = 'Latn'))]">
              <xsl:if test="./subfield[@code='m']">
                <xsl:value-of select="concat(' ', ./subfield[@code='m'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='a']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="concat(' ', substring-after(./subfield[@code='a'], '@'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat(' ', ./subfield[@code='a'])"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="./subfield[@code='d']">
                <xsl:value-of select="concat(' ', ./subfield[@code='d'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='e' or @code='h']">
                <xsl:value-of select="concat(' ', ./subfield[@code='e' or @code='h'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='f']">
                <xsl:value-of select="concat(' ', ./subfield[@code='f'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='l']">
                <xsl:value-of select="concat(' ', ./subfield[@code='l'])"/>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021A">
            <xsl:for-each select="datafield[(@tag='021A') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
              <xsl:call-template name="parse-021x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021A-ori">
            <xsl:for-each select="datafield[(@tag='021A') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
              <xsl:call-template name="parse-021x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021A-idx">
            <xsl:for-each select="datafield[(@tag='021A') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
              <xsl:if test="./subfield[@code='a']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="substring-after(./subfield[@code='a'], '@')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="./subfield[@code='d']">
                <xsl:value-of select="concat(' ', ./subfield[@code='d'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='e' or @code='h']">
                <xsl:value-of select="concat(' ', ./subfield[@code='e' or @code='h'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='f']">
                <xsl:value-of select="concat(' ', ./subfield[@code='f'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='r']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='r'][contains(., '@')]">
                    <xsl:value-of select="substring-after(./subfield[@code='r'], '@')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='r']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021C">
            <xsl:for-each select="datafield[(@tag='021C') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
              <xsl:choose>
                <xsl:when test="./subfield[@code='l']">
                  <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='l']))"/>
                  <xsl:if test="./subfield[@code='a']">
                     <xsl:value-of select="concat(', ', translate(./subfield[@code='a'], '@', ''))"/>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="normalize-space(concat('. ', translate(./subfield[@code='a'], '@', '')))"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021C-ori">
            <xsl:for-each select="datafield[@tag='021C']">
              <xsl:if test="(substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U']) ">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='l']">
                    <xsl:value-of select="normalize-space(concat('. ', ./subfield[@code='l']))"/>
                    <xsl:if test="./subfield[@code='a']">
                       <xsl:value-of select="concat(', ', translate(./subfield[@code='a'], '@', ''))"/>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="normalize-space(concat('. ', translate(./subfield[@code='a'], '@', '')))"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021C-idx">
            <xsl:for-each select="datafield[(@tag='021C') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
              <xsl:if test="./subfield[@code='l']">
                <xsl:value-of select="concat(' ', ./subfield[@code='l'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='a']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="concat(' ',substring-after(./subfield[@code='a'], '@'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat(' ', ./subfield[@code='a'])"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021M">
            <xsl:for-each select="datafield[(@tag='021M') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
                <xsl:value-of select="' | '"/>
              <xsl:call-template name="parse-021x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021M-ori">
            <xsl:for-each select="datafield[(@tag='021M') and (substring(./subfield[@code='U'],1,4) != 'Latn') and (./subfield[@code='U'])]">
                <xsl:value-of select="' | '"/>
              <xsl:call-template name="parse-021x"/>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021M-idx">
            <xsl:for-each select="datafield[(@tag='021M') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
              <xsl:value-of select="' '"/>
              <xsl:if test="./subfield[@code='a']">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                    <xsl:value-of select="substring-after(./subfield[@code='a'], '@')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="./subfield[@code='d']">
                <xsl:value-of select="concat(' ', ./subfield[@code='d'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='e' or @code='h']">
                <xsl:value-of select="concat(' ', ./subfield[@code='e' or @code='h'])"/>
              </xsl:if>
              <xsl:if test="./subfield[@code='f']">
                <xsl:value-of select="concat(' ', ./subfield[@code='f'])"/>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021N">
            <xsl:for-each select="datafield[(@tag='021N') and ((substring(./subfield[@code='U'],1,4) = 'Latn') or not(./subfield[@code='U']))]">
              <xsl:if test="./subfield[@code='a']">
                <xsl:value-of select="./subfield[@code='a']"/>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <xsl:variable name="title-021N-ori">
            <xsl:for-each select="datafield[(@tag='021N') and ((substring(./subfield[@code='U'],1,4) != 'Latn') or not(./subfield[@code='U']))]">
              <xsl:if test="./subfield[@code='a']">
                <xsl:value-of select="./subfield[@code='a']"/>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>

          <title>
            <xsl:choose>
              <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">
                <xsl:value-of select="normalize-space(substring-after($title-036C, '. '))"/>
                  <xsl:if test="$title-021A != '' and boolean(substring($title-021A, 1, 1) != ' ')">
                    <xsl:choose>
                      <xsl:when test="datafield[@tag='036C'][last()]/subfield[@code='l']">
                        <xsl:value-of select="concat(', ', $title-021A)"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat(' ; ', $title-021A)"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:if test="$title-021A != '' and boolean(substring($title-021A, 1, 1) = ' ')">
                    <xsl:value-of select="$title-021A"/>
                  </xsl:if>
              </xsl:when> 

              <!-- TBD: need for adjustment at GBV? Not sure about the subfields in PXB-format -->
              <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f' or substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'v') and datafield[@tag='036E'] and $title-021A = ''">
                <xsl:for-each select="datafield[@tag='036E'][1]/subfield">
                  <xsl:choose>
                    <xsl:when test="@code='a'">
                      <xsl:value-of select="translate(., '@', '')"/>
                    </xsl:when>
                    <xsl:when test="@code='h'">
                      <xsl:value-of select="concat(' / ', .)"/>
                    </xsl:when>
                    <xsl:when test="@code='l' or @code='m'">
                      <xsl:value-of select="concat(' ; ', .)"/>
                    </xsl:when>
                    <xsl:when test="@code='p'">
                      <xsl:value-of select="concat('. ', .)"/>
                    </xsl:when>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:when> 

              <xsl:when test="$title-021A != ''">
                <xsl:value-of select="concat($title-021A, $title-021C)"/>
                  <!-- hebis: ZDB special feature since RDA switch:
                              Edition Statement instead of subseries -->
                  <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'b') or boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'd')">
                    <xsl:if test="datafield[@tag='032@']/subfield[@code='a'] != ''">
                      <xsl:value-of select="concat('. ', datafield[@tag='032@']/subfield[@code='a'])"/>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="$title-021M != ''">
                    <xsl:value-of select="$title-021M"/>
                  </xsl:if>
                  <xsl:if test="$title-021N != ''">
                    <xsl:choose>
                      <xsl:when test="boolean(substring($title-021N, 1, 1) = '/')">
                        <xsl:value-of select="concat(' ', $title-021N)"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat(' | ', $title-021N)"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
              </xsl:when>
              <xsl:otherwise>KEIN TITEL, IM CBS PRÜFEN</xsl:otherwise>
            </xsl:choose>
          </title> 

          <indexTitle>
            <xsl:choose>
              <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">
                <xsl:value-of select="normalize-space(translate($title-036C-idx, '&#034;&#035;&#040;&#041;&#046;', ' '))"/>
                  <xsl:if test="$title-021A-idx != ''">
                    <xsl:value-of select="concat(' ', $title-021A-idx)"/>
                  </xsl:if>
              </xsl:when>

              <!-- TBD: need for adjustment at GBV? Not sure about the subfields in PXB-format -->
              <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f' or substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'v') and datafield[@tag='036E'] and $title-021A = ''">
                <xsl:for-each select="datafield[@tag='036E'][1]/subfield">
                  <xsl:choose>
                    <xsl:when test="@code='a'">
                      <xsl:choose>
                        <xsl:when test="./subfield[@code='a'][contains(., '@')]">
                          <xsl:value-of select="substring-after(., '@')"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@code='h' or @code='l' or @code='m' or @code='p'">
                      <xsl:value-of select="concat(' ', .)"/>
                    </xsl:when>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:when> 

              <xsl:when test="$title-021A-idx != ''">
                <xsl:value-of select="concat(translate($title-021A-idx, '&#034;&#035;&#040;&#041;&#046;', ' '), $title-021C-idx)"/>
                  <!-- hebis: ZDB special feature since the RDA switch:
                              Edition Statement instead of subseries -->
                  <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'b') or boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'd')">
                    <xsl:if test="datafield[@tag='032@']/subfield[@code='a'] != ''">
                      <xsl:value-of select="concat('. ', datafield[@tag='032@']/subfield[@code='a'])"/>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="$title-021M-idx != ''">
                    <xsl:value-of select="$title-021M-idx"/>
                  </xsl:if>
                  <xsl:if test="$title-021N != ''">
                    <xsl:value-of select="concat(' ', $title-021N)"/>
                  </xsl:if>
              </xsl:when>
              <xsl:otherwise>KEIN TITEL, IM CBS PRÜFEN</xsl:otherwise>
            </xsl:choose>
          </indexTitle>

    <!-- Alternative titles -->

    <!-- hebis: added missing tags: 021A + 036C (Non Latin script), 021M, 021N + 046D -->
    <xsl:if test="datafield[@tag='047C' or @tag='027A' or @tag='021F' or @tag='046C' or @tag='046D' or @tag='026C' or @tag='036C' or @tag='021A'] or datafield[@tag='022A'][@occurrence='00']">
      <alternativeTitles>
        <arr>

          <xsl:if test="not($title-021A-ori = '') or not($title-036C-ori = '') ">
           <i>
            <alternativeTitle>
              <xsl:choose>
                <xsl:when test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'f') and datafield[@tag='036C']">
                  <xsl:value-of select="normalize-space(substring-after($title-036C-ori, '. '))"/>
                  <xsl:if test="$title-021A-ori != ''  and boolean(substring($title-021A-ori, 1, 1) != ' ')">
                    <xsl:choose>
                      <xsl:when test="datafield[@tag='036C'][last()]/subfield[@code='l']">
                        <xsl:value-of select="concat(', ', $title-021A-ori)"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat(' ; ', $title-021A-ori)"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:if test="$title-021A-ori != '' and boolean(substring($title-021A-ori, 1, 1) = ' ')">
                    <xsl:value-of select="$title-021A-ori"/>
                  </xsl:if>
                </xsl:when> 
                <!-- f-record and tag 036E: Non Latin Script in the "series statement" section -->
                <xsl:otherwise>
                  <xsl:value-of select="concat($title-021A-ori, $title-021C-ori)"/>
                  <!-- hebis: ZDB special feature since RDA switch:
                              Edition Statement instead of subseries -->
                  <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'b') or boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) = 'd')">
                    <xsl:if test="datafield[@tag='032@']/subfield[@code='a'] != ''">
                      <xsl:value-of select="concat('. ', datafield[@tag='032@']/subfield[@code='a'])"/>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="$title-021M-ori != ''">
                    <xsl:value-of select="$title-021M-ori"/>
                  </xsl:if>
                  <xsl:if test="$title-021N-ori != ''">
                    <xsl:choose>
                      <xsl:when test="boolean(substring($title-021N-ori, 1, 1) = '/')">
                        <xsl:value-of select="concat(' ', $title-021N-ori)"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat(' | ', $title-021N-ori)"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </alternativeTitle>
            <alternativeTitleTypeId>Other title</alternativeTitleTypeId>
           </i>
          </xsl:if>

          <xsl:for-each select="datafield[@tag='047C' or @tag='027A' or @tag='026C']">
            <i>
              <alternativeTitle>
                <xsl:value-of select="translate(./subfield[@code='a'], '@', '')"/>
              </alternativeTitle>
              <alternativeTitleTypeId>
                <xsl:choose>
                  <xsl:when test="./@tag='047C'">Portion of title</xsl:when>
                  <xsl:when test="./@tag='026C'">Distinctive title</xsl:when>
                  <xsl:otherwise>Other title</xsl:otherwise>
                </xsl:choose>
              </alternativeTitleTypeId>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='021F']">
            <xsl:variable name="pta" select="./subfield[@code='a']"/>
            <xsl:variable name="ptd" select="./subfield[@code='d']"/>
            <xsl:variable name="pth" select="./subfield[@code='h']"/>
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="$ptd and $pth">
                    <xsl:value-of select="concat($pta, ' : ', $ptd, ' / ', $pth)"/>
                  </xsl:when>
                  <xsl:when test="$ptd">
                    <xsl:value-of select="concat($pta, ' : ', $ptd)"/>
                  </xsl:when>
                  <xsl:when test="$pth">
                    <xsl:value-of select="concat($pta, ' / ', $pth)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$pta"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Parallel title</alternativeTitleTypeId>
            </i>
          </xsl:for-each>
          <xsl:for-each select="datafield[@tag='046C']">
            <xsl:variable name="vti" select="./subfield[@code='i']"/>
            <xsl:variable name="vta" select="./subfield[@code='a']"/>
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="$vti and $vta">
                    <xsl:value-of select="concat($vti, ': ', $vta)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$vta"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Other title</alternativeTitleTypeId> 
            </i>
          </xsl:for-each>

          <!-- hebis: added missing tag -->
          <xsl:for-each select="datafield[@tag='046D']">
            <xsl:variable name="vti" select="./subfield[@code='i']"/>
            <xsl:variable name="vta" select="./subfield[@code='a']"/>
            <i>
              <alternativeTitle>
                <xsl:choose>
                  <xsl:when test="$vti and $vta">
                    <xsl:if test="./subfield[@code='z'] = 'e'">Frühester </xsl:if>
                    <xsl:value-of select="concat($vti, ': ', $vta)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$vta"/>
                  </xsl:otherwise>
                </xsl:choose>
              </alternativeTitle>
              <alternativeTitleTypeId>Other title</alternativeTitleTypeId>
            </i>
          </xsl:for-each>

          <!-- hebis: added missing subfields -->
          <xsl:for-each select="datafield[@tag='022A']">
            <i>
              <alternativeTitle>
               <xsl:variable name="con-name">
                <xsl:choose>
                 <!-- TBD: need for discussion: Expansion
                           $8 solution won't work at GBV if there is a creator! -->
                  <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')]">
                    <xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='8']">
                    <xsl:value-of select="./subfield[@code='8']"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:when test="@code='f' or @code='g'">
                          <xsl:value-of select="concat(' (',.,')')"/>
                        </xsl:when>
                        <xsl:when test="@code='m' or @code='n'or @code='l' or @code='r' or @code='x'">
                          <xsl:value-of select="concat(', ',.)"/>
                        </xsl:when>
                        <xsl:when test="@code='p' or @code='s'">
                          <xsl:value-of select="concat('. ',.)"/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="subfield">
                  <xsl:choose>
                    <xsl:when test="@code='k' or @code='h'">
                      <xsl:value-of select="concat('. ',.)"/>
                    </xsl:when>
                    <xsl:when test="@code='o'">
                      <xsl:value-of select="concat('; ',.)"/>
                    </xsl:when>
                  </xsl:choose> 
                </xsl:for-each>
              </xsl:variable>
              <xsl:value-of select="$con-name"/>
              </alternativeTitle>
              <alternativeTitleTypeId>Uniform title</alternativeTitleTypeId>
            </i>
          </xsl:for-each>

        </arr>
      </alternativeTitles>
    </xsl:if>
    <!-- Contributors -->
    <xsl:if test="datafield[@tag='028A' or @tag='028B' or @tag='028C' or @tag='028G' or @tag='029A']">
      <contributors>
        <arr>
          <xsl:for-each select="datafield[@tag='028A' or @tag='028B' or @tag='028C' or @tag='028G']">
            <xsl:if test="./subfield[@code='a' or @code='A' or @code='P' or @code='8']">
              <xsl:variable name="con-name">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')]">
                    <xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='8']">
                    <xsl:value-of select="./subfield[@code='8']"/>
                  </xsl:when>
                  <!-- hebis: added missing subfields and corrected ISBD punctuation -->
                  <!-- TBD: Need for clarification/discussion 
                            Expansion and capital letters D, C, N, especially L -->
                  <xsl:when test="./subfield[@code='a' or @code='P']">
                    <xsl:value-of select="./subfield[@code='a' or @code='P']"/>
                    <xsl:if test="./subfield[@code='d' or @code='D']">
                       <xsl:value-of select="concat(', ', ./subfield[@code='d' or @code='D'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='c' or @code='C']">
                       <xsl:value-of select="concat(' ', ./subfield[@code='c' or @code='C'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='n' or @code='N']">
                       <xsl:value-of select="concat(' ', ./subfield[@code='n' or @code='N'])"/>
                    </xsl:if>
                    <xsl:if test="./subfield[@code='l']"> <!-- or or @code='L' -->
                       <xsl:value-of select="concat(', ', ./subfield[@code='l'])"/> <!-- or or @code='L' -->
                    </xsl:if>
                    <xsl:if test="./subfield[@code='h']">
                       <xsl:value-of select="concat(' *', ./subfield[@code='h'],'*')"/>
                    </xsl:if>
                  </xsl:when>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($con-name) &gt; 0">
                <i>
                  <name>
                    <xsl:value-of select="$con-name"/>
                  </name>
                  <contributorNameTypeId>2b94c631-fca9-4892-a730-03ee529ffe2a</contributorNameTypeId>
                  <!-- personal name -->
                  <xsl:if test="@tag='028A'">
                    <primary>true</primary>
                  </xsl:if>
                  <xsl:if test="./subfield[@code='4']">
                    <contributorTypeId>
                      <xsl:value-of select="./subfield[@code='4']"/>
                    </contributorTypeId>
                  </xsl:if>
                  <xsl:if test="./subfield[@code='B']">
                    <contributorTypeText>
                      <xsl:value-of select="./subfield[@code='B']"/>
                    </contributorTypeText>
                  </xsl:if>
                </i>
              </xsl:if>
            </xsl:if>
          </xsl:for-each>
          <!-- Corporate authors-->
          <!-- hebis: added missing subfields and corrected ISBD punctuation -->
          <!-- TBD: Need for clarification/discussion 
                    Expansion and capital letters A, B, D, G, N, X in original code
          -->
          <xsl:for-each select="datafield[@tag='029A' or @tag='029F']">
            <xsl:if test="./subfield[@code='a' or @code='8']">
              <xsl:variable name="con-name">
                <xsl:choose>
                  <xsl:when test="./subfield[@code='8'][contains(., ' ; ID:')]">
                    <xsl:value-of select="substring-before(./subfield[@code='8'], ' ; ID:')"/>
                  </xsl:when>
                  <xsl:when test="./subfield[@code='8']">
                    <xsl:value-of select="./subfield[@code='8']"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                          <xsl:when test="@code='x' or @code='g'">
                             <xsl:value-of select="concat(', ',.)"/>
                          </xsl:when>
                          <xsl:when test="@code='b'">
                            <xsl:value-of select="concat('. ',.)"/>
                          </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                          <xsl:choose>
                            <xsl:when test="./subfield[@code='n']">
                              <xsl:value-of select="concat(' (',./subfield[@code='n'])"/>
                              <xsl:if test="./subfield[@code='d']">
                                <xsl:value-of select="concat(' : ',./subfield[@code='d'])"/>
                              </xsl:if>
                              <xsl:if test="./subfield[@code='c']">
                                <xsl:value-of select="concat(' : ',./subfield[@code='c'])"/>
                              </xsl:if>
                              <xsl:value-of select="')'"/>
                            </xsl:when>
                            <xsl:when test="./subfield[@code='d']">
                              <xsl:value-of select="concat(' (',./subfield[@code='d'])"/>
                              <xsl:if test="./subfield[@code='c']">
                                <xsl:value-of select="concat(' : ',./subfield[@code='c'])"/>
                              </xsl:if>
                              <xsl:value-of select="')'"/>
                            </xsl:when>
                            <xsl:when test="./subfield[@code='c']">
                              <xsl:value-of select="concat(' (',./subfield[@code='c'], ')')"/>
                            </xsl:when>
                         </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length($con-name) &gt; 0">
                <i>
                  <name>
                    <xsl:value-of select="$con-name"/>
                  </name>
                  <contributorNameTypeId>2e48e713-17f3-4c13-a9f8-23845bb210aa</contributorNameTypeId>
                  <xsl:if test="./subfield[@code='4']">
                    <contributorTypeId>
                      <xsl:value-of select="./subfield[@code='4']"/>
                    </contributorTypeId>
                  </xsl:if>
        				  <xsl:if test="./subfield[@code='B']">
                    <contributorTypeText>
                      <xsl:value-of select="./subfield[@code='B']"/>
                    </contributorTypeText>
                  </xsl:if>
                </i>
              </xsl:if>
            </xsl:if>
          </xsl:for-each>
        </arr>
      </contributors>
    </xsl:if>
    <!-- Publication -->
    <publication>
      <arr>
        <xsl:for-each select="datafield[@tag='033A' or @tag='033E' or @tag='033C']">
          <i>
            <place>
              <xsl:call-template name="join">
                <xsl:with-param name="list" select="./subfield[@code='p']"/>
                <xsl:with-param name="separator" select="' ; '"/>
              </xsl:call-template>
            </place>
            <publisher>
              <xsl:for-each select="./subfield[@code='n']">
                <xsl:variable name="pos" select="position()"/>
                <xsl:if test="../subfield[@code='z'][$pos] = 'f'">früher: </xsl:if>
                <xsl:if test="../subfield[@code='z'][$pos] = 'z'">später: </xsl:if>
                <xsl:value-of select="."/>
                <xsl:if test="../subfield[@code='h'][$pos]">
                  <xsl:value-of select="concat(' (', ../subfield[@code='h'][$pos], ')')"/>
                </xsl:if>
                <xsl:if test="$pos != last()"> ; </xsl:if>
              </xsl:for-each>
            </publisher>
            <xsl:if test="..//datafield[@tag='011@']">
              <dateOfPublication>
                <xsl:variable name="date-a" select="../datafield[@tag='011@']/subfield[@code='a']"/>
                <xsl:variable name="date-b" select="../datafield[@tag='011@']/subfield[@code='b']"/>
                <xsl:variable name="date-c" select="../datafield[@tag='011@']/subfield[@code='c']"/>
                <xsl:variable name="date-d" select="../datafield[@tag='011@']/subfield[@code='d']"/>
                <xsl:variable name="date-n" select="../datafield[@tag='011@']/subfield[@code='n']"/>
                <xsl:variable name="date-ab" select="concat($date-a, '-', $date-b)"/>
                <xsl:variable name="date-cd" select="concat($date-c, '-', $date-d)"/>
                <xsl:variable name="date-ac" select="concat($date-a, ' (', $date-c, ')')"/>
                <xsl:variable name="date-abcd" select="concat($date-ab, ' (', $date-cd, ')')"/>
                <xsl:choose>
                  <!-- hebis: If $n is present then only show $n -->
                  <xsl:when test="$date-n">
                    <xsl:value-of select="$date-n"/>
                  </xsl:when>
                  <xsl:when test="$date-d and $date-n">
                    <xsl:value-of select="concat($date-abcd, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:when test="$date-d">
                    <xsl:value-of select="$date-abcd"/>
                  </xsl:when>
                  <xsl:when test="$date-c and $date-n">
                    <xsl:value-of select="concat($date-ac, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:when test="$date-c">
                    <xsl:value-of select="$date-ac"/>
                  </xsl:when>
                  <xsl:when test="$date-b and $date-n">
                    <xsl:value-of select="concat($date-ab, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:when test="$date-b">
                    <xsl:value-of select="$date-ab"/>
                  </xsl:when>
                  <xsl:when test="$date-a and $date-n">
                    <xsl:value-of select="concat($date-a, ' (', $date-n, ')')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$date-a"/>
                  </xsl:otherwise>
                </xsl:choose>
              </dateOfPublication>
            </xsl:if>
            <role>
              <xsl:choose>
                <xsl:when test="./@tag = '033C'">Manufacturer</xsl:when>
                <xsl:when test="./@tag = '033E'">Distributor</xsl:when>
                <xsl:otherwise>Publisher</xsl:otherwise>
              </xsl:choose>
            </role>
          </i>
        </xsl:for-each>
      </arr>
    </publication>
    <!-- Publication frequency -->
	<xsl:if test="datafield[@tag='018@']">
      <publicationFrequency>
        <arr>
          <xsl:for-each select="datafield[@tag='018@']">
            <i>
              <xsl:choose>
                <xsl:when test="./subfield[@code='a']='d'">täglich</xsl:when>
				<xsl:when test="./subfield[@code='a']='t'">drei- bis fünfmal wöchentlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='c'">zweimal wöchentlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='w'">wöchentlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='j'">dreimal im Monat</xsl:when>
				<xsl:when test="./subfield[@code='a']='e'">vierzehntägig</xsl:when>
				<xsl:when test="./subfield[@code='a']='s'">halbmonatlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='m'">monatlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='b'">alle zwei Monate</xsl:when>
				<xsl:when test="./subfield[@code='a']='q'">vierteljährlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='i'">dreimal im Jahr</xsl:when>
				<xsl:when test="./subfield[@code='a']='f'">halbjährlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='a'">jährlich</xsl:when>
				<xsl:when test="./subfield[@code='a']='g'">alle zwei Jahre</xsl:when>
				<xsl:when test="./subfield[@code='a']='h'">alle drei Jahre</xsl:when>
				<xsl:when test="./subfield[@code='a']='z'">unregelmäßig</xsl:when>
				<xsl:otherwise/>
              </xsl:choose>
            </i>
          </xsl:for-each>
        </arr>
      </publicationFrequency>
    </xsl:if>
    <!-- Publication range -->
    <xsl:if test="datafield[@tag='031@']">
      <publicationRange>
        <arr>
          <i>
            <xsl:value-of select="datafield[@tag='031@']/subfield[@code='a']"/>
          </i>
        </arr>
      </publicationRange>
    </xsl:if>
    <!-- Electronic access -->
    <electronicAccess>
      <arr>
        <!-- hebis: took out "or @tag='017M' or @tag='017R'" --> 
        <xsl:for-each select="datafield[@tag='009P' or @tag='017C']">
          <xsl:if test="./@tag='009P' and ./subfield[@code='a']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='a']"/>
              </uri>
              <materialsSpecification>
                <xsl:value-of select="./subfield[@code='3']"/>
              </materialsSpecification>
              <publicNote>
                <xsl:value-of select="./subfield[@code='4']"/>
              </publicNote>
              <relationshipId>f5d0068e-6272-458e-8a81-b85e7b9a14aa</relationshipId>
              <!-- Resource -->
            </i>
          </xsl:if>
          <xsl:if test="./@tag='017C' and ./subfield[@code='u']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='u']"/>
              </uri>
              <materialsSpecification>
                <xsl:value-of select="./subfield[@code='3']"/>
              </materialsSpecification>
              <publicNote>
                <xsl:value-of select="./subfield[@code='4']"/>
              </publicNote>
              <relationshipId>f5d0068e-6272-458e-8a81-b85e7b9a14aa</relationshipId>
            </i>
          </xsl:if>
          <!-- hebis: moved to notes (Restrictions on Access Note)
		  <xsl:if test="./@tag='017R' and ./subfield[@code='u']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='u']"/>
              </uri>
              <materialsSpecification>
                <xsl:value-of select="./subfield[@code='g']"/>
              </materialsSpecification>
			  <linkText>
				<xsl:value-of select="./subfield[@code='a']"/>
			  </linkText>
              <relationshipId>0ce08069-8f5f-411b-b622-46674aa66a45</relationshipId> 
            </i>
          </xsl:if> -->
          <!-- hebis: moved to notes (Terms Governing Use and Reproduction Note) 
		  <xsl:if test="./@tag='017M' and ./subfield[@code='u']">
            <i>
              <uri>
                <xsl:value-of select="./subfield[@code='u']"/>
              </uri>
              <materialsSpecification>
                <xsl:value-of select="./subfield[@code='g']"/>
              </materialsSpecification>
			  <linkText>
				<xsl:value-of select="./subfield[@code='a']"/>
			  </linkText>
              <relationshipId>f781cb3d-af16-40f6-9d02-c24204ac6fdc</relationshipId> 
            </i>
          </xsl:if> -->
        </xsl:for-each>
      </arr>
    </electronicAccess>
    <!-- Notes -->
    <!-- hebis: added missing/new tags: 017M, 017R, 035E, 037C, 039B, 039C, 039D, 039E, 046K, 046U, 047I, 048H -->
    <xsl:if test="datafield[@tag='011B' or @tag='017M' or @tag='017R' or @tag='035E' or @tag='037A' or @tag='037C' or @tag='037I' or @tag='039B' or @tag='039C' or @tag='039D' or @tag='039E' or @tag='046P' or @tag='046L' or @tag='046K' or @tag='046U' or @tag='047I' or @tag='048H']">
      <notes>
        <arr>
          <xsl:for-each select="datafield[@tag='011B' or @tag='017M' or @tag='017R' or @tag='035E' or @tag='037A' or @tag='037C' or @tag='037I' or @tag='039B' or @tag='039C' or @tag='039D' or @tag='039E' or @tag='046P' or @tag='046K' or @tag='046L' or @tag='046U' or @tag='047I' or @tag='048H']">
            <i>
              <xsl:choose>
                <xsl:when test="./@tag='011B'">
                  <note>
                    <xsl:if test="./subfield[@code='b']">
                      <xsl:value-of select="concat(./subfield[@code='a'], '-', ./subfield[@code='b'])"/>
                    </xsl:if>
                    <xsl:if test="not(./subfield[@code='b'])">
                      <xsl:value-of select="./subfield[@code='a']"/>
                    </xsl:if>
                  </note>
                  <instanceNoteTypeId>Reproduction note</instanceNoteTypeId>
                </xsl:when>
                <xsl:when test="./@tag='037A'">
                  <note>
                    <xsl:choose>
                      <xsl:when test="./subfield[@code='A']">
                        <xsl:value-of select="concat(./subfield[@code='a'], ' (Quelle: ', ./subfield[@code='A'], ')')"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./subfield[@code='a']"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </note>
                  <instanceNoteTypeId>General note</instanceNoteTypeId>
                </xsl:when>

                <!-- hebis: added new tags for relations as text in order to depict introductory phrases, other qualifying information and horizontal relationships-->
                <!-- TBD: Need for discussion: Expansion -->
                <xsl:when test="./@tag='039B' or @tag='039C' or @tag='039D' or @tag='039E'">
                  <note>
                   <xsl:if test="./subfield[@code='i']">
                     <xsl:value-of select="./subfield[@code='i']"/>
                     <xsl:if test="./subfield[@code='n']">
                       <xsl:value-of select="concat(' ', ./subfield[@code='n'])"/>
                     </xsl:if>
                     <xsl:value-of select=" ': ' "/>
                   </xsl:if>
                   <xsl:for-each select="subfield">
                    <xsl:choose>
                      <xsl:when test="@code='8'">
                        <xsl:choose>
                          <xsl:when test="contains(., ' ; ID:')">
                            <xsl:value-of select="substring-before(@code='8', ' ; ID:')"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="."/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:choose>
                          <xsl:when test="@code='a' or @code='t'">
                            <xsl:value-of select="."/>
                          </xsl:when>
                          <xsl:when test="@code='l'">
                            <xsl:value-of select="concat( . , '. ' )"/>
                          </xsl:when>
                          <xsl:when test="@code='d' or @code='g' or @code='h' or @code='p'">
                            <xsl:value-of select="concat('. - ', . )"/>
                          </xsl:when>
                          <xsl:when test="@code='e'">
                            <xsl:value-of select="concat(' : ', . )"/>
                          </xsl:when>
                          <xsl:when test="@code='f'">
                            <xsl:value-of select="concat(', ', . )"/>
                          </xsl:when>
                          <xsl:when test="@code='C'">
                            <xsl:choose>
                              <xsl:when test="preceding-sibling::*[1]/@code='i' or preceding-sibling::*[1]/@code='n'">
                                <xsl:if test=". = 'ISBN' or . = 'ISMN' or . = 'ISSN' or . = 'DOI' or . = 'URN'">
                                  <xsl:value-of select="concat(. ,' ',following-sibling::*[1])"/>
                                </xsl:if>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:if test=". = 'ISBN' or . = 'ISMN' or . = 'ISSN' or . = 'DOI' or . = 'URN'">
                                  <xsl:value-of select="concat('. - ',  . ,' ',following-sibling::*[1])"/>
                                </xsl:if>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                        </xsl:choose> 
                      </xsl:otherwise>
                    </xsl:choose>
                   </xsl:for-each>
                  </note>
                  <xsl:choose>
                    <xsl:when test="./@tag='039C'">
                      <instanceNoteTypeId>Supplement note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='039D'">
                      <instanceNoteTypeId>Additional Physical Form Available note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:otherwise>
                      <instanceNoteTypeId>General note</instanceNoteTypeId>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>

                <!-- hebis: added new tag for "Dissertation note" -->
                <xsl:when test="./@tag='037C'">
                  <note>
                    <xsl:for-each select="subfield">
                      <xsl:choose>
                        <xsl:when test="@code='a' or @code='d'">
                          <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:when test="@code='e' or @code='f'">
                          <xsl:value-of select="concat(', ',.)"/>
                        </xsl:when>
                        <xsl:when test="@code='g'">
                          <xsl:value-of select="concat(' (',.,')')"/>
                        </xsl:when>
                      </xsl:choose> 
                    </xsl:for-each>
                  </note>
                  <instanceNoteTypeId>Dissertation note</instanceNoteTypeId>
                </xsl:when>

                <xsl:otherwise>
                  <note>
                    <xsl:value-of select="./subfield[@code='a']"/>
                  </note>
                  <xsl:choose>
                    <!-- hebis: added new labels -->
                    <xsl:when test="./@tag='017M'">
                      <instanceNoteTypeId>Terms Governing Use and Reproduction note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='017R'">
                      <instanceNoteTypeId>Restrictions on Access note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='035E'">
                      <instanceNoteTypeId>Cartographic Mathematical Data</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='046K'">
                      <instanceNoteTypeId>Estimated publication date</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='046L'">
                      <instanceNoteTypeId>Language note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='046P'">
                      <instanceNoteTypeId>Numbering peculiarities note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='046U'">
                      <instanceNoteTypeId>Target Audience Note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='047I'">
                      <instanceNoteTypeId>Summary</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='037I'">
                      <instanceNoteTypeId>Reproduction note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:when test="./@tag='048H'">
                      <instanceNoteTypeId>System Details note</instanceNoteTypeId>
                    </xsl:when>
                    <xsl:otherwise>
                      <instanceNoteTypeId>General note</instanceNoteTypeId>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </i>
          </xsl:for-each>
        </arr>
      </notes>
    </xsl:if>
    <!-- Nature of contents -->
    <xsl:if test="datafield[@tag='013D']">
      <natureOfContentTermIds>
        <arr>
          <xsl:for-each select="datafield[@tag='013D']">
            <!-- TBD: need for discussion: also evaluate $a? -->
            <i>
              <xsl:choose>
                <xsl:when test="./subfield[@code='9']='132098628'">96879b60-098b-453b-bf9a-c47866f1ab2a</xsl:when>
                <!-- Hörbuch -->
                <xsl:when test="./subfield[@code='9']='106388258'">04a6a8d2-f902-4774-b15f-d8bd885dc804</xsl:when>
                <!-- Autobiografie -->
                <xsl:when test="./subfield[@code='9']='104814519'">f5908d05-b16a-49cf-b192-96d55a94a0d1</xsl:when>
                <!-- Bibliografie -->
                <xsl:when test="./subfield[@code='9']='104213493'">b6e214bd-82f5-467f-af5b-4592456dc4ab</xsl:when>
                <!-- Biografie -->
                <xsl:when test="./subfield[@code='9']='10566491X'">b82b3a0d-00fa-4811-96da-04f531da8ea8</xsl:when>
                <!-- Ausstellungskatalog -->
                <xsl:when test="./subfield[@code='9']='105681490'">c0d52f31-aabb-4c55-bf81-fea7fdda94a4</xsl:when>
                <!-- Erlebnisbericht -->
                <xsl:when test="./subfield[@code='9']='104400986'">b29d4dc1-f78b-48fe-b3e5-df6c37cdc58d</xsl:when>
                <!-- Festschrift -->
                <xsl:when test="./subfield[@code='9']='104450835'">631893b6-5d8a-4e1a-9e6b-5344e2945c74</xsl:when>
                <!-- Bildband -->
                <xsl:when test="./subfield[@code='9']='104712805'">31572023-f4c9-4cf3-80a2-0543c9eda884</xsl:when>
                <!-- Literaturbericht -->
                <xsl:when test="./subfield[@code='9']='826484824'">073f7f2f-9212-4395-b039-6f9825b11d54</xsl:when>
                <!-- Konferenzschrift -->
                <xsl:when test="./subfield[@code='9']='10467444X'">4570a93e-ddb6-4200-8e8b-283c8f5c9bfa</xsl:when>
                <!-- Forschungsbericht -->
                <xsl:when test="./subfield[@code='9']='104383704'">44cd89f3-2e76-469f-a955-cc57cb9e0395</xsl:when>
                <!-- Schulbuch -->
                <xsl:when test="./subfield[@code='9']='104189037'">9419a20e-6c8f-4ae1-85a7-8c184a1f4762</xsl:when>
                <!-- Reisebericht -->
                <xsl:when test="./subfield[@code='9']='32609296X'">2fbc8a7b-b432-45df-ba37-46031b1f6545</xsl:when>
                <!-- Website -->
                <xsl:when test="./subfield[@code='9']='104616091'">71b43e3a-8cdd-4d22-9751-020f34fb6ef8</xsl:when>
                <!-- Bericht -->
                <xsl:when test="./subfield[@code='9']='105825778'">94f6d06a-61e0-47c1-bbcb-6186989e6040</xsl:when>
                <!-- Hochschulschrift -->
                <xsl:when test="./subfield[@code='9']='104377402'">acceb2d6-4f05-408f-9a88-a92de26441ce</xsl:when>
                <!-- Comic -->
                <xsl:when test="./subfield[@code='9']='104628669'">536da7c1-9c35-45df-8ea1-c3545448df92</xsl:when>
                <!-- Monografische Reihe -->
                <xsl:when test="./subfield[@code='9']='10454466X'">0abeee3d-8ad2-4b04-92ff-221b4fce1075</xsl:when>
                <!-- Zeitschrift -->
                <xsl:when test="./subfield[@code='9']='106108832'">ebbbdef1-00e1-428b-bc11-314dc0705074</xsl:when>
                <!-- Zeitung -->
                <xsl:otherwise/>
              </xsl:choose>
            </i>
          </xsl:for-each>
        </arr>
      </natureOfContentTermIds>
    </xsl:if>
    <!-- languages -->
    <xsl:if test="datafield[@tag='010@']/subfield[@code='a']">
      <languages>
        <arr>
          <xsl:for-each select="datafield[@tag='010@']/subfield[@code='a']">
            <i>
              <xsl:value-of select="."/>
            </i>
          </xsl:for-each>
        </arr>
      </languages>
    </xsl:if>
	<!-- series -->
    <!-- hebis: added missing subfields -->
    <!-- TBD: need for adjustment at GBV? Not sure about the subfields in PXB-format -->
    <series>
     <arr>
      <xsl:if test="datafield[@tag='036E']/subfield[@code='a']">
          <xsl:for-each select="datafield[@tag='036E']">
            <i>
              <xsl:for-each select="subfield">
                <xsl:choose>
                  <xsl:when test="@code='a'">
                    <xsl:value-of select="translate(., '@', '')"/>
                  </xsl:when>
                  <xsl:when test="@code='h'">
                    <xsl:value-of select="concat(' / ', .)"/>
                  </xsl:when>
                  <xsl:when test="@code='l' or @code='m'">
                    <xsl:value-of select="concat(' ; ', .)"/>
                  </xsl:when>
                  <xsl:when test="@code='p'">
                    <xsl:value-of select="concat('. ', .)"/>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </i>
          </xsl:for-each>
      </xsl:if>

      <!-- hebis: added series statement for parts of multipart resources with independent title
                  and series statement for the second multipart resource (hebis-special-feature) 
      -->
      <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) != 'f') and datafield[@tag='036C']">
        <i>
          <xsl:value-of select="normalize-space(substring-after($title-036C, '. '))"/>
        </i>
      </xsl:if>

      <xsl:if test="boolean(substring(datafield[@tag='002@']/subfield[@code='0'], 2, 1) != 'f') and datafield[@tag='036C'] and $title-036C-ori != ''">
        <i>
          <xsl:value-of select="normalize-space(substring-after($title-036C-ori, '. '))"/>
        </i>
      </xsl:if>

      <xsl:if test="$title-036A != ''">
        <i>
         <xsl:value-of select="normalize-space(substring-after($title-036A, '. '))"/>
        </i>
      </xsl:if>

      <xsl:if test="$title-036A-ori != ''">
        <i>
         <xsl:value-of select="normalize-space(substring-after($title-036A-ori, '. '))"/>
        </i>
      </xsl:if>


     </arr>
    </series>
    <!-- physicalDescriptions -->
    <xsl:if test="datafield[@tag='034D' or @tag='034M' or @tag='034I' or @tag='034K']">
      <xsl:variable name="phd">
        <xsl:value-of select="datafield[@tag='034D']/subfield[@code='a']"/>
      </xsl:variable>
      <xsl:variable name="phm">
        <xsl:value-of select="datafield[@tag='034M']/subfield[@code='a']"/>
      </xsl:variable>
      <xsl:variable name="phi">
        <xsl:value-of select="datafield[@tag='034I']/subfield[@code='a']"/>
      </xsl:variable>
      <xsl:variable name="phk">
        <xsl:value-of select="datafield[@tag='034K']/subfield[@code='a']"/>
      </xsl:variable>
      <physicalDescriptions>
        <arr>
          <i>
            <xsl:choose>
            <!-- hebis: correction (depending on the constellation, not all tags were displayed) -->
              <xsl:when test="$phd != ''">
                <xsl:value-of select="$phd"/>
                <xsl:if test="$phm != ''">
                  <xsl:value-of select="concat(' : ', $phm)"/>
                </xsl:if>
                <xsl:if test="$phi != ''">
                  <xsl:value-of select="concat(' ; ', $phi)"/>
                </xsl:if>
                <xsl:if test="$phk != ''">
                  <xsl:value-of select="concat(' + ', $phk)"/>
                </xsl:if>
              </xsl:when>
              <xsl:when test="$phm != ''">
                <xsl:value-of select="$phm"/>
                <xsl:if test="$phi != ''">
                  <xsl:value-of select="concat(' ; ', $phi)"/>
                </xsl:if>
                <xsl:if test="$phk != ''">
                  <xsl:value-of select="concat(' + ', $phk)"/>
                </xsl:if>
              </xsl:when>
              <xsl:when test="$phi != ''">
                <xsl:value-of select="$phi"/>
                <xsl:if test="$phk != ''">
                  <xsl:value-of select="concat(' + ', $phk)"/>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat(' + ', $phk)"/>
              </xsl:otherwise>
            </xsl:choose>
          </i>
        </arr>
      </physicalDescriptions>
    </xsl:if>
    <!-- Edition -->
    <xsl:if test="datafield[@tag='032@']/subfield[@code='a']">
      <xsl:variable name="eda" select="datafield[@tag='032@']/subfield[@code='a']"/>
      <xsl:variable name="edh" select="datafield[@tag='032@']/subfield[@code='h']"/>
      <editions>
        <arr>
          <i>
            <xsl:choose>
              <xsl:when test="$edh">
                <xsl:value-of select="concat($eda, ' / ', $edh)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$eda"/>
              </xsl:otherwise>
            </xsl:choose>
          </i>
        </arr>
      </editions>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="text()"/>
  
  <xsl:template name="join">
    <xsl:param name="list"/>
    <xsl:param name="separator"/>
    <xsl:for-each select="$list">
      <xsl:value-of select="."/>
      <xsl:if test="position() != last()">
        <xsl:value-of select="$separator"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="pica-to-iso-date">
    <xsl:param name="input"/>
    <xsl:param name="suffix"/>
    <xsl:variable name="rawdate" select="substring-after($input, ':')"/>
    <xsl:variable name="day" select="substring-before($rawdate, '-')"/>
    <xsl:variable name="moyr" select="substring-after($rawdate, '-')"/>
    <xsl:variable name="month" select="substring-before($moyr, '-')"/>
    <xsl:variable name="shortyear" select="substring-after($moyr, '-')"/>
    <xsl:if test="$shortyear &gt; 50">
      <xsl:variable name="year" select="concat('19', $shortyear)"/>
      <xsl:value-of select="concat($year, '-', $month, '-', $day, $suffix)"/>
    </xsl:if>
    <xsl:if test="$shortyear &lt; 51">
      <xsl:variable name="year" select="concat('20', $shortyear)"/>
      <xsl:value-of select="concat($year, '-', $month, '-', $day, $suffix)"/>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>

