<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
	<xsl:key name="original" match="record/original/item" use="@epn"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- Map locations -->
	<xsl:template match="permanentLocationId">
		<xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
		<xsl:variable name="lower" select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ-./ ', 'abcdefghijklmnopqrstuvwxyz')"/>		
		<xsl:variable name="hridepn" select="preceding-sibling::hrid"/>
        <xsl:variable name="i" select="key('original', $hridepn)"/>
		<xsl:variable name="xselectioncode" select="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,3)"/>
		<permanentLocationId>
			<xsl:choose>
			<!-- TBs -->
				<xsl:when test="$lower='tbwirtschaft'">be74d3d6-67fd-40a7-9de1-331304cec787</xsl:when>
				<xsl:when test="$lower='tbwirtschaftmag'">be74d3d6-67fd-40a7-9de1-331304cec787</xsl:when>
				<xsl:when test="$lower='tbnautik'">be74d3d6-67fd-40a7-9de1-331304cec787</xsl:when>
				<xsl:when test="$lower='tbsozialw'">5fe3fd46-608e-4c89-b761-ac85fd5664c5</xsl:when>
				<xsl:when test="$lower='tbtechnik'">5fe3fd46-608e-4c89-b761-ac85fd5664c5</xsl:when>
				<xsl:when test="$lower='tbbhv'">03a47ee4-491e-4f4d-bb93-4c79baf8cb16</xsl:when>
				<xsl:when test="$lower='tbkunst'">8a358406-2f75-4eb3-98ca-6eec5cd5ce35</xsl:when>
				<xsl:when test="$lower='tbmusik'">861c7e7a-9b8a-49dc-a5d9-8853cb259c49</xsl:when>
			<!-- Uni/BBs -->
				<xsl:when test="$lower='juridicum'">e8956477-529c-4a0c-ae2e-d11701eb599d</xsl:when>
				<xsl:when test="$lower='bbnatnw1'">e2547a91-c342-4481-b92f-b58d9b45f872</xsl:when>
				<xsl:when test="$lower='bbwiwi'">e1f2b527-09fc-4088-82f8-78dc6f55d666</xsl:when>
			<!-- Uni/Zentrale -->
				<xsl:when test="$lower='magazin'">ab302f5d-221d-4b33-9efb-60fde83d3a87</xsl:when>
				<xsl:when test="$lower='magazinturme01'">47c13862-b9bd-48bf-8209-b525bd524fb5</xsl:when>
				<xsl:when test="$lower='magazinturme02'">6ec3f14b-b749-4f1a-ad09-04e234615f77</xsl:when>
				<xsl:when test="$lower='magazinturme03'">284ad5b8-62ff-45de-8561-c1f026f7272e</xsl:when>
				<xsl:when test="$lower='magazinturme04'">5a2994bf-6572-43e5-9cab-effcd7dcdbb7</xsl:when>
				<xsl:when test="$lower='mediathek'">65c7e4cb-0cf0-4b1c-a75c-6db98887b160</xsl:when>
				<xsl:when test="$lower='magazinzs'">abddeb0b-102a-4303-a607-c6e31d7d5a14</xsl:when>
				<xsl:when test="$lower='e01'">b5e6e8fe-d434-48b4-b43b-c1b096fba1d8</xsl:when>
				<xsl:when test="$lower='e02'">648f472e-490f-462b-83b6-bbbc8228b79d</xsl:when>
				<xsl:when test="$lower='e03'">6cd0441c-c5b9-4014-9367-bddcdcefdf04</xsl:when>
				<xsl:when test="$lower='e04'">e6704bd4-aa42-4d51-89aa-e0069c73bf64</xsl:when>
				<xsl:when test="$lower='zslesesaal'">5861890a-299d-4285-a024-83a559485408</xsl:when>
				<xsl:when test="starts-with($lower,'mf')">5d97f108-98ff-46a1-a571-6e50b33bd968</xsl:when>
				
			<!-- Rara -->
				<xsl:when test="$lower='handschrls'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>
				<xsl:when test="$lower='tiflis'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>
				<xsl:when test="$lower='eriwan'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>
				<xsl:when test="$lower='cassel'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>
				<xsl:when test="$lower='nsraubgut'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>
				<xsl:when test="$lower='rara2'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when> 
				<xsl:when test="$lower='ratsbibliothek'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>  
				<xsl:when test="$lower='restitut'">ca2c3dce-e474-4cc2-9432-0d1f893f95a6</xsl:when>

				<xsl:when test="starts-with($lower,'p0')">3d8ffe4e-fd43-484e-a556-0a5184d69ad7</xsl:when> <!-- Semesterapparate -->
				<xsl:when test="starts-with($lower,'dl')">a9ea1b6b-635b-4a51-9cd0-634a4d3d2419</xsl:when> <!-- Dauerleihgaben -->
				<xsl:when test="$lower='flsuub'">4ef5d244-79ca-40fb-a7a8-7bb5d168753f</xsl:when>
				
				<xsl:when test="starts-with($lower,'verlust')">96299353-ce46-42d7-92bf-277fa0e61c89</xsl:when>
				<xsl:when test="starts-with($lower,'vermisst')">0d854267-fe9b-4662-ac35-f8e1266979f8</xsl:when>
				<xsl:when test="starts-with($lower,'gel')">d989f800-479e-4ed2-b1a1-5eba2d757495</xsl:when> <!-- geloescht/gelöscht -->
				
				<xsl:otherwise> <!-- ohne SST/mit falschem SST -->
					<xsl:choose>
						<xsl:when test="$electronicholding='O'">cdfb944d-55b4-4802-b131-29d474888a13</xsl:when><!-- Online bbg O* --> 
						<xsl:when test="starts-with($xselectioncode,'x')">
							<xsl:choose>
								<xsl:when test="$xselectioncode='xba'">9dbc495e-3788-4e24-89ba-0ffcf19971d1</xsl:when> <!--Leerex. TB BHV-->
								<xsl:when test="$xselectioncode='xkd'">bfdee9f0-4a1d-4e0f-b7e3-806e813818f2</xsl:when> <!--Leerex. TB Musik-->
								<xsl:when test="$xselectioncode='xkw'">38e70812-ddf6-48dc-b40f-ac8a3591f2f6</xsl:when> <!--Leerex. TB Kunst-->
								<xsl:when test="$xselectioncode='xns'">37b09d92-6322-483f-b345-0077611454a6</xsl:when> <!--Leerex. TB Neustadtswall-->
								<xsl:when test="$xselectioncode='xnt'">37b09d92-6322-483f-b345-0077611454a6</xsl:when> <!--Leerex. TB Neustadtswall-->
								<xsl:when test="$xselectioncode='xwn'">41314d22-a34e-4988-a1a3-e1cf27132e8a</xsl:when> <!--Leerex. TB Werderstraße-->
								<xsl:when test="$xselectioncode='xww'">41314d22-a34e-4988-a1a3-e1cf27132e8a</xsl:when> <!--Leerex. TB Werderstraße-->
								<xsl:when test="$xselectioncode='xza'">1c4f7ec4-82d9-4025-9ecf-e69dc007c4a1</xsl:when> <!--Leerex. Zentrale-->
								<xsl:otherwise>52f2573c-35dc-44d8-b908-f97a3be51dd6</xsl:otherwise><!-- Fallback -->
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>52f2573c-35dc-44d8-b908-f97a3be51dd6</xsl:otherwise><!-- Fallback --> 
					</xsl:choose>
				
				</xsl:otherwise>
			</xsl:choose>
		</permanentLocationId>
	</xsl:template>
</xsl:stylesheet>