# cbs2folio-transformations for Hebis

This is the place where all cbs2folio transformations for Hebis are collected. The instance
mappings "pica2instance-new.xsl" and "relationships.xsl" are generally re-used from GBV.

## This is the current harvester pipeline:

1. `hebis/pica2instance-new.xsl` (compatible and improved copy of `pica2instance-new.xsl`) 
1. `hebis/relationships.xsl` (compatible and improved copy of `relationships.xsl`) 
1. `hebis/holding-items-hebis.xsl`
1. `hebis/holding-items-hebis-ilnxx.xsl`
1. `hebis/codes2uuid-hebis-ilnxx.xsl`
1. `hebis/codes2uuid-hebis.xsl`

### Test data for the transformation step

The subfolder `testexamples` contains among others MARC XML files for testing the transformation steps of the Harvester.

Starting with the XML sample for Giessen University Library (ILN 204) (`giessen-440106532-ILN-204.xml`), the transformation steps (XSLTs) result in the following XML files.


| XSLT                               | Input                                | Output                              |
| ---------------------------------- | ------------------------------------ | ----------------------------------- |
| pica2instance-new.xsl              | giessen-440106532-ILN-204.xml        | giessen-440106532-ILN-204-step1.xml |
| relationships.xsl                  | giessen-440106532-ILN-204-step1.xml  | giessen-440106532-ILN-204-step2.xml |
| holdings-items-hebis-hrid-test.xsl | ...                                  | ...                                 |
| holding-items-iln-204.xsl          | ...                                  | ...                                 |
| codes2uuid.xsl                     | ...                                  | ...                                 |
| codes2uuid-hebis-iln204.xsl        | giessen-440106532-ILN-204-step5.xml  | giessen-440106532-ILN-204-step6.xml |

In the case of ILN 204, the test XMl files were transformed with Saxon 6.5.5.


## Essential hebis-wide UUID objects folder - need to be imported from folder referenceRecords:

- `K10plus/instance-statuses`
- `codes2uuid/holdings-sources`
- `codes2uuid/identifier-types`
- `codes2uuid/item-note-types`
- `codes2uuid/material-types`

## How to get local UUIDs for locations and loan-types

A convenient way to get UUIDs for locations and loan types directly from the FOLIO APIs via the built-in Okapi query client.   
You can access it by selecting 'Settings' -> 'Developers' -> 'Okapi Query'.  
Simply type 'locations' or 'loan types' into the query and run the query to get the results:  

![Okapi query client](./FOLIO-OKAPI-Client.PNG)

To be completed...


## XSL transformation for testing the permanent location ID results

The XSL transformation `holding-items-hebis-iln204-test.xsl` can be used to test the permanentLocationID element resulting from the values held in 209a (subfield f = department code, subfield a = signature). The XML file `signatur-test-iln204.xml` can be filled with signatures to be tested. *Note: you have to enter the combination of department code and signature.* In the XML `lbs-ranges-iln204.xml` you can define ranges and beginnings of signature strings and the resulting locations for different department code. Currently, this file contains the LBS mapping ("Konkordanz") of the Giessen University Library.
