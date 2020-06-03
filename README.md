# cbs2folio-transformations
This is a public place to share XSLT transformations from pica+ to FOLIO xml transformations

Description: The main workhorse is pica2instance.xsl, then there will be secondary stylesheets
  to (eg. codes2uuid.xsl) that map things after initial record creation.  These files are designed to work
  with the harvester's transformation pipeline.  For testing, you'll want to run a command like this:
  
  `xsltproc xsl/pica2instance.xsl rundir/xml/20200109200514.xml | xsltproc xsl/codes2uuid.xsl -` 
