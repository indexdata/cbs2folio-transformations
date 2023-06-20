 

> ### Level-2 Mapping in <span class="css-truncate css-truncate-target d-block width-fit">[holdings-items-hebis.xsl](https://github.com/ubmainz/cbs2folio-transformations/blob/master/hebis/holdings-items-hebis.xsl) (<span style="color: rgb(51,153,102);">Allgemein</span>) und / oder  in holdings-items-hebs-iln\<nn\>.xsl (</span><span class="css-truncate css-truncate-target d-block width-fit"><span style="color: rgb(153,204,255);">ILN-spezifisch</span>)</span>
>
> <span
> class="css-truncate css-truncate-target d-block width-fit">(In <span
> style="color: rgb(204,153,255);">**Lila **<span
> style="color: rgb(0,0,0);">werden Kategorien angegeben, die in FOLIO
> nicht explizit angezeigt werden, aber eine Rolle im Mapping spielen.
> **<span style="color: rgb(255,204,0);">Gelb</span>** =
> Änderungsbedarf, bzw. noch zu diskutieren)</span></span></span>

Ergebnis der Diskussion zur Item call number und Item location mit dem
GBV:

-   Für Standort und Signatur ist das CBS source of truth. Auch
    Signaturänderungen erfolgen immer über das CBS.
-   Der Platz für Standort und Signatur in FOLIO ist das Holdings. Im
    Item bleiben diese Felder leer.
-   Somit können unsere Vorgaben aus Hessen mit getragen werden und die
    Item-Signatur wird nicht durch CBS2FOLIO gefüllt.
-   Der Befürchtung aus Hebis, dass FOLIO-Anwender\*innen abweichende
    oder zusätzliche Signaturen nur im FOLIO-Item-Bereich katalogisieren
    und nicht im CBS, was auch aus GBV-Sicht nicht sein sollte, könnte
    Rechnung getragen werden bei der Definition der Felder, die in FOLIO
    nicht bearbeitet werden dürfen (2. Schritt der Overwrite Protection,
    die nicht unmittelbar/nur mit MIU zusammenhängen)
-   Use Cases, bei denen der Standort zeitweise anders ist, sind
    denkbar. Dazu hat man in FOLIO dann die entsprechenden Felder im
    Item.\*
-   Temporäre Signaturen\* ($a) gibt es eher nicht, außer bei Zs-Bänden,
    die Source "Folio" o.Ä. haben und sowieso vom Überschreiben
    geschützt werden müssen. 
-   Das Item-Signaturfeld soll nicht für die Katalogisierung weiterer
    Signaturen missbraucht werden.

\*Achtung: In der Konsequenz bedeutet dies, dass bei Semesterapparaten
das Item zwar einen temporären Standort "Semesterapparat" bekommen kann
(und wg. der Ausleihregeln auch bekommen sollte).  Dass aber
Semesterapparat-spezifische Signaturpräfixe nicht in FOLIO erfasst
werden können, sondern im CBS erfasst werden müssen, soweit dies für
Bibmap, Mapongo oder ähnliches erforderlich sein sollte. 

  

<table class="wrapped relative-table confluenceTable"
style="width: 91.7695%;">
<colgroup>
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 4%" />
<col style="width: 9%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 10%" />
<col style="width: 7%" />
<col style="width: 21%" />
<col style="width: 10%" />
<col style="width: 6%" />
</colgroup>
<tbody>
<tr class="header">
<th class="confluenceTh">Anker</th>
<th class="confluenceTh">CBS-Quellkategorie(n)</th>
<th class="confluenceTh">Pica+</th>
<th class="confluenceTh">CBS-Bezeichnung</th>
<th class="confluenceTh">Art des Mappings</th>
<th class="confluenceTh">FOLIO-Entität</th>
<th class="confluenceTh">FOLIO-Zielfeld(er)</th>
<th class="confluenceTh">FOLIO-Zielentität</th>
<th class="confluenceTh">Bemerkung</th>
<th class="confluenceTh">Hinweis</th>
<th class="confluenceTh">Wo</th>
</tr>

<tr class="odd">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">1</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">0500</td>
<td class="background: #abf5d1;">002@</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Physische Form,
bibliographische Gattung und Status</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Zuordnung in
FOLIO-Entität</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-s"
title="">Holdings (Bestand)</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsTypeId</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsType</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>2 Typen: electronic /
physical</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Die Codes aus 0500 werden
nicht explizit angezeigt</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">2</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">0500</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">002@</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Physische Form,
bibliographische Gattung und Status</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Item (Exemplar)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">materialTypeId</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">materialType</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Materialarten ggf. für
Circulation Rules wichtig</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Die Codes aus 0500 werden
nicht explizit angezeigt</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">3</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4702</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">247D $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Ausleihcode in Textform</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-s"
title="">Holdings (Bestand)</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">holdingsNote mit holdings<span
class="pl-ent" title="">NoteTypeId =</span>Text zur Ausleihbarkeit</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="confluenceTd">4</td>
<td class="confluenceTd">4800</td>
<td class="confluenceTd">247C</td>
<td class="confluenceTd">Verknüpfung zu Bibliotheksnormdatensatz</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">5</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4801</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">237A $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Besondere Merkmale des
Exemplars</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-s"
title="">Holdings (Bestand)</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsNote mit holdingsNoteTypeId =</span>Note</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">6</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4802</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">220B $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Eigentümer des Werkes</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-s"
title="">Holdings (Bestand)</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsNote mit holdingsNoteTypeId =</span>Note</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">7</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4803</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">220C $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Anmerkung (intern)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-s"
title="">Holdings (Bestand)</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsNote mit holdingsNoteTypeId =</span>Note</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">8</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4804</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">220D $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Anmerkung (Provenienz)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>holdingsNote mit <span
class="pl-ent">holdingsNoteTypeId = </span>Provenance</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">9</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4805</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">220E $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Bibliographische Anmerkung auf
Exemplarebene</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-s"
title="">Holdings (Bestand)</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsNote mit holdingsNoteTypeId =</span>Note</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">10</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">4850</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">247E</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Filter für Anzeige in den
Benutzungsoberflächen</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Holdings (Bestand)</p>
<p><span class="pl-s">Item (Exemplar)</span></p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span
class="treeLabel booleanLabel" title="">discoverySuppress: true<br />
</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="confluenceTd">11</td>
<td class="confluenceTd">67xy</td>
<td class="confluenceTd">245Z $xXY</td>
<td class="confluenceTd">Lokale Notation (exemplarbezogen)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd">12</td>
<td class="confluenceTd">6801-6879</td>
<td class="confluenceTd">244Z $x01-79</td>
<td class="confluenceTd">Lokale Schlagwörter (exemplarbezogen)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">13</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">6880-6898</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">244Z $x80-98</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Provenienz-​Verknüpfung zur
GND</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">holdingsNote mit <span
class="pl-ent" title="">holdingsNoteTypeId = </span>Provenance</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">14</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">6899</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">244Z $x99</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Deskriptoren
Provenienzerschließung</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">holdingsNote mit <span
class="pl-ent" title="">holdingsNoteTypeId = </span>Provenance</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="confluenceTd">15</td>
<td class="confluenceTd">690y</td>
<td class="confluenceTd">245S $x0Y</td>
<td class="confluenceTd">Fachgebiet (exemplarbezogen)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2">16</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">70xy</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">208@</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">Datum und
Selektionscode</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><p>Zuordnung in
FOLIO-Entität</p>
<p><br />
</p>
<p>Wert an sich wird nicht gemappt, wird nicht in FOLIO angezeigt, 
<span class="inline-comment-marker"
data-ref="f251a75f-4182-4e2e-a641-33eb6a076441">steuert aber 
discoverySuppress</span></p></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><p>Holdings (Bestand)</p>
<p><span class="pl-s">Item (Exemplar)</span></p></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><span
class="treeLabel booleanLabel" title="">discoverySuppress:
true</span></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><br />
</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">bestimmte Selektionscodes
in 70xy  für Unterdrückung der Anzeige genutzt. Bei Altdaten fehlt die
4850 häufig.</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><p>bei Zeitschriften "gp"
bei  <span class="inline-comment-marker"
data-ref="3c82617b-e14b-4123-b160-dc2d11ffc4b8">Monographien</span>
unterschiedlich gehandhabt. </p>
<ul>
<li>Pos 1 g</li>
<li>Pos 2 y oder z</li>
</ul></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">ILN-spezifisch</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-17"
class="confluence-link" data-anchor="17"
data-linked-resource-default-alias="17"
data-base-url="https://kid.hebis.de">17</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7100</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209A $x00 $a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Signatur Vorlageform</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Holdings (Bestand)</p>
<p><br />
</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p><span
class="pl-ent">callNumber</span></p>
<p><br />
</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p><br />
</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-18"
class="confluence-link" data-anchor="18"
data-linked-resource-default-alias="18"
data-base-url="https://kid.hebis.de">18</a></p>
</div></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">7100</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">209A $x00 $a</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Signatur Vorlageform</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p>Holdings (Bestand)</p>
<p><br />
</p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p><span
class="pl-ent">callNumberPrefix</span></p>
<p><br />
</p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><br />
</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Um weiteren Index-Eintrag für
die Grundsignatur zu erzeugen, kann ein Signatur-Präfix bestimmt
werden. </td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p><img
src="./Level-2-Mapping_files/warning.svg" title="(Warnung)"
class="emoticon emoticon-warning" data-emoticon-name="warning"
data-border="0" alt="(Warnung)" /> Wer schon Prefix-Definitionen im
ILN-spezifischen Mapping hat, bitte auf itemlevel entfernen. </p>
<p>Vorlage: siehe ILN25</p>
<p>hier findet man auch ein Beispiel für Abteilungscodebezogenes
Präfix</p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">ILN-spezifisch</td>
</tr>
<tr class="even">
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-19"
class="confluence-link" data-anchor="19"
data-linked-resource-default-alias="19"
data-base-url="https://kid.hebis.de">19</a></p>
</div></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">7100</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">209A $x00 $f</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">Abteilungscode</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><p>Zuordnung in
FOLIO-Entität</p>
<p><br />
</p>
<p>Wert an sich wird nicht gemappt, wird nicht in FOLIO angezeigt, 
steuert aber  Zuordnung zur Location</p></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">Holdings (Bestand)</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><span
class="pl-ent">permanentLocationId</span></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">location</td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %">siehe: <a
href="https://kid.hebis.de/pages/viewpage.action?pageId=142821320">CBS-Felder
für Zuordnung zum Standort - AG Koordinierung UAG Technik - KID
(hebis.de)</a> 
<p>Für die Zuordnung zur Location eignen sich in erster Linie
Abteilungscode, Signaturanfang, Textfeld Standort</p></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><p><br />
</p></td>
<td class="highlight-#c0b6f2 confluenceTd"
bgcolor="#c0b6f2"
title="Hintergrundfarbe : Hellviolett 100 %"><p>ILN-spezifisch</p>
<p>Für die Zuordnung zur Location eignen sich in erster Linie
Abteilungscode, Signaturanfang, Textfeld Standort</p></td>
</tr>
<tr class="odd">
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-20"
class="confluence-link" data-anchor="20"
data-linked-resource-default-alias="20"
data-base-url="https://kid.hebis.de">20</a></p>
</div></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">7100</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">209A $x00 $d</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Ausleihcode</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Zuordnung in
FOLIO-Entität</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><span class="pl-s"
title="">Item (Exemplar)<br />
</span></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><span class="pl-s"
title="">permanentLoanTypeId</span></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><span class="pl-s"
title="">permanentLoanType</span></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p>bibliotheksspezifische
Ausleihtypen</p>
<ul>
<li>für Circulation Rules wichtig</li>
<li>bestimmt initialen ItemStatus</li>
</ul></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p><br />
</p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">ILN-spezifisch</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-21"
class="confluence-link" data-anchor="21"
data-linked-resource-default-alias="21"
data-base-url="https://kid.hebis.de">21</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7100</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209A $x00 $d</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Ausleihcode </td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Zuordnung in
FOLIO-Entität</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Item (Exemplar)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">ItemStatus</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">ItemStatus 
<strong>Initial</strong></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Ausleihindikator des CBS
bestimmt den initialen ItemStatus </p>
<p>a- On Order</p>
<p>e - missing</p>
<p>z - withdrawn</p>
<p>g - restricted</p>
<p><br />
</p>
<p> otherwise (also alle anderen Ausleihindikatoren)- available</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Diese Regelung greift für
alle zu migrierenden <strong>CBS-Altdaten</strong> (Initiale
Datenmigration), aber auch für alle Lokaldaten, die ab
FOLIO-Implementierung <strong>neu</strong> im CBS erfasst
werden.</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Allgemein</p>
<p>Die UUAG bleibt dabei den itemStatus im Allgemeinen Mapping zu
belassen. Kann auf Anforderung durch weitere Bibliotheken aber geändert
werden.</p></td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">22</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7100</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209A $x00 $d</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Ausleihcode </td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Zuordnung in
FOLIO-Entität</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Item (Exemplar)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">ItemStatus</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">ItemStatus
<strong>Update</strong></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Im allgemeinen Mapping
<span class="css-truncate css-truncate-target d-block width-fit"><a
href="https://github.com/ubmainz/cbs2folio-transformations/blob/hebis/hebis/holdings-items-hebis.xsl"
class="js-navigation-open Link--primary"
title="holdings-items-hebis.xsl">holdings-items-hebis.xsl</a>
</span><span style="letter-spacing: 0.0px;">ist die policy "retain"
eingetragen.</span></p>
<pre><code>&lt;processing&gt;
  &lt;item&gt;
    &lt;status&gt;
      &lt;policy&gt;retain&lt;/policy&gt;
    &lt;/status&gt;
  &lt;/item&gt;
&lt;/processing&gt;</code></pre></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p><span>Dies bedeutet, dass
eine Änderung eines Ausleihindikators im CBS nie den Exemplar-Status des
Exemplars in FOLIO  ändert. </span></p>
<p><span>Beispielsweise erhält ein Bestell-Lokaldatensatz mit
Ausleihindikator a den Itemstatus "on order". Wird dieser
Bestell-Lokaldatensatz nach Lieferung mit Signatur und einem anderen
Ausleihindikator versehen, bleibt der Exemplarstatus "on order" und wird
nicht zu available, wie bei einer Neueingabe.</span></p>
<p><span><span class="inline-comment-marker"
data-ref="06d1e4f0-65f5-4ad1-84e6-76705fd7ea8b">Neu eingegangene  Medien
müssen somit 1x in der Rückgabe-App zurück gebucht werden</span>, damit
der Itemstatus von "on order" zu "available" wechselt. Dito
wiedergefundene vermisste. </span></p>
<p><span>Statuswechsel zu vermisst oder ausgeschieden (withdrawn) ist
über das <span class="inline-comment-marker"
data-ref="ea6f89a1-d3c0-45e0-a773-d970ef3d42b6">Aktionsmenü im Katalog
möglich.</span></span></p>
<p><br />
</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff">23</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">7100</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">209A $x00 $d</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Ausleihcode </td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Zuordnung in
FOLIO-Entität</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Item (Exemplar)</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">ItemStatus</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">ItemStatus
<strong>Update</strong></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p><span
class="css-truncate css-truncate-target d-block width-fit">holdings-items-hebs-iln&lt;nn&gt;.xsl
</span></p>
<pre><code>&lt;xsl:template match=&quot;processing&quot;&gt;
    &lt;processing&gt;
        &lt;item&gt;
            &lt;status&gt;
                &lt;policy&gt;overwrite&lt;/policy&gt;
                &lt;ifStatusWas&gt;
                    &lt;arr&gt;
                        &lt;i&gt;
                            &lt;name&gt;On order&lt;/name&gt;
                        &lt;/i&gt;
                    &lt;/arr&gt;
                &lt;/ifStatusWas&gt;
            &lt;/status&gt;
        &lt;/item&gt;
    &lt;/processing&gt;
&lt;/xsl:template&gt;</code></pre></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p>Will man, dass die Änderung
des Ausleihindikators von "a" zu "u" usw. in Folio den Itemstatus von
"on order" per update zu "available" verändert, muss man im eigenen
ILN-spezifischen Mapping die retain-policy wieder überschreiben.</p>
<p>Der Wechsel zu den Ausleihindikatoren "e" (vermisst) und "z"
(Verlust) sollte nie eine Änderung des Itemstatus in Folio auslösen,
denn Folio hat für Vermisst- und Verlustfälle elaborierte Itemstatus,
die durch <span class="inline-comment-marker"
data-ref="60166003-7712-4132-a8e1-a863f4ed432f">Aktionen in der
Ausleih-App</span> ausgelöst werden.</p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p>ILN-spezifisch</p>
<p><br />
</p>
<p>Wenn eine Bibliothek zuerst die FOLIO-Erwerbung einführt und erst
später die FOLIO-Ausleihe, ist diese Änderung des Mappings in der Zeit
vor der Einführung der Ausleihe hilfreich.</p></td>
</tr>
<tr class="odd">
<td class="confluenceTd">23 A</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><strong>ItemStatus</strong></td>
<td class="confluenceTd"><strong>Dokumentation</strong></td>
<td class="confluenceTd"><a
href="https://docs.google.com/presentation/d/1aOuwVzJR-zVegIxJjuFi3UGV6DKdQNnbpqEP2TqwlBw/edit?usp=sharing">Folio
Item-Status - Google Präsentationen</a></td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">23 B</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7100 </td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209A $x00 $i</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Konvolutindikator</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">nein</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Ist keine Buchnummer
vorhanden = kein 209G $x00 $a wird </p>
<p>kein Item erzeugt. </p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Für die in einem
Konvolutband nachgeordneten Titel dürfen keine Item entstehen. </p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Die Holdings dieser PPNs
werden in FOLIO mit dem Item verknüpft in dessen EPN im CBS eine
Buchnummer vorhanden ist. Momentan nur über API möglich, aber in FOLIO
schon sichtbar.</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="confluenceTd">24</td>
<td class="confluenceTd">7101-7108</td>
<td class="confluenceTd">209A $x01-08</td>
<td class="confluenceTd">Weitere Signaturen</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">bisher keine weiteren Signatur-Felder in
Folio</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd">25</td>
<td class="confluenceTd">7109</td>
<td class="confluenceTd">209A $x09</td>
<td class="confluenceTd">Magazinsignatur (nur Monografien)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">bisher keine weiteren Signatur-Felder in
Folio</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd">26</td>
<td class="confluenceTd">7110</td>
<td class="confluenceTd">209A $x10</td>
<td class="confluenceTd">Magazinsignatur (nur Zeitschriften)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">bisher keine weiteren Signatur-Felder in
Folio</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd"><div class="content-wrapper" title="">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-27"
class="confluence-link" data-anchor="27"
data-linked-resource-default-alias="27"
data-base-url="https://kid.hebis.de">27</a></p>
</div></td>
<td class="confluenceTd">7120</td>
<td class="confluenceTd">231@</td>
<td class="confluenceTd">Bestandsangaben bei Zeitschriften in maschinell
interpretierbarer Form</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><p><span class="pl-s" title="">Item
(Exemplar)</span></p>
<p><span class="pl-s" title="">aus dem Item entfernt (Juni
23)</span></p>
<p><span class="pl-s" title="">Änderungswunsch: Holdings</span></p></td>
<td class="confluenceTd"><p>$d, $n - volume</p>
<p>$j, $k - chronology</p>
<p>Änderungswunsch 1:</p>
<p>holdingsNote mit <span class="pl-ent" title="">holdingsNoteTypeId =
</span>???</p></td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><p>Änderungswunsch: Maschinell lesbarer Bestand
in Holdings zum zukünftigen Abgleich für Fernleihe, ob bestellter
Aufsatz im Bestand ist</p>
<p>→ Wirklich nötig? <span class="inline-comment-marker"
data-ref="bb7e02e4-cfcb-441d-a76e-df6db20c607e">Bitte prüfen.</span>
Abgleich erfolgt derzeit im CBS.</p></td>
<td class="confluenceTd"><p>Die Bestandsanzeige im "intellectual item"
generiert sich aus den Kategorien 8031 und 8032 und wird ins Feld "Jahr,
Bezeichnung" gemappt</p></td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd">28</td>
<td class="confluenceTd">7121</td>
<td class="confluenceTd">231L</td>
<td class="confluenceTd">Lizenzzeiträume in normierter Form</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd">29</td>
<td class="confluenceTd">7130</td>
<td class="confluenceTd">209I</td>
<td class="confluenceTd">Angabe zu Lizenzen und Rechten</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd">30</td>
<td class="confluenceTd">7133</td>
<td class="confluenceTd">209K</td>
<td class="confluenceTd">Angaben zu Zugriffsrechten </td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-31"
class="confluence-link" data-anchor="31"
data-linked-resource-default-alias="31"
data-base-url="https://kid.hebis.de">31</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7135</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209S $u</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Lokale elektronische Adresse
der Online-​Ressource (URL)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">electronicAccess - uri</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-32"
class="confluence-link" data-anchor="32"
data-linked-resource-default-alias="32"
data-base-url="https://kid.hebis.de">32</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7136</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">204U</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">URN</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">electronicAccess - uri</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-33"
class="confluence-link" data-anchor="33"
data-linked-resource-default-alias="33"
data-base-url="https://kid.hebis.de">33</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7137</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">204P</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">DOI</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">electronicAccess - uri</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-34"
class="confluence-link" data-anchor="34"
data-linked-resource-default-alias="34"
data-base-url="https://kid.hebis.de">34</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7138</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">204R</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Handle</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">electronicAccess - uri</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-35"
class="confluence-link" data-anchor="35"
data-linked-resource-default-alias="35"
data-base-url="https://kid.hebis.de">35</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7135-7138</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><pre title=""><code>209S 
204U/P/R
$S</code></pre></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Lizenzindikator</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">holdingsNote mit <span
class="pl-ent" title="">holdingsNoteTypeId = </span>Lizenzindikator</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">staffOnly ja/nein abhängig von
Ausgestaltung der HDS-Anbindung</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="confluenceTd">36</td>
<td class="confluenceTd">7139</td>
<td class="confluenceTd">209T</td>
<td class="confluenceTd">URL des Provenienzdigitalisats</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd">37</td>
<td class="confluenceTd">7140</td>
<td class="confluenceTd">209U</td>
<td class="confluenceTd">URL für Katalogkarten-​Scan</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-38"
class="confluence-link" data-anchor="38"
data-linked-resource-default-alias="38"
data-base-url="https://kid.hebis.de">#38</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">7800</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">203@ $0</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">EPN</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p><span class="pl-s">Holdings
(Bestand)</span></p>
<p><span class="pl-s">Item (Exemplar)</span></p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p><span
class="pl-s">Holding-HRID</span></p>
<p><span class="pl-s">Item-HRID</span></p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Bei Item-HRID wird die EPN um
die Copy-Nr ergänzt (siehe 8200). Default: Ergänzung durch "-1"</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="confluenceTd">39</td>
<td class="confluenceTd">7900</td>
<td class="confluenceTd">201C</td>
<td class="confluenceTd">Datum der Ersterfassung (Level 2)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd">40</td>
<td class="confluenceTd">7901</td>
<td class="confluenceTd">201B</td>
<td class="confluenceTd">Datum und Uhrzeit der letzten Änderung (online
und offline) (Level 2)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd">41</td>
<td class="confluenceTd">8001-8002</td>
<td class="confluenceTd">209B $x01-02</td>
<td class="confluenceTd">Materialcode auf Exemplarebene</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">42</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8005-8009</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209B $x05-09</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Lokale Schlüssel</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Werteübernahme in
Zielfeld </td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">holdingsNote mit <span
class="pl-ent" title="">holdingsNoteTypeId = </span>Lokaler
Schlüssel</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">staffOnly ja/nein abhängig von
Ausgestaltung der HDS-Anbindung</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">43</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8011-8019</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209B $x11-19</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Lokale Schlüssel
(Zeitschriften)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Werteübernahme in
Zielfeld </td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">holdingsNote mit <span
class="pl-ent" title="">holdingsNoteTypeId = </span>Lokaler
Schlüssel</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">staffOnly: </span>false</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">staffOnly ja/nein abhängig von
Ausgestaltung der HDS-Anbindung</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff">44</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p><span
class="inline-comment-marker"
data-ref="eac41989-bdcc-4bb5-8790-79e146e322cb">8005-8019</span></p>
<p><span class="inline-comment-marker"
data-ref="eac41989-bdcc-4bb5-8790-79e146e322cb">ausgenommen 8010 (nicht
im CBS vorhanden)</span></p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">209B Sx05-19</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Lokale Schlüssel</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Zuordnung zu einer
FOLIO-Entität</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Holdings (Bestand)</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">statisticalCodeIds</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">StatisticalCode</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">Für einzelne besondere Lokale
Schlüssel können  Statistical Codes angelegt werden</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><br />
</td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %">ILN-spezifisch</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">45</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8031</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209E $x01</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Einleitender Text zur
zusammenfassenden Bestandsangabe</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsStatements</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">46</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8032</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209E $x02</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Zusammenfassende
Bestandsangaben bei Zeitschriften</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsStatements</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">47</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8033</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209E $x03</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Lückenangabe bei
Zeitschriftenbeständen</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><span class="pl-ent"
title="">holdingsStatements</span></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wird eingeleitet durch den
Text "Angaben zur Vollständigkeit"</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">48</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8034</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209E $x04</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Kommentar zum Bestand bei
Zeitschriften (inkl. Löschvermerk)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Holdings (Bestand)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p><span
class="pl-ent">holdingsStatements</span></p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>8034 kommt in "öffentliche
Anmerkung (Note)" zum holdingsStatements</p>
<p>8034 kann auch ohne 8032 vergeben werden
(Verbrauchsmaterial) </p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">45a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">8031</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">209E $x01</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">Einleitender Text zur zusammenfassenden
Bestandsangabe</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %"><p>item (Exemplar)</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">yearCaption</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Es wird ein Item mit dem Status
"intellectual item" gebildet, um auch bei Zeitschriften den Ausleihtyp
und die Materialart abzubilden. </td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Da Einträge in "Jahr,
Bezeichnung" die effektive Signatur des Exemplars nicht verlängern,
wurde dieses Feld anstelle von "Band" und "Chronologie" gewählt.</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">46a</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">8032</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">209E $x02</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">Zusammenfassende Bestandsangaben bei
Zeitschriften</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Item (Exemplar)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">yearCaption</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Dito</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Dito</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe: Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">49</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8100</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209C</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Zugangsnummer,
Akzessionsnummer</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Item (Exemplar)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">accessionNumber</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="odd">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1">50</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8200</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209G $x00</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Verbuchungsnummer,
Buchnummer</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Item (Exemplar)</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">barcode</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Allgemein</td>
</tr>
<tr class="even">
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"><div class="content-wrapper">
<p><a
href="https://kid.hebis.de/plugins/viewsource/viewpagesrc.action?pageId=142813765#Tabellarische%C3%9CbersichtzumLevel2Mapping-51"
class="confluence-link" data-anchor="51"
data-linked-resource-default-alias="51"
data-base-url="https://kid.hebis.de">51</a></p>
</div></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">8201</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">209G $x01</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Standort-​Textfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">Wertübernahme in Zielfeld</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Holdings (Bestand)</p>
<p><br />
</p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>Wertefeld für <span
class="pl-ent">HoldingsNoteType</span>:<br />
"Standort (8201)"</p>
<p><br />
</p>
<p>Für HDS-Anzeige könnte der Wert auch in</p>
<p><span class="pl-ent">HoldingsNoteType</span>:<br />
"Discovery Unterstandort"  geschrieben werden. vgl. Diskussion:
Anmerkungstyp"Discovery (Unter)- Standort" </p></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><br />
</td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %">siehe: <a
href="https://kid.hebis.de/pages/viewpage.action?pageId=142821320">CBS-Felder
für Zuordnung zum Standort - AG Koordinierung UAG Technik - KID
(hebis.de)</a></td>
<td class="highlight-#abf5d1 confluenceTd"
bgcolor="#abf5d1"
title="Hintergrundfarbe : Hellgrün 100 %"><p>GBV hat diese Kategorie
nicht. </p>
<p>Muss für Überschreibschutz ins Holdings</p>
<p>Diskussion: Anmerkungstyp "Discovery (Unter)- Standort" </p></td>
<td class="highlight-#b3d4ff confluenceTd"
bgcolor="#b3d4ff"
title="Hintergrundfarbe : Hellblau 100 %"><p><span
style="color: rgb(255,102,0);"><span
style="color: rgb(0,51,102);">Allgemein/ILN-spezifisch </span><br />
</span></p>
<p>Allgemein: 8201 ist immer vorhanden</p>
<p>muss ggf. ILN-spezifisch geändert werden (Redundanz /
Widersprüchliche Angaben von 8201 und Zuordnung zur Location)</p></td>
</tr>
<tr class="odd">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8449</td>
<td class="confluenceTd">233O</td>
<td class="confluenceTd">Angaben zum Hersteller der Masterform</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8465</td>
<td class="confluenceTd">233Q</td>
<td class="confluenceTd">Besitznachweis der Verfilmungsvorlage</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8466</td>
<td class="confluenceTd">233R</td>
<td class="confluenceTd">Angaben zum Sekundärform-​Master</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8467</td>
<td class="confluenceTd">233P</td>
<td class="confluenceTd">Urheber der Verfilmung</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8510</td>
<td class="confluenceTd">245G</td>
<td class="confluenceTd">SSG-​Angaben auf Exemplarebene und Kennung für
"E-​journals"</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8590 </td>
<td class="confluenceTd">206V</td>
<td class="confluenceTd">Katalogkarten-​Nummer (Retro)</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">8595</td>
<td class="confluenceTd">206W</td>
<td class="confluenceTd">Identifikationsnummer für Exemplare</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="even">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">9410</td>
<td class="confluenceTd">247P</td>
<td class="confluenceTd">Bestellinformation</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
<tr class="odd">
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd">9800</td>
<td class="confluenceTd">206@</td>
<td class="confluenceTd">Dummyfeld für Altdaten-​Konversion</td>
<td class="confluenceTd">nein</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
<td class="confluenceTd"><br />
</td>
</tr>
</tbody>
</table>

  

  

 
