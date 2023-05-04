<!-- instance -->

<!-- Lokale Schlagwörter (Level 1)
     Bei den Schlagwörtern im instance-Bereich, gibt es keine Spezifizierung, daher keine UUID
     Änderungen für Orchid angekündigt, wenn ich es richtig sehe, müssten wir dann ein <value>-Tag ergänzen -->

    <subjects>
     <arr>
      <xsl:if test="datafield[@tag='144Z']/subfield[@code='a']">
          <xsl:for-each select="datafield[@tag='144Z']">
            <i>
       <!-- <value>  erst mit Orchid -->
             <xsl:value-of select="./subfield[@code='a']"/>
       <!--  </value> erst  mit Orchid -->
            </i>
          </xsl:for-each>
      </xsl:if>
     </arr>
    </subjects>

<!-- Lokale Klassifikation (Level 1)
     neue Referenzdatei, Label pro Zeile -->

    <classifications>
     <arr>
      <xsl:if test="datafield[@tag='145Z']/subfield[@code='a']">
          <xsl:for-each select="datafield[@tag='145Z']">
            <i>
             <classificationNumber>
               <xsl:value-of select="./subfield[@code='a']"/>
             </classificationNumber>
             <classificationTypeId>Lokale Klassifikation</classificationTypeId>
            </i>
          </xsl:for-each>
      </xsl:if>
     </arr>
    </classifications>

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

<!-- Nicht-Online-Materialien mit PIDs und URLs -->

      <xsl:if test="not($electronicholding)">
        <electronicAccess>
          <arr>
            <xsl:for-each select="datafield[@tag='209S']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='u']"/>
                </uri>
              </i>
            </xsl:for-each>
            <xsl:for-each select="datafield[@tag='204P'] | datafield[@tag='204U'] | datafield[@tag='204R']">
              <i>
                <uri>
                  <xsl:value-of select="./subfield[@code='0']"/>
                </uri>
              </i>
            </xsl:for-each>
          </arr>
        </electronicAccess>
      </xsl:if> 