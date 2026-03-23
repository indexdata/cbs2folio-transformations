<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Generates reference records for FOLIO installations from codes2uuid mapping xls scripts. xsl:when are processed when containing an xsl:text element. -->

    <xsl:variable name="xsl-name-liste" select="('itemNoteTypeId','holdingsNoteTypeId','materialTypeId','identifierTypeId','sourceId','permanentLoanTypeId',
        'instanceNoteTypeId','alternativeTitleTypeId','natureOfContentTermIds/arr/i','contributorTypeId','classificationTypeId','holdingsTypeId','modeOfIssuanceId','instanceRelationshipTypeId')"/>
    <xsl:variable name="api-name-liste" select="('item-note-types','holdings-note-types','material-types','identifier-types','holdings-sources','loan-types',
        'instance-note-types','alternative-title-types','nature-of-content-terms','contributor-types','classification-types','holdings-types','modes-of-issuance','instance-relationship-types')"/>
    <xsl:variable name="source-name-liste" select="('folio','hebis','hebis','K10plus','folio','','local','local','local','marcrelator','local','folio','rdamodeissue','')"/>
    <xsl:variable name="hascode-liste" select="(false(),false(),false(),false(),false(),false(),false(),false(),false(),true(),false(),false(),false(),false())"/>
 
    <xsl:template match="xsl:when[index-of($xsl-name-liste,ancestor::xsl:template/@match)>0 and xsl:text]">
            <xsl:variable name="text" select='substring-before(substring-after(@test,"&apos;"),"&apos;")'/>
            <xsl:variable name="pos"><xsl:number format="001"/></xsl:variable>
            <xsl:variable name="i" select="index-of($xsl-name-liste,ancestor::xsl:template/@match)"/>
            <xsl:result-document href="{concat('referenceRecords/',tokenize(base-uri(),'/|\.')[last()-1],'/',$api-name-liste[$i],'/',$pos,'--',replace(substring($text,1,20),'[^a-zA-Z0-9]','_'),'--',.,'.json')}">
                <xsl:text>{&#10;</xsl:text>
                    <xsl:text>  "id": "</xsl:text><xsl:value-of select="."/>
                    <xsl:text>",&#10;</xsl:text>
                    <xsl:message><xsl:value-of select="."/></xsl:message>
                    <xsl:text>  "name": "</xsl:text><xsl:value-of select="$text"/>
                <xsl:if test="$hascode-liste[$i]">
                    <xsl:text>",&#10;</xsl:text>
                    <xsl:text>  "code": "</xsl:text><xsl:value-of select="$text"/>
                </xsl:if>
                <xsl:if test="$source-name-liste[$i]!=''">
                    <xsl:text>",&#10;</xsl:text>
                    <xsl:text>  "source": "</xsl:text><xsl:value-of select="$source-name-liste[$i]"/>
                </xsl:if>
                <xsl:text>"&#10;</xsl:text>
                <xsl:text>}&#10;</xsl:text>
            </xsl:result-document>
        </xsl:template>
        
        <xsl:template match="text()"/>
</xsl:stylesheet>
