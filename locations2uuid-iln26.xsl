<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

<!-- Map locations 
       NOTE: The tests are the codes returned by 209A $f, not the location names in FOLIO -->
   <xsl:template match="permanentLocationId">
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='A:'">3c4667f4-f634-4e6e-b1b5-2c489c60614f</xsl:when>
        <xsl:when test=".='H:'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
        <xsl:when test=".='H:a'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
        <!-- <xsl:when test=".='H:acq'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when> -->
        <xsl:when test=".='H:c'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
        <xsl:when test=".='H:e'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
        <xsl:when test=".='H:edz'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
        <xsl:when test=".='H:ls'">20324cea-5ae5-4c40-9ba7-d2ab34ccbfff</xsl:when>
		<xsl:when test=".='H:lz'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
		<xsl:when test=".='H:p'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
		<xsl:when test=".='H:pb'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
		<xsl:when test=".='H:s'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
		<xsl:when test=".='H:za'">dec1fac9-68dd-4483-9952-7242be6fe257</xsl:when>
		<xsl:when test=".='K:'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:a'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<!-- <xsl:when test=".='K:acq'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when> -->
		<xsl:when test=".='K:c'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:e'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:edz'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:i'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:k'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:ls'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:p'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:pb'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:s'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
		<xsl:when test=".='K:zpb'">ea56f9db-1acf-4c20-8b33-c008018f4699</xsl:when>
        <xsl:when test=".[contains(.,'acq')]">7d6f62ee-528a-4853-af5c-4a821bf1265f</xsl:when>
		<xsl:otherwise>184aae84-a5bf-4c6a-85ba-4a7c73026cd5</xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>
</xsl:stylesheet>