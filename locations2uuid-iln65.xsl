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
                    <xsl:when test="$electronicholding='O'">06439c70-5cad-46a0-a596-f6a61f09db29</xsl:when>
                <!-- bestellt -->   
                <xsl:when test="$callnumber='bestellt'">3c708275-c75c-47ae-a210-5820551765a8</xsl:when>
                <!-- Fernleihe -->
                <xsl:when test="$lower='fl'">f39316ae-8752-4fe4-adc6-593c1c38ddc7</xsl:when>  
                <!-- ZB Handapparate -->
                <!-- xsl:when test="matches($lower, '^M[1-3]-HA')">4fe61527-1a06-4850-b1bb-66b18ce77618</xsl:when> matches() funktioniert ab XSLT 2.0 (bzw. XPath 2.0). -->
                <xsl:when test="$lower='m1-ha'">4fe61527-1a06-4850-b1bb-66b18ce77618</xsl:when>
                <xsl:when test="$lower='m2-ha'">4fe61527-1a06-4850-b1bb-66b18ce77618</xsl:when>
                <xsl:when test="$lower='m3-ha'">4fe61527-1a06-4850-b1bb-66b18ce77618</xsl:when>
                <xsl:when test="$lower='vel-l'">4fe61527-1a06-4850-b1bb-66b18ce77618</xsl:when>
                <!-- ZB Magazin -->
                <xsl:when test="starts-with($lower,'m1')">c6c12585-e4df-4d6e-984a-1fd43232c8d5</xsl:when>
                <xsl:when test="starts-with($lower,'m2')">c6c12585-e4df-4d6e-984a-1fd43232c8d5</xsl:when>
                <xsl:when test="starts-with($lower,'m3')">c6c12585-e4df-4d6e-984a-1fd43232c8d5</xsl:when>
                <!-- xsl:when test="$lower='vel-l'">c6c12585-e4df-4d6e-984a-1fd43232c8d5</xsl:when-->
                <!-- ZB Historische Sammlungen -->
                <xsl:when test="$lower='hs'">a7f9dad1-a3d2-4047-be3b-93175906210f</xsl:when>
                <!-- ZB Kartensammlung -->
                <xsl:when test="$lower='akt'">02ed770a-cf91-4e8e-b807-690fe391f434</xsl:when>
                <xsl:when test="$lower='kt'">02ed770a-cf91-4e8e-b807-690fe391f434</xsl:when>
                <!-- ZB Lesesaal für hist. Bestände und Karten (Haus 13) -->
                <xsl:when test="$lower='ls13'">460871fe-54fb-4f42-bc53-2509af98bb3f</xsl:when>
                <!-- ZB Hauptlesesaal (Haus 50) -->
                <xsl:when test="$lower='ls50'">653de8ed-bfb0-421a-ba18-61f6332dab86</xsl:when>
                <!--Ha 1-->
                <xsl:when test="$lower='ha 1'">
                    <xsl:choose>
                        <!--Ha 1 Freihandbestand-->
                        <xsl:when test="starts-with($callnumber, 'VO-LS')">08008ae6-7b24-40f0-ab01-831559fe28e4</xsl:when> 
                        <!--Ha 1 Magazin-->
                        <xsl:otherwise>0e464ec5-d43d-42c5-83f5-f8011761b31e</xsl:otherwise> 
                    </xsl:choose>
                </xsl:when>
                <!-- Ha 1 Handapparate -->
                <xsl:when test="$lower='ha 1-ha'">f9ac8c5f-a369-45fb-a56d-c0b29ab8fc5b</xsl:when>
                <!-- Ha 4 Magazin -->
                <xsl:when test="$lower='ha 4-m'">ad35a75f-66ab-4b7e-a94a-5e7bc2ad988c</xsl:when>
                <!-- Ha 4 Sonderstandorte -->
                <xsl:when test="$lower='ha 4-b'">f28a606d-72d7-4971-a9f0-8f56d71e6aef</xsl:when>
                <xsl:when test="$lower='ha 4-c'">f28a606d-72d7-4971-a9f0-8f56d71e6aef</xsl:when>
                <!-- Ha 4 Handapparate -->
                <xsl:when test="$lower='ha 4-ha'">755e8112-0d34-4f36-8e9b-e8367bba38c7</xsl:when>
                <!-- Ha 4 Schlüssel/Zubehör -->
                <xsl:when test="$lower='ha 4h'">04de2aae-ddbc-4f57-9ca5-95419f91d69a</xsl:when>
                <!-- Ha 4 Freihandbestand -->
                <xsl:when test="starts-with($lower,'ha 4')">e767e4d7-6fbf-4e15-a69f-7efb9811b5ad</xsl:when>
                <xsl:when test="$lower='ha 8'">e767e4d7-6fbf-4e15-a69f-7efb9811b5ad</xsl:when>
                <xsl:when test="$lower='ha 8z'">e767e4d7-6fbf-4e15-a69f-7efb9811b5ad</xsl:when>
                <!--Ha 6 Sonderstandore-->
                <xsl:when test="$lower='ha 6d'">1ddbd38a-accb-4280-a748-535128c4eca5</xsl:when>
                <xsl:when test="$lower='ha 6' and starts-with($callnumber, '6J')">1ddbd38a-accb-4280-a748-535128c4eca5</xsl:when>
                <!--Ha 6 Handapparate-->
                <xsl:when test="$lower='ha 6-ha'">5054bd16-56df-4385-a687-072de4fbe13b</xsl:when>
                <!--Ha 6 Freihandbestand-->
                <xsl:when test="starts-with($lower,'ha 6')">d19f2f31-f4dd-4a63-a9c1-48df9f8a91dd</xsl:when>
                <!-- Ha 10 Magazin -->
                <xsl:when test="$lower='ha 10-m'">b0abc6b0-2d6f-4adb-bb9c-fd67bfda23d7</xsl:when>
                <!--Ha 10 Sonderstandore-->
                <xsl:when test="$lower='ha 10-l01'">d86d6d1d-35c9-4cf9-b49e-091a4884d60e</xsl:when>
                <xsl:when test="$lower='ha 10-ch'">d86d6d1d-35c9-4cf9-b49e-091a4884d60e</xsl:when>
                <xsl:when test="$lower='ha 10-s'">d86d6d1d-35c9-4cf9-b49e-091a4884d60e</xsl:when>
                <xsl:when test="$lower='ha 10-a'">d86d6d1d-35c9-4cf9-b49e-091a4884d60e</xsl:when>
                <!--Ha 10 Handapparate-->
                <xsl:when test="$lower='ha 10-ha'">11fdde23-673f-459d-9bde-71bae153177e</xsl:when>
                <!-- Ha 10 Schlüssel/Zubehör -->
                <xsl:when test="$lower='ha 10key'">75c438a9-f939-4a93-bf29-8b948a562c65</xsl:when>
                <!--Ha 10 Freihandbestand-->
                <xsl:when test="starts-with($lower,'ha 10')">e1538d77-6849-4ea5-b569-b9fcaf0e20f1</xsl:when>
                <!--Ha 11 Freihandbestand-->
                <xsl:when test="$lower='ha 11'">c12bdd25-047e-4f38-97c7-d3afdb46a7c7</xsl:when>
                <!-- Ha 11 Magazin -->
                <xsl:when test="$lower='ha 11-m'">a7eda503-b412-47b9-815e-891db6cf453c</xsl:when>
                <!-- Ha 11 Handapparate -->
                <xsl:when test="$lower='ha 11-ha'">05f0753b-5db4-4ab1-8719-7c2955c09f4a</xsl:when>
                <!-- Ha 11 Schlüssel/Zubehör -->
                <xsl:when test="$lower='ha 11h'">97d3c790-552e-4746-8638-2b53e990e48f</xsl:when>
                <!-- Ha 18 Magazin -->
                <xsl:when test="$lower='ha 18-m'">03da816a-aae5-42e1-810b-2950e443b0e4</xsl:when>
                <xsl:when test="$lower='ha 18-s'">03da816a-aae5-42e1-810b-2950e443b0e4</xsl:when>
                <!-- Ha 18 Handapparate -->
                <xsl:when test="$lower='ha 18-ha'">9c902b4d-91a2-45fd-86db-90b35037be61</xsl:when>
                <!-- Ha 18 Sonderstandorte -->
                <xsl:when test="$lower='ha 18-l01'">a9113545-eb21-4925-a269-7a0275360a48</xsl:when>
                <xsl:when test="$lower='ha 18-u'">a9113545-eb21-4925-a269-7a0275360a48</xsl:when>
                <xsl:when test="$lower='ha 18-a'">a9113545-eb21-4925-a269-7a0275360a48</xsl:when>
                <!-- Ha 18 Schlüssel/Zubehör -->
                <xsl:when test="$lower='ha 18h'">8210e442-aa5d-4aba-ba3a-6e6452110797</xsl:when>
                <!-- Ha 18 Freihandbestand-->
                <xsl:when test="starts-with($lower,'ha 18')">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 20'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 25'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 36'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 37'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 75'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 86'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <xsl:when test="$lower='ha 98'">4bcb7156-7f7c-48a4-a55b-e0fcf2d6e416</xsl:when>
                <!-- Ha 19 Magazin-->
                <xsl:when test="starts-with($lower,'ha 19-m')">675146c1-4474-4668-a203-655999450919</xsl:when>
                <xsl:when test="$lower='ha 19-t'">675146c1-4474-4668-a203-655999450919</xsl:when>
                <!-- Ha 19 Freihandbestand-->
                <xsl:when test="$lower='ha 19'">c137df03-d7da-4f91-9742-0aef71a3c5f4</xsl:when>
                <xsl:when test="$lower='ha 19-a'">c137df03-d7da-4f91-9742-0aef71a3c5f4</xsl:when>
                <!-- Ha 19 Handapparate -->
                <xsl:when test="$lower='ha 19-ha'">b5ce5a11-1526-4f4a-a8d2-708cf4a31b1a</xsl:when>
                <!--Ha 26 Freihandbestand-->
                <xsl:when test="$lower='ha 26'">80ea319f-3ad0-4371-b30a-71d75fbec8cb</xsl:when>
                <xsl:when test="$lower='ha 26-g'">80ea319f-3ad0-4371-b30a-71d75fbec8cb</xsl:when>
                <!-- Ha 26 Magazin -->
                <xsl:when test="$lower='ha 26-m'">675146c1-4474-4668-a203-655999450919</xsl:when>
                <xsl:when test="$lower='ha 26-b'">675146c1-4474-4668-a203-655999450919</xsl:when>
                <!-- Ha 26 Sonderstandorte -->
                <!-- 
                kurz, aber schwer zu lesen
                <xsl:when test="matches($lower, '^ha 26-(ag|j|ka|p|k)$')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                lang, aber gut zu lesen
                <xsl:when test="$lower='ha 26-ag')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                <xsl:when test="$lower='ha 26-j')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                <xsl:when test="$lower='ha 26-ka')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                <xsl:when test="$lower='ha 26-p')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                <xsl:when test="$lower='ha 26-ag')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                <xsl:when test="$lower='ha 26-k')">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                -->
                <xsl:when test="$lower='ha 26-ag' 
                            or $lower='ha 26-j' 
                            or $lower='ha 26-ka' 
                            or $lower='ha 26-p' 
                            or $lower='ha 26-k'">8ab3b811-8b6f-4892-abbb-8c46556774fb</xsl:when>
                <!-- Ha 26 Handapparate -->
                <xsl:when test="$lower='ha 26-ha'">2b8c59d2-910b-44d9-9c2a-f55c04368cbc</xsl:when>
                <!-- Ha 27 Freihandbestand -->
                <xsl:when test="$lower='ha 27'">e982c109-5420-4245-9357-29329b9a1ad6</xsl:when>
                <!-- Ha 27 Magazin -->
                <xsl:when test="$lower='ha 27-m'">b00fc401-2e5e-4ab5-a03d-b7b5ed8c2c4e</xsl:when>
                <xsl:when test="$lower='ha 27-t'">b00fc401-2e5e-4ab5-a03d-b7b5ed8c2c4e</xsl:when>
                <!-- Ha 27 Handapparate -->
                <xsl:when test="$lower='ha 27-ha'">832d7ea8-dd4d-4813-b2d6-3e450abe3961</xsl:when>
                <!-- Ha 38 Freihandbestand -->
                <xsl:when test="$lower='ha 38'">3e2b953a-2707-48d3-a3ae-b50f0ec8bfdb</xsl:when>
                <!-- Ha 38 Magazin -->
                <xsl:when test="$lower='ha 38-m'">e2decc64-ab85-4b4e-8ac4-79e9ab67c559</xsl:when>
                <!-- Ha 38 Handapparate -->
                <xsl:when test="$lower='ha 38-ha'">3cb3a32a-b93d-4f8b-a183-905af97654f3</xsl:when>
                <!-- Ha 150 Freihandbestand -->
                <xsl:when test="$lower='ha 150'">3e2b953a-2707-48d3-a3ae-b50f0ec8bfdb</xsl:when>
                <!-- Ha 150 Magazin -->
                <xsl:when test="$lower='ha 150-m'">c0b7c42d-74a7-470a-a3cf-8002f708fa4b</xsl:when>
                <!-- Ha 150 Handapparate -->
                <xsl:when test="$lower='ha 150-ha'">5c0d2562-e5a8-43ee-9d50-4154bd6fa8ee</xsl:when>
                <!-- Ha 150 Sonderstandort -->
                <xsl:when test="$lower='ha 150w'">176cf4e0-1c3e-4eaa-a274-0b30dde3ad70</xsl:when>
                <!-- Ha 179 Schlüssel/Zubehör -->
                <xsl:when test="$lower='ha 179h'">5cf4fbf4-b63b-48be-a1ce-5b94a0778d23</xsl:when>
                <!-- Ha 179 Freihandmagazin -->
                <xsl:when test="starts-with($lower,'ha 179')">8e5d60c1-b623-42af-b27a-ad6a194842a8</xsl:when>
                <!-- Geschäftsgang -->
                <xsl:when test="starts-with($lower,'gg')">8492786f-99f3-42c7-8cfa-f7b098165956</xsl:when>
                <!-- Alvensleben -->
                <xsl:when test="$lower='alv'">66016510-d721-4025-b6e4-dbc80f80205f</xsl:when>
                <!-- Ermlitz -->
                <xsl:when test="$lower='ermlitz'">476b8b75-471f-4aad-afa0-22f74f263eb4</xsl:when>
                <!-- TM Theodor Mahlmann -->
                <xsl:when test="$lower='tm'">8878b913-3c06-48ee-802f-035ef576eba4</xsl:when>
                <!-- Restitute -->
                <xsl:when test="
                    starts-with($lower,'alv')
                    or $lower='anb' 
                    or starts-with($lower,'arn')
                    or $lower='asse'
                    or starts-with($lower,'bar')
                    or $lower='bas'
                    or $lower='bis'
                    or $lower='bod'
                    or $lower='bos'
                    or $lower='brei'
                    or starts-with($lower,'bue')
                    or $lower='burg'
                    or starts-with($lower,'buss')
                    or $lower='dav'
                    or $lower='dohn'
                    or $lower='doel'
                    or $lower='elle'
                    or $lower='end'
                    or $lower='etz'
                    or $lower='gnei'
                    or $lower='goss'
                    or $lower='gro'
                    or $lower='gwi'
                    or $lower='hag'
                    or $lower='harv'
                    or $lower='hard'
                    or $lower='heck'
                    or starts-with($lower,'hell')
                    or starts-with($lower,'her')
                    or $lower='jag'
                    or $lower='klei'
                    or $lower='kli'
                    or starts-with($lower,'knes')
                    or $lower='kor'
                    or $lower='kot'
                    or starts-with($lower,'kro')
                    or $lower='kue'
                    or $lower='lei'
                    or $lower='mohr'
                    or starts-with($lower,'muen')
                    or $lower='nat'
                    or $lower='net'
                    or starts-with($lower,'olg')
                    or $lower='ost'
                    or $lower='rec'
                    or $lower='roes'
                    or $lower='run'
                    or $lower='rein'
                    or $lower='saen'
                    or starts-with($lower,'sch')
                    or $lower='sie'
                    or starts-with($lower,'st')
                    or $lower='war'
                    or $lower='wed'
                    or $lower='wer'
                    or $lower='wiln'
                    or $lower='wut'
                    or $lower='zec'
                    or $lower='zim'
                    or $lower='zsch'">4c8a7cfb-7660-487f-ac17-6741744721ef</xsl:when>             
                <!-- Keine Zuordnung --> 
                <xsl:otherwise>4e7e30fa-3961-4aae-8217-5e2d3edbea30</xsl:otherwise>		
            </xsl:choose>
        </permanentLocationId>
    </xsl:template>
</xsl:stylesheet>
