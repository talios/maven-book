<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                version="1.0">
  <!-- import the main stylesheet, here pointing to fo/docbook.xsl -->
  <xsl:import href="urn:docbkx:stylesheet"/>
  <!-- highlight.xsl must be imported in order to enable highlighting support, highlightSource=1 parameter
   is not sufficient -->
  <xsl:import href="urn:docbkx:stylesheet/highlight.xsl"/>

  <!-- raible -->
  <xsl:param name="body.font.master">10</xsl:param>
  <xsl:param name="insert.xref.page.number">1</xsl:param>
  <xsl:param name="title.margin.left">0pt</xsl:param>
  <xsl:param name="use.extensions">1</xsl:param>
  <xsl:param name="tablecolumns.extension">0</xsl:param>
  <xsl:param name="generate.index">1</xsl:param>
  <xsl:param name="section.autolabel">1</xsl:param>
  <!-- <xsl:param name="draft.watermark.image"></xsl:param> -->
  <!-- <xsl:param name="section.label.includes.component.label">1</xsl:param> -->
  <xsl:param name="shade.verbatim">1</xsl:param>
  <xsl:param name="make.index.markup">1</xsl:param>
  <xsl:param name="monospace.font.family">Cousine</xsl:param>

  <xsl:attribute-set name="book.titlepage.recto.style">
    <xsl:attribute name="color">#2f2f2f</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="section.title.properties">
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 1.2"/>
      <xsl:text>pt</xsl:text>
    </xsl:attribute>  
  </xsl:attribute-set>

  <xsl:attribute-set name="section.title.level1.properties">
    <xsl:attribute name="border-after-style">solid</xsl:attribute>
    <xsl:attribute name="border-after-width">.1mm</xsl:attribute>
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 1.6"/>
      <xsl:text>pt</xsl:text>
    </xsl:attribute>  
  </xsl:attribute-set> 

  <xsl:attribute-set name="section.title.level2.properties">
    <xsl:attribute name="border-after-style">solid</xsl:attribute>
    <xsl:attribute name="border-after-width">.1mm</xsl:attribute>
    <xsl:attribute name="padding">0.3em</xsl:attribute>
    <xsl:attribute name="start-indent">0pc</xsl:attribute>
    <xsl:attribute name="end-indent">0pc</xsl:attribute>
    <!-- <xsl:attribute name="font-style">italic</xsl:attribute> -->
    <!-- <xsl:attribute name="font-weight">normal</xsl:attribute> -->
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 1.4"/>
      <xsl:text>pt</xsl:text>
    </xsl:attribute>  
  </xsl:attribute-set> 

  <xsl:attribute-set name="section.title.level3.properties">
    <xsl:attribute name="border-after-style">solid</xsl:attribute>
    <xsl:attribute name="border-after-width">.1mm</xsl:attribute>
    <!-- <xsl:attribute name="font-weight">normal</xsl:attribute> -->
    <!-- <xsl:attribute name="font-style">italic</xsl:attribute> -->
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 1.2"/>
      <xsl:text>pt</xsl:text>
    </xsl:attribute>  
  </xsl:attribute-set> 

  <xsl:attribute-set name="section.title.level4.properties">
    <xsl:attribute name="border-after-style">solid</xsl:attribute>
    <xsl:attribute name="border-after-width">.1mm</xsl:attribute>
    <!-- <xsl:attribute name="font-weight">normal</xsl:attribute> -->
    <!-- <xsl:attribute name="font-style">italic</xsl:attribute> -->
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 1.0"/>
      <xsl:text>pt</xsl:text>
    </xsl:attribute>  
  </xsl:attribute-set> 

  <xsl:attribute-set name="formal.title.properties">
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 1.0"/>
      <xsl:text>pt</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.0em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
    <!--
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">.1mm</xsl:attribute>
    -->
  </xsl:attribute-set> 

  <xsl:attribute-set name="list.block.spacing">
    <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">0em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0em</xsl:attribute>

    <xsl:attribute name="space-after.minimum">0.0em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.7em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.7em</xsl:attribute>
    <!--
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">.1mm</xsl:attribute>
    -->
  </xsl:attribute-set> 

  <xsl:attribute-set name="list.item.spacing">
    <xsl:attribute name="space-before.minimum">0.0em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">0.3em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.3em</xsl:attribute>

    <xsl:attribute name="space-after.minimum">0em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.2em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.2em</xsl:attribute>
    <!--
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">.1mm</xsl:attribute>
    -->
  </xsl:attribute-set> 

  <!-- <xsl:template match="processing-instruction('line-break')">
    <fo:block/>
  </xsl:template> -->



  <!-- some customization -->
  <xsl:param name="hyphenate">false</xsl:param>
  <xsl:param name="alignment">left</xsl:param>

<!-- <xsl:attribute-set name="formal.title.properties"> 
  <xsl:attribute name="font-family">
    <xsl:choose>
      <xsl:when test="self::table">Helvetica</xsl:when>
      <xsl:otherwise>inherit</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set> -->

  <xsl:param name="variablelist.as.blocks" select="1"></xsl:param>
  <!-- <xsl:template match="varlistentry/term">
    <xsl:call-template name="inline.boldseq"/>
  </xsl:template>

  <xsl:template match="emphasis[@role='strong']">
    <xsl:call-template name="inline.boldseq"/>
  </xsl:template> -->


  <xsl:attribute-set name="monospace.verbatim.properties">
    <xsl:attribute name="font-family">Cousine</xsl:attribute>
    <xsl:attribute name="font-size">8pt</xsl:attribute>
    <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="shade.verbatim.style">
    <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
    <xsl:attribute name="border-width">0.5pt</xsl:attribute>
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-color">#575757</xsl:attribute>
    <xsl:attribute name="padding">3pt</xsl:attribute>
  </xsl:attribute-set>

</xsl:stylesheet>
