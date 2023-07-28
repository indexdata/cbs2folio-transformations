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
				<xsl:when test=".='A:'">66fa1e3d-821d-4a01-b7f4-c2745ec262e0</xsl:when>
				<xsl:when test=".='H:'">
					<xsl:choose>
						<xsl:when test="$electronicholding='O'">8dd8b541-8c56-45d2-93a8-ef6291c87d32</xsl:when>
						<xsl:otherwise>d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test=".='H:a'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:c'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:e'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:edz'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:ls'">6acc1cb2-19a2-4079-902c-a4c912c9e70f</xsl:when>
				<xsl:when test=".='H:lz'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:p'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:pb'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:s'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='H:za'">d88b46ae-8f03-4ceb-b957-710ecc9c4840</xsl:when>
				<xsl:when test=".='K:'">
					<xsl:choose>
						<xsl:when test="$electronicholding='O'">8dd8b541-8c56-45d2-93a8-ef6291c87d32</xsl:when>
						<xsl:otherwise>e5162952-0c2f-4563-9286-14d3c1414327</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test=".='K:a'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:c'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:e'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:edz'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:i'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:k'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:ls'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:p'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:pb'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:s'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='K:zpb'">e5162952-0c2f-4563-9286-14d3c1414327</xsl:when>
				<xsl:when test=".='O:'">8dd8b541-8c56-45d2-93a8-ef6291c87d32</xsl:when>
				<xsl:when test=".='H:acq'">b6dcb05a-9958-4757-a186-2983fc408dc7</xsl:when>
				<xsl:when test=".='K:acq'">7ad5f796-2f03-4f87-996a-9ea699710b41</xsl:when>
				<xsl:otherwise>fdcdb3bd-6b89-4646-ad46-601e3fedc8eb</xsl:otherwise>
			</xsl:choose>
		</permanentLocationId>
	</xsl:template>
</xsl:stylesheet>