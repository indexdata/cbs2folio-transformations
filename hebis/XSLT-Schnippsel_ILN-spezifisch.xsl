<!-- holding -->

<!-- Lokale Schlagwörter (Level 2)
     neue Referenzdatei, Label als Überschrift -->

     <xsl:for-each select="datafield[(@tag='244Z') and (subfield[@code='x']&lt;'80')]"> 
       <i>
         <note>
           <xsl:value-of select="./subfield[@code='a' or @code='8']"/>
         </note>
         <holdingsNoteTypeId>Lokale Schlagwörter</holdingsNoteTypeId>
         <staffOnly>false</staffOnly>
       </i>
     </xsl:for-each>


<!-- Lokale Klassifikation (Level 2)
     neue Referenzdatei, Label als Überschrift -->

     <xsl:for-each select="datafield[(@tag='245Z')]"> 
       <i>
         <note>
           <xsl:value-of select="./subfield[@code='a']"/>
         </note>
         <holdingsNoteTypeId>Lokale Klassifikationen</holdingsNoteTypeId>
         <staffOnly>false</staffOnly>
       </i>
     </xsl:for-each>

<!-- Nicht-Online-Materialien mit PIDs und URLs -> done -->
