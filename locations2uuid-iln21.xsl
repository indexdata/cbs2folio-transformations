<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- Map locations -->
	<xsl:template match="permanentLocationId">
		<xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
		<permanentLocationId>
			<xsl:choose>
			<!-- TBs -->
				<xsl:when test=".='TB Wirtschaft'">0d2c3271-917b-4719-938f-e6597dae8991</xsl:when>
				<xsl:when test=".='TB Wirtschaft/Mag.'">0d2c3271-917b-4719-938f-e6597dae8991</xsl:when>
				<xsl:when test=".='TB Nautik'">0d2c3271-917b-4719-938f-e6597dae8991</xsl:when>
				<xsl:when test=".='TB Sozialw.'">182fbd6b-6bd1-4a27-bbbc-867c2aa28f91</xsl:when>
				<xsl:when test=".='TB Technik'">182fbd6b-6bd1-4a27-bbbc-867c2aa28f91</xsl:when>
				<xsl:when test=".='TB BHV'">cac66b47-aa65-4403-90e8-d838c1f5ec0e</xsl:when>
				<xsl:when test=".='TB Kunst'">61d7524b-0508-4e33-a07f-5b71cc9bda4e</xsl:when>
				<xsl:when test=".='TB Musik'">08819597-e7fb-421a-98bd-5bf4f89e84b4</xsl:when>
			<!-- Uni/BBs -->
				<xsl:when test=".='Juridicum'">bcbddc8d-806c-430f-8b04-d514dcb620ce</xsl:when>
				<xsl:when test=".='BB Nat.-NW1'">09545336-c48d-4fb9-9e57-752f9b085ebf</xsl:when>
				<xsl:when test=".='BB WiWi'">efd3e3e5-b9be-4bfb-8400-b3cbea1dd86a</xsl:when>
			<!-- Uni/Zentrale -->
				<xsl:when test=".='Magazin'">ab302f5d-221d-4b33-9efb-60fde83d3a87</xsl:when>
				<xsl:when test=".='Magazinturm-E01'">55c2115c-cf87-4229-b63f-2b98814d7330</xsl:when>
				<xsl:when test=".='Magazinturm-E02'">eb2fb342-0326-43fd-902c-0b7d43529e40</xsl:when>
				<xsl:when test=".='Magazinturm-E03'">a43d8a7f-5b50-4e96-982f-eba9020a2b88</xsl:when>
				<xsl:when test=".='Magazinturm-E04'">3ed45e06-5fbc-42f1-9fc6-0834a7b5c5d0</xsl:when>
				<xsl:when test=".='Mediathek'">5f97bf6c-8e94-4ff6-b693-89dba2557153</xsl:when>
				<xsl:when test=".='Magazin ZS'">abddeb0b-102a-4303-a607-c6e31d7d5a14</xsl:when>
				<xsl:when test=".='E01'">08a95ad2-865b-4a36-8e30-7ae235ea4362</xsl:when>
				<xsl:when test=".='E02'">9fca61eb-af8a-4702-801e-8b143e71a55c</xsl:when>
				<xsl:when test=".='E03'">a49313b4-479e-466f-b894-9a66fac2ff42</xsl:when>
				<xsl:when test=".='E04'">9df56980-10ed-4a8e-809c-dae115ca11e4</xsl:when>
				<xsl:when test=".='ZS-Lesesaal'">96b8ec76-2438-4347-abd0-f39430137042</xsl:when>
				<xsl:when test="starts-with(.,'MF')">5a70506f-8c0d-47ed-ad9a-726196a7f739</xsl:when>
				
			<!-- Rara -->
				<xsl:when test=".='Handschr.-LS'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>
				<xsl:when test=".='Tiflis'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>
				<xsl:when test=".='Eriwan'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>
				<xsl:when test=".='Cassel'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>
				<xsl:when test=".='NS-Raubgut'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>
				<xsl:when test=".='Rara2'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when> 
				<xsl:when test=".='Ratsbibliothek'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>  
				<xsl:when test=".='Restitut'">d1819465-4ed0-4af8-8e87-cba2a3c27080</xsl:when>

				<xsl:when test="starts-with(.,'P0')">aaafff3d-1410-46e6-a417-25d69012c160</xsl:when> <!-- Semesterapparate -->
				<xsl:when test="starts-with(.,'DL')">95c9baea-0e78-4232-9b93-4d46b509056d</xsl:when> <!-- Dauerleihgaben -->
				<xsl:when test=".='FL-SUUB'">393e665c-623d-45f3-b068-9929e696b9ab</xsl:when>
				
				<xsl:when test="starts-with(.,'Verlust')">715205ee-321c-4586-bb61-09687c6bb4b3</xsl:when>
				<xsl:when test="starts-with(.,'vermisst')">8cf897b0-b707-4eb5-8c62-5fd5448994b3</xsl:when>
				<xsl:when test="starts-with(.,'gel')">6f334340-42c3-44b5-af71-4bb0b032125d</xsl:when> <!-- geloescht/gelöscht -->
				
				<xsl:otherwise> <!-- ohne SST/mit falschem SST -->
					<xsl:choose>
						<xsl:when test="$electronicholding='O'">cdfb944d-55b4-4802-b131-29d474888a13</xsl:when><!-- Online bbg O* --> 
						<xsl:otherwise>97ab7537-c997-4131-82a9-c4cd971b16f3</xsl:otherwise><!-- Fallback --> 
					</xsl:choose>
				
				</xsl:otherwise>
			</xsl:choose>
		</permanentLocationId>
	</xsl:template>
</xsl:stylesheet>