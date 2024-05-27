<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Map locations 
         NOTE: The tests are the codes returned by 209A $f, not the location names in FOLIO -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
        <permanentLocationId>
            <xsl:choose>
				<xsl:when test=".='A-0'">2ee01a3e-7b02-4de7-bde9-7b6e2951c1ad</xsl:when>
				<xsl:when test=".='A1'">c2be10fa-8cd9-401f-a6cb-f46ee23c2936</xsl:when>
				<xsl:when test=".='A2'">469a99a9-f073-4778-9025-e40321284cec</xsl:when>
				<xsl:when test=".='Alumni'">18b553e7-b911-4fda-b932-5a30073aa88d</xsl:when>
				<xsl:when test=".='ArchHa'">c9bc64c4-a88e-4419-a444-f5f2331928e5</xsl:when>
				<xsl:when test=".='ArchivMo'">6a9624b5-ac38-489c-bb49-14785556c75a</xsl:when>
				<xsl:when test=".='BIngHa'">be1be2ff-429b-4f71-ab7f-712b9a16b379</xsl:when>
				<xsl:when test=".='BIngHaG'">69f2d4df-1622-4107-98a8-7fb81fb9e7c7</xsl:when>
				<xsl:when test=".='BINGTS'">9b1ef9a2-8865-4af3-9c33-6e91d3657f25</xsl:when>
				<!-- alte UUID 
				<xsl:when test=".='BINGTS'">c06c11b0-f9d2-4de5-aaf1-79b2bc43f57e</xsl:when>
				-->
				<xsl:when test=".='BRS'">45b69075-30c2-444a-8232-307fe1cc09c3</xsl:when>
				<xsl:when test=".='BsHa'">1d8c627a-f44e-441b-a6b9-bb0caa23aa65</xsl:when>
				<xsl:when test=".='BstMag'">db697909-61ac-4e57-9e52-bf55f0485e79</xsl:when>
				<xsl:when test=".='DB'">fd1a4ae3-9cc8-4c0c-8a38-a0b1c4ab739a</xsl:when>
				<xsl:when test=".='DF'">2cde5ddf-8993-451f-84ec-5dca0b525d35</xsl:when>
				<xsl:when test=".='DFO'">0a35a34e-c15e-440e-ab61-ac3d862d46f1</xsl:when>
				<xsl:when test=".='DIB'">a788cbdb-99a7-4600-a29d-8b8e3697e2af</xsl:when>
				<xsl:when test=".='DP'">b81a7235-88e7-4fed-86b1-fa3e3a797313</xsl:when>
				<xsl:when test=".='DSL'">a0c5638b-e2d7-4ef7-a713-c3cbfaa25c75</xsl:when>
				<xsl:when test=".='DVDLBS'">f0bc46c3-402f-4707-8a1e-2b1072e10b88</xsl:when>
				<xsl:when test=".='F-1'">bded1480-59d5-4566-a820-2f07eeb48965</xsl:when>
				<xsl:when test=".='F1'">ca93b4b4-1173-4927-a3ee-fb1149655682</xsl:when>
				<xsl:when test=".='F2'">30260ad1-9774-4493-9d30-551bc3238dd7</xsl:when>
				<xsl:when test=".='FL'">1876d574-0abb-4932-9cc6-b69713a72498</xsl:when>
				<!-- alte UUID 
				<xsl:when test=".='FL'">ff6ab6bb-3265-4dd3-b1c8-b7ea534a634a</xsl:when> 
				--> 
				<xsl:when test=".='GKIE'">26ca0ac4-3be8-463b-ad79-a7b508600d87</xsl:when>
				<xsl:when test=".='GKMA'">ca7d6bd6-afd0-4986-88e7-3dad69c9c9f7</xsl:when>
				<xsl:when test=".='Glei'">8633e979-37de-4c73-865e-d918df74b90c</xsl:when>
				<xsl:when test=".='IHZ'">75f605a6-4ba6-4b47-ac81-f462cb9b600b</xsl:when>
				<xsl:when test=".='Just'">aff8fd14-04d6-46a1-bbfb-4d7d1f590274</xsl:when>
				<xsl:when test=".='Kanz'">1370a610-1975-45a8-8b15-f97b358ae48e</xsl:when>
				<xsl:when test=".='KanzIR'">68e14d8c-38ee-485e-ae67-510105b982f6</xsl:when>
				<xsl:when test=".='KB'">3836c3f2-542b-471f-8980-c9d8df94526d</xsl:when>
				<xsl:when test=".='KoPro'">18e92753-12e0-4ec2-a242-fc882a7e1bf0</xsl:when>
				<xsl:when test=".='KuHa'">46376813-c95d-4599-ac7d-9e70b073ffda</xsl:when>
				<xsl:when test=".='LBS'">12381a17-0dc2-4719-8890-cf60b1892c1a</xsl:when>
				<xsl:when test=".='Mag'">04090125-00a3-4e31-9d2c-2e705e2be0cd</xsl:when>
				<xsl:when test=".='Media'">6bc0a667-623a-4b2b-909f-789aa754d0ad</xsl:when>
				<xsl:when test=".='MHa'">ca35a626-bac5-45dd-87b1-688ad28df26e</xsl:when>
				<!-- alte UUID 
				<xsl:when test=".='MHA'">3fcb03cf-b8b9-4423-a0cc-1b7e5fe48ab5</xsl:when>
				-->
				<xsl:when test=".='MHaG'">930529bd-a143-40b9-ba7d-3eae2c030352</xsl:when>
				<xsl:when test=".='neudeli'">3c7772eb-c5af-4b23-bad9-3c3b59868777</xsl:when>
				<xsl:when test=".='PR'">30632d04-16dc-461c-a6c3-01d5e16fb5c8</xsl:when>
				<xsl:when test=".='Rektor'">5ba52fe9-b6e7-460d-a113-4db024462823</xsl:when>
				<xsl:when test=".='SCC'">c141f799-d344-42e2-8940-8ad94023a9bc</xsl:when>
				<xsl:when test=".='SCCSoBi'">4e4689bb-5c7c-4a02-be5d-bb21c877f95c</xsl:when>
				<xsl:when test=".='Schw'">8a3ddf2d-706b-4809-9ff7-4b46887e3fba</xsl:when>
				<xsl:when test=".='SemArch'">7e627b59-c656-4f99-be38-bfbf61966784</xsl:when>
				<xsl:when test=".='SemGest'">a07eecf0-9c43-425a-9a5d-cb95776c3179</xsl:when>
				<xsl:when test=".='SemMed'">fbcf0e3c-3695-46cc-937d-f998bc1761ce</xsl:when>
				<xsl:when test=".='SI'">bbbf800d-b6a2-4b9a-82d0-a27675277ebc</xsl:when>
				<xsl:when test=".='SL'">61932856-93d2-4bee-87be-8200bca943e6</xsl:when>
				<xsl:when test=".='SoMag'">d1f8d790-8f28-4c93-bccc-73574fbce5c0</xsl:when>
				<xsl:when test=".='Sport'">2e9262a0-9263-4d0d-b0dc-e9cbaecd09c4</xsl:when>
				<xsl:when test=".='STAACS'">71e8d3d4-9dc8-4722-973e-41a128f58ef5</xsl:when>
				<xsl:when test=".='STO'">787be2a4-0c26-4aae-bcc2-5496f957e422</xsl:when>
				<xsl:when test=".='U-Archiv'">97edc4f3-bbc9-49e0-82d2-584f6673063a</xsl:when>
				<xsl:when test=".='UBHA'">fd9572d7-5fd8-470c-b0f5-d3083b85a6de</xsl:when>
				<xsl:when test=".='UE'">c6ce312a-33cc-4f8c-ab96-4ebc55f89141</xsl:when>
				<xsl:when test=".='UK'">3953f2cb-d959-4c66-9d3e-a370d9fa4091</xsl:when>
				<xsl:when test=".='WGest'">e5109a0a-b78b-4323-9894-fbc85192b51c</xsl:when>
				<xsl:when test=".='WVGest'">d4d741d4-08b2-4db3-95a3-c4ff5e1cf847</xsl:when>
                <xsl:when test="$electronicholding='O'">03acc590-3798-41a5-b2ce-1ae62d118d3e</xsl:when>
                <xsl:otherwise>5d95165f-d4c9-4797-ac13-60a30dd14dd6</xsl:otherwise>
				
				<!--
				diese UUID ist bei uns nicht definiert
				<xsl:when test=".[contains(.,'geloescht')]">7d5cf950-90f7-4b2b-9ba7-e97bb503c15f</xsl:when>
				-->
				
				<!--
				folgende Standorte gibt es nicht mehr
                <xsl:when test=".='ARCH'">d99c18f3-68c4-4237-8e0e-93309e196c29</xsl:when>
                <xsl:when test=".='ARCHIV'">67b479b5-8b79-4c85-8a66-09c4521b4f2f</xsl:when>
                <xsl:when test=".='BSTF1'">fc39a590-98d5-4317-8cd2-7667c38639a7</xsl:when>
                <xsl:when test=".='BSTF2'">1b5e4654-ae33-4a79-aa4a-57e67de1e0e3</xsl:when>
                <xsl:when test=".='BINGFA'">319869da-7289-4137-ae0e-6269d6944ca2</xsl:when>
                <xsl:when test=".='BINHHG'">0da7cb17-9196-433e-8362-be0cf0333fcb</xsl:when>
                <xsl:when test=".='ARCHHG'">95e4e248-5dff-41d3-8c49-3be928e5710c</xsl:when>
                <xsl:when test=".='ARCHH'">9fcf1b09-c4d5-4b9e-b46b-28b1bab994a2</xsl:when>
                <xsl:when test=".='Bst'">4ef28230-6c16-444b-a05b-12def1ce0199</xsl:when>
				-->
                
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>