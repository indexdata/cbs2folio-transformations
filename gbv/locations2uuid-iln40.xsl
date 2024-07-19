<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Map locations -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
        <xsl:variable name="lower" select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
	<xsl:variable name="callnumber" select="../callNumber"/>    
        <permanentLocationId>
            <xsl:choose>
        	<!-- Online -->
                <xsl:when test="$electronicholding='O'">4606eee2-9416-4ed5-8b8d-792f83c0d0eb</xsl:when>
                <!-- Kein Standort -->   
                <xsl:when test=".=''">
			<xsl:choose>
                        <xsl:when test="$callnumber=''">16bbf38f-e728-4a07-80e2-389ed5fdb2c1</xsl:when> <!--Signatur auch leer-->
                        <xsl:otherwise>78091d58-5057-4f5d-bbcc-ca07eafd8cc1</xsl:otherwise> <!-- Nur Sonderstandort fehlt -->
                	</xsl:choose>
		</xsl:when>	
                <!-- BBF -->
                <xsl:when test="$lower='bbf : mag'">34e65fe3-e709-4734-b401-dd836353e526</xsl:when>
                <xsl:when test="starts-with($lower,'bbf')">a1f125d5-32ee-4f1d-b5a3-8e797ee4900f</xsl:when>
                <!-- BBM -->
                <xsl:when test="starts-with($lower,'bbm-mag')">5ced218c-80c7-4f00-a088-31e7d74b64b6</xsl:when>
                <xsl:when test="$lower='bbm-lbs'">e186937a-3eeb-47be-90a5-93fd8c972784</xsl:when>
                <xsl:when test="starts-with($lower,'bbm')">e41403fd-7c35-4780-80be-3665c40d5389</xsl:when>
                <!-- BBP -->
                <xsl:when test="starts-with($lower,'bbp')">ed279213-db43-4cb1-8fdb-655674f19d17</xsl:when>
                <!-- ZB -->
                <xsl:when test="starts-with($lower,'dau-leih')">48ebe9f1-1d67-466b-a03d-5352d42ad64a</xsl:when>
                <xsl:when test="starts-with($lower,'exz')">be69b790-9223-48e6-ad8a-fef2b5a6f685</xsl:when>
                <xsl:when test="starts-with($lower,'ls')">6251b033-bf96-4495-bc90-3b9bca1b0f9f</xsl:when>
                <xsl:when test="starts-with($lower,'mag-')">c9ce09e9-4495-406f-926c-fbd71cea135d</xsl:when>
                <xsl:when test="$lower='fmag'">a5b643bf-0e29-4ced-af78-14ad6aeba70a</xsl:when>
                <xsl:when test="$lower='gmag'">ada714ce-2915-4889-bf26-cc2dd0a85953</xsl:when>
                <xsl:when test="$lower='grass-archiv'">0acc50c4-b86c-4852-a458-2c7144dd2b25</xsl:when>
                <xsl:when test="$lower='tgmag'">fee6221a-49dc-44d8-9144-c7510fb411b6</xsl:when>
                <xsl:when test="$lower='nov'">b8c87a47-f1ba-401c-975e-655b00dc5999</xsl:when>
                <xsl:when test="$lower='zb-smag'">a7e2dd73-2dcc-4353-abf7-26584e544d8f</xsl:when>
                <xsl:when test="$lower='zb-theke'">0742eadf-7da1-4601-b0bd-a7a0bfce57be</xsl:when>
                <xsl:when test="$lower='zug'">5a8c08a8-afe1-4b23-abd8-f75178ae7653</xsl:when>
                <xsl:when test="$lower='bib'">f6ead64d-9497-47e5-89ee-31aa908d044f</xsl:when>
                <xsl:when test="$lower='inf'">60cc9c8c-d4ee-4f97-ad68-175e2bb9732c</xsl:when>
                <!-- BBWISO -->
                <xsl:when test="starts-with($lower,'bbwiso')">ee0e79c5-e964-4208-b5f4-0ae2d62a4352</xsl:when>
                <!-- WALDWEG -->
                <xsl:when test="$lower='bbw-did'">ee0e79c5-e964-4208-b5f4-0ae2d62a4352</xsl:when>
                <xsl:when test="$lower='bbw-erz'">85ba5670-e95a-40e2-af00-a5214e26b1cf</xsl:when>
                <xsl:when test="$lower='bbw-kjl'">c763080b-626c-4822-9f74-fd5ffcdf6a7c</xsl:when>
                <xsl:when test="$lower='bbw-paed'">8b96d60d-7d57-4b04-b4e4-0c8e2ed48ce5</xsl:when>
                <xsl:when test="$lower='bbw-psy'">65fa8246-3245-4305-8462-40ae05a19019</xsl:when>
                <xsl:when test="$lower='bbw-spo'">71283ee3-990d-4e70-ac55-f94b48684bb8</xsl:when>
                <xsl:when test="starts-with($lower,'bbw-theke')">e040eca7-05a9-4f81-af3d-3b74d2ca7c87</xsl:when>
                <xsl:when test="starts-with($lower,'bbw-s')">fc4a97d6-5e2e-46ac-b7ab-f949194baff2</xsl:when>
                <!-- ADW -->
                <xsl:when test="starts-with($lower,'adw')">ef6ffc8b-b830-4858-bc25-d15d00f7473c</xsl:when>
                <!-- BBK -->
                <xsl:when test="starts-with($lower,'als')">6d73e085-ce97-4616-8e84-566ea6acfb01</xsl:when>
                <xsl:when test="$lower='abib'">245cad89-2979-4df0-8671-9d79d8cea429</xsl:when>
                <xsl:when test="$lower='albs'">ab4f700a-e88f-4241-a74b-f9071f1d3924</xsl:when>
                <xsl:when test="$lower='bbk-allg'">56a2b96e-2b86-4977-9eb4-7ffce9d864dd</xsl:when>
                <xsl:when test="$lower='bbk-alth'">a21f0ba3-64d0-44d5-822f-4cff7f0e2086</xsl:when>
                <xsl:when test="$lower='bbk-alt'">757496c2-4551-463c-85d2-4ae64bbeef7d</xsl:when> 
                <xsl:when test="$lower='bbk-fem'">36e2cf75-7ff9-41cc-be73-5a258394b7e4</xsl:when> 
                <xsl:when test="$lower='bbk-fus'">94f60744-33b9-480f-bdbb-070494c5aa37</xsl:when>
                <xsl:when test="starts-with($lower,'bbk-hist')">a0351b9f-557c-4606-8375-5f1342d6153f</xsl:when>
                <xsl:when test="starts-with($lower,'bbk-hgw')">4b2865c3-2395-4cd7-9fab-460e01365544</xsl:when>
                <xsl:when test="starts-with($lower,'bbk-mus')">37dea158-5938-413f-980f-911ec75de85f</xsl:when>
                <xsl:when test="starts-with($lower,'bbk-rom')">a65f7b32-20cf-41ac-90cd-a85d9fbf999d</xsl:when>
                <xsl:when test="$lower='bbk-ihlf'">6dec9993-75c7-4e61-a52c-3761226a35fe</xsl:when> 
                <xsl:when test="$lower='bbk-inf'">14b0a0c4-bd11-4365-93c2-f0a7946d4db2</xsl:when> 
                <xsl:when test="$lower='bbk-klass'">d1c6e98d-cd44-4cba-b5c0-bd470beb6161</xsl:when> 
                <xsl:when test="$lower='bbk-kor'">a40b278c-e2f2-461b-a859-a5535fcf878e</xsl:when> 
                <xsl:when test="$lower='bbk-kaee'">c34eceeb-4c33-488a-9d8d-b07b7b3352c9</xsl:when> 
                <xsl:when test="$lower='bbk-mag'">8105aeb5-0f53-49fb-b3b7-fc8435a607ab</xsl:when> 
                <xsl:when test="$lower='bbk-phil'">59e140e9-3ab0-47f8-af96-112b989b49f0</xsl:when> 
                <xsl:when test="$lower='bbk-slav'">343d3005-ef2d-4195-b1c4-d991fd3d638c</xsl:when> 
                <xsl:when test="$lower='bbk-theke'">849fbc20-62b0-4001-b630-e1dcc970f443</xsl:when> 
                <xsl:when test="$lower='bbk-zmf'">c284c9d0-a0c2-4658-be6e-08cf94f78500</xsl:when> 
                <xsl:when test="starts-with($lower,'bbk-s')">06ff8585-6792-4216-b8e2-a9792b81cf0b</xsl:when>
                <!-- Passive Fernleihe -->
                <xsl:when test="starts-with($lower,'fl')">15c91a50-ab58-4ce9-b8d5-6350b33a4586</xsl:when>
                <!-- Kartensammlung -->
                <xsl:when test="$lower='kts-fh'">04d902a5-7c83-49d0-b57e-4107cfad4c47</xsl:when>
                <xsl:when test="$lower='kts'">5757a8a4-3258-4605-92c8-90fee4750e7a</xsl:when>
                <!-- Historisches Gebaeude -->
                <xsl:when test="$lower='hg-fb'">e899f698-e3f3-476d-888a-f780786092e7</xsl:when>
                <xsl:when test="$lower='hg-fdx'">380382b3-2c24-4dc8-ade6-f1cbac1f2105</xsl:when>
                <xsl:when test="$lower='hg-kjl'">9b0fb41d-3243-4028-84b4-ccf157f17dc1</xsl:when>
                <xsl:when test="$lower='hg-ls'">b44cc246-259a-4afc-8986-d23c937a3472</xsl:when>
                <xsl:when test="$lower='hg-mpi'">9d8a91fb-815b-4f4f-ab96-883a03ff3996</xsl:when>
                <xsl:when test="$lower='hg-pk'">930d9067-c44b-4a8f-971b-a6449f4071f6</xsl:when>
                <xsl:when test="$lower='hg-smag'">2237609e-0de0-400d-8821-81778d6049c2</xsl:when>
                <xsl:when test="$lower='hg-theke'">1791c943-220d-41fe-9a80-bc7a5ab7dd00</xsl:when>
                <xsl:when test="$lower='hg-vs'">5f470ba0-a3cd-4e19-ac9a-c936125411b3</xsl:when>
                <xsl:when test="starts-with($lower,'hg-or')">4e52232f-f430-463e-9319-8efbfc49c6b5</xsl:when>
                <xsl:when test="starts-with($lower,'hg-mag')">723fe83c-1c93-4639-84de-2f0d7d64297e</xsl:when>
                <!-- Handschriften und Seltene Drucke -->
                <xsl:when test="$lower='hsd-ls'">4424ab76-e4b6-495c-a798-eaeeff316618</xsl:when>
                <xsl:when test="$lower='hsd'">47acdb5a-1ce3-4532-b724-fc6117d7923d</xsl:when>
                <!-- Institute -->
                <xsl:when test=".='7/415'">017d603f-09ab-44fe-b1a0-a8dd41c54a98</xsl:when>
                <xsl:when test="starts-with(.,'7/037')">e418d287-5e5d-41a9-bf4a-a90d369417f5</xsl:when>
		<xsl:when test="starts-with(.,'7/042')">c2c69828-6716-47c4-aa64-758b4992ae2b</xsl:when>
		<xsl:when test="starts-with(.,'7/052')">41616a75-c85c-4c9b-8d30-aaf5eca41aae</xsl:when>
                <xsl:when test="starts-with(.,'7/')">82aabbe5-bbc0-4c1e-a8cd-a8c1f34729ce</xsl:when>
                
                <!-- Keine Zuordnung --> 
                <xsl:otherwise>2d57f0c0-6ead-4cd9-aa5a-bb7b3a38867a</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>
