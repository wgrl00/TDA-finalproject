<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->
    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:body">
        <div class="row">
        <div class="col-3"><br/><br/><br/><br/><br/>
            <xsl:for-each select="//tei:add[@place = 'marginleft']">
                <div class="addition marginLeft">
                    <xsl:choose>
                        <xsl:when test="parent::tei:del">
                            <del>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="attribute::hand" />
                                </xsl:attribute>
                                <xsl:apply-templates/></del><br/>
                        </xsl:when>
                        <xsl:otherwise>
                            <span>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="attribute::hand" />
                                </xsl:attribute>
                            <xsl:apply-templates/><br/>
                            </span>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:for-each> 
        </div>
        <div class="col-9">
            <div class="transcription">
                <xsl:apply-templates select="//tei:div"/>
            </div>
        </div>
        </div> 
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="#MWS"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

  <!-- processes the marginal additions again to give them a class to hide them in the 'main' text in css. By hiding them using css, they can also be made visible again when showing a reading text, for example-->
<xsl:template match="tei:add[@place ='marginleft']">
        <span class="marginAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    
    <xsl:template match="tei:del">
        <del class="deletion {@hand}">
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    
    <!-- all the supralinear additions are given in a span with the class supraAdd, make sure to put this class in superscript in the CSS file, -->
 <!-- <xsl:template match="tei:add[@place = 'supralinear']">
        <span class="supraAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template> -->
  
  <!--I did it a bit differently:-->

<xsl:template match="tei:add[@place='supralinear']">
    <span class="addition supralinear {@hand}">   
    <xsl:apply-templates/>
    </span>
</xsl:template>


<!-- add additional templates below, for example to transform the tei:lb in <br/> empty elements, tei:hi[@rend = 'sup'] in <sup> elements, the underlined text, additions with the attribute "overwritten" etc. -->

<xsl:template match="tei:lb">
  <br/>
</xsl:template>
    

<!-- quote situaton-->
<xsl:template match="tei:hi[@rend='right']">
  <span class="hi right">
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="tei:hi[@rend='sup']">
  <sup>
    <xsl:apply-templates/>
  </sup>
</xsl:template>


<!-- crossed out-->
<xsl:template match="tei:del[@type='crossedOut']">
  <span class=" deletion crossedOut {@hand}">    
    <xsl:apply-templates/>
  </span>
</xsl:template>


<!-- overwritten-->
<xsl:template match="tei:del[@type='overwritten']">
 <span  class="deletion overwritten {@hand}">
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="tei:add[@place='overwritten']">
  <span class=" addition {@hand}">
    <xsl:apply-templates/>
  </span>
</xsl:template>


<!-- underlined -->
<xsl:template match="tei:hi[@rend='u']">
    <u>
        <xsl:apply-templates/>
    </u>
</xsl:template>

  
<xsl:template match="tei:hi[@rend='u2']">
 <span class="hi u2">
    <u>
        <xsl:apply-templates/>
    </u>
</span>
</xsl:template>





<!--  circled numbers-->
<xsl:template match="tei:hi[@rend='circled']">
  <span class="hi circled {@hand}">
    <xsl:apply-templates/>
  </span>
</xsl:template>


<!-- for hiding notes-->
<xsl:template match="tei:note"/>


<!--paragraph indent-->
<xsl:template match="tei:hi[@rend='indented']">
  <span class="hi indented">
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="tei:hi[@rend='indented2']">
  <span class="hi indented2">
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="tei:add[@place='inline']">
  <span class="addition {@hand}">
    <xsl:apply-templates/>
  </span>
</xsl:template>


<!-- all metamarks -->
<xsl:template match="tei:metamark">
<span class="metamarks {@hand}">
  <xsl:choose>

    <xsl:when test=". = '^'">
      <span class="metamark roof">
        <xsl:value-of select="."/>
      </span>
    </xsl:when>

    <xsl:when test=". = '-'">
      <span class="metamark line">
        <xsl:value-of select="."/>
      </span>
    </xsl:when>

    <xsl:when test=". = 'L'">
      <span class="metamark L">
        <xsl:value-of select="."/>
      </span>
    </xsl:when>

    <xsl:when test=". = 'X'">
      <span class="metamark X">
        <xsl:value-of select="."/>
      </span>
    </xsl:when>

  </xsl:choose>
  </span>
</xsl:template>


<!-- sic and corr-->
<xsl:template match="tei:choice">
  <span class="choice">
    <span class="sic"><xsl:value-of select="tei:sic"/></span>
    <span class="corr"><xsl:value-of select="tei:corr"/></span>
  </span>
</xsl:template>



</xsl:stylesheet>  