<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Map locations -->
    <xsl:template match="permanentLocationId">
        <xsl:variable name="electronicholding" select="substring(//datafield[@tag='002@']/subfield[@code='0'],1,1)"/>
        <xsl:variable name="callnumber" select="string(../callNumber)"/>
        <xsl:variable name="itemLevelCallnumber" select="string(../itemLevelCallNumber)"/>
        <xsl:variable name="callnumberLower" select="lower-case(normalize-space($callnumber))"/>
        <xsl:variable name="itemLevelCallnumberLower" select="lower-case(normalize-space($itemLevelCallnumber))"/>
        <xsl:variable name="lower" select="lower-case(normalize-space(.))"/>

        <permanentLocationId>
            <xsl:choose>
                <!-- Online -->
                <xsl:when test="$electronicholding='O'">c123ec66-73b4-4eb6-a377-c37653ae47bf</xsl:when>
                           
                <!-- SUB Lesesäle -->
                <xsl:when test="$lower='sub-ls'">8219eef5-17b8-4df9-8f03-9ab0a69c459b</xsl:when>  
                
                <!-- SUB Lehrbuchsammlung -->
                <xsl:when test="$lower='sub-lbs'">5d344ff9-5958-4dd0-b186-ce9337d840d6</xsl:when>  
                
                <!-- SUB Speicherbibliothek -->
                <xsl:when test="$lower='sub-sbhh'">f1c842b6-c7c5-46e3-8004-23fc76e44f53</xsl:when>  
                <xsl:when test="starts-with($lower,'sub-sm')">f1c842b6-c7c5-46e3-8004-23fc76e44f53</xsl:when>
                
                <!-- SUB SB-Bereich -->
                <xsl:when test="$lower='sub-sb'">2313e4c2-16df-490f-971a-2038dc576fb1</xsl:when>  
              
                <!-- Linga-Bibliothek -->
                <xsl:when test="$lower='sub-linga'">6d632723-77fe-4ef4-b828-2514e4da3677</xsl:when>  
                
                <!-- BHH Bibliothek powered by SUB -->
                <xsl:when test="$lower='sub-biz'">8c583df4-665b-4686-b6ac-c18c7e620264</xsl:when>  
                       
                <!-- SUB Magazinbestand -->
                <xsl:when test="starts-with($lower,'sub')">4aaa107c-07c0-4feb-bee4-6b4dde41015a</xsl:when>
                
                <!-- Asien-Afrika-Institut - Bibliothek -->
                <xsl:when test="starts-with($lower,'18/303')">c67f2ebc-ae04-425b-bf1b-8a3ac69deeda</xsl:when>
                
                <!-- Bibliothek Evangelische Theologie und Religionen -->
                <xsl:when test="starts-with($lower,'18/161')">13bae055-2c39-441d-8bd2-88597ec9cf33</xsl:when>
                
                <!-- Bibliothek für Geisteswissenschaften (Gorch-Fock-Wall) -->
                <xsl:when test="$lower='18/295'">b07f2d01-c616-4ff9-b442-12a2c343faee</xsl:when>
                
                <!-- Bibliothek für Geisteswissenschaften (Philosophenturm) - Magazin -->
                <xsl:when test="$lower='18/309-mg'">8a67f73c-09b1-4435-80ea-5b761f6bba88</xsl:when>
               
                <!-- Bibliothek für Geisteswissenschaften (Philosophenturm) -->
                <xsl:when test="starts-with($lower,'18/309')">372b3e95-c9c1-40f5-940e-fd4105f169b1</xsl:when>
                
                <!-- Fachbibliothek Sozialwissenschaften - Magazin -->
                <xsl:when test="$lower='18/76-m'">d9616e62-ecd9-4fd2-bb1b-503ea4b4a93a</xsl:when>
                                
                <!-- Fachbibliothek Sozialwissenschaften -->
                <xsl:when test="starts-with($lower,'18/76')">6914f35a-ff86-4872-b01a-f95b14f1af0d</xsl:when>
                
                <!-- Fachbibliothek Wirtschaftswissenschaften - Magazin -->
                <xsl:when test="$lower='18/261-m'">0ac7e91a-9413-416f-8f1d-c2f69aa3a1cc</xsl:when>
                
                <!-- Fachbibliothek Wirtschaftswissenschaften -->
                <xsl:when test="starts-with($lower,'18/261')">6914f35a-ff86-4872-b01a-f95b14f1af0d</xsl:when>              
                
                <!-- Bibliothek MIN-Forum -->
                <xsl:when test="starts-with($lower,'18/228')">fc06fb86-8502-4122-9bbf-272d4f8508c3</xsl:when>   
                
                <!-- Fachbereich Chemie der Universität Hamburg - Bibliothek -->
                <xsl:when test="starts-with($lower,'18/228')">6ed58fea1-3198-45f2-a42d-e067828a869c</xsl:when>   
                
                <!-- Standortbibliothek Grindel -->
                <xsl:when test="$lower='18/'">abcc9dfd-a26c-4ca7-b40d-50a1b1133651</xsl:when>
                
                <!-- Standortbibliothek Klein Flottbek -->
                <xsl:when test="$lower='18/261-m'">497d2558-199f-4aff-8b31-24792c710542</xsl:when>
                                
                <!-- Fachbereichsbibliothek Kulturwissenschaften -->
                <xsl:when test="starts-with($lower,'18/308')">92996476-830a-41b8-abfd-2262ded22e7f</xsl:when> 
                
                <!-- Fachbereichsbibliothek Kulturwissenschaften - Teilbibliothek Musikwissenschaftliches Institut -->
                <xsl:when test="$lower='18/114'">13b4656f-6733-474f-8ed2-e18beebba39f</xsl:when>
                                
                <!-- Physikalische Institute Bahrenfeld -->
                <xsl:when test="starts-with($lower,'18/269')">5d5fe172-2ba2-48bc-919a-4374fde0889c</xsl:when> 
                
                <!-- Physikalische Institute Bahrenfeld - Theoretische Physik -->
                <xsl:when test="$lower='18/270'">a620a19b-e50d-4247-95d6-cd48e8d39246</xsl:when>
                
                <!-- Physikalische Institute Jungiusstrasse -->
                <xsl:when test="starts-with($lower,'18/47')">94ae0e8f-4d63-4745-aafa-b3df618623ca</xsl:when> 
                
                <!-- Martha-Muchow-Bibliothek -->
                <xsl:when test="starts-with($lower,'18/307')">34092982-6a21-4c3d-99ee-d48c5c7250e1</xsl:when> 
                
                <!-- Testbibliothek der Fakultät für Erziehungswissenschaft -->
                <xsl:when test="$lower='18/310'">19ab4987-a746-4c15-b080-4d82c3af6215</xsl:when>
                
                <!-- Zentralbibliothek Recht der Universität Hamburg -->
                <xsl:when test="starts-with($lower,'18/304')">6b9b186c-4f32-46b3-9644-e5bbf172bfe2</xsl:when> 
                
                <!--Ärztliche Zentralbibliothek -->
                <xsl:when test="$lower = ('18/64-lb', '18/64-ls', '18/64-fb')">878c05ef-3299-4b1c-9565-8d93cd19956b</xsl:when>
                
                <!--Ärztliche Zentralbibliothek - Magazinbestand -->
                <xsl:when test="$lower = ('18/64', '18/64-igem')">8cb094e6-d4be-4d11-9d93-4e5977004b32</xsl:when>
                                
                <!-- Institut für die Geschichte der deutschen Juden -->
                <xsl:when test="$lower='h 227'">c5fd7124-51cc-4f5c-9476-0a35c4b86991</xsl:when> 
                
                <!-- Europa-Kolleg Hamburg / Institute for European Integration -->
                <xsl:when test="$lower='18/254'">48c18654-2520-43ba-89df-997c5c65e3ba</xsl:when> 
                
                <!-- Forschungsstelle für Zeitgeschichte in Hamburg (FZH) - Bibliothek -->
                <xsl:when test="$lower=('h250', 'h 250')">b16ee920-9e0e-4083-9c25-0835ff78cad0</xsl:when> 
                
                <!-- Hamburger Bibliothek für Universitätsgeschichte -->
                <xsl:when test="$lower='18/296'">3fad2f2f-711c-4f21-b552-b7ca3e220b1b</xsl:when> 
                
                <!-- Nordost-Institut - Institut für Kultur und Geschichte der Deutschen in Nordosteuropa e.V. an der Universität Hamburg -->
                <xsl:when test="starts-with($lower,'18/313')">697140f7-7b3a-4670-a0e0-7e22cb0d27e0</xsl:when> 
               
                <xsl:otherwise>58ad8e9a-5711-4f3b-b767-280ad8b31afc</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
    <xsl:template match="status">
       <status>
           <name>
               <xsl:choose>
                   <xsl:when test="name = 'Restricted'">Withdrawn</xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="name"/>
                   </xsl:otherwise>
               </xsl:choose>
          </name>
       </status>
</xsl:template>
</xsl:stylesheet>
