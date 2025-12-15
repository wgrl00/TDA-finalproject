<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->

    <xsl:template match="tei:TEI">
     <div class="row">
        <div class="col">
      
        <b>Title: </b><xsl:value-of select="//tei:title"/><br/>
        <b>Author: </b><xsl:value-of select="//tei:author"/><br/>
        <b>Editor: </b><xsl:value-of select="//tei:editor"/><br/>
        <b>State: </b><xsl:value-of select="//tei:state"/><br/>
        <b>Date Written: </b><xsl:value-of select="//tei:date_written"/><br/>
        </div>

<!-- table with statistics -->
<div class="col">    
    <h3>Number of modifications:</h3>
  <table id="pageTable" border="1" cellpadding="4" cellspacing="0">
      <thead>
      <tr>
      <th>Type</th>
      <th>Percy</th>
      <th>Mary</th>
      <th>Total</th>
      </tr>
      </thead>

    <tbody>
      <tr>
        <td>Additions</td>
        <td><xsl:value-of select="count(//tei:add[@hand='#PBS'])"/></td>
        <td><xsl:value-of select="count(//tei:add[@hand='#MWS'])"/></td>
       <td><xsl:value-of select="count(//tei:add)"/></td>
      </tr>

      <tr>
       <td>Deletions</td>
        <td><xsl:value-of select="count(//tei:del[@hand='#PBS'])"/></td>
        <td><xsl:value-of select="count(//tei:del[@hand='#MWS'])"/></td>
       <td><xsl:value-of select="count(//tei:del)"/></td>
      </tr>

      <tr>
       <td><b>Total</b></td>
        <td><xsl:value-of select="count(//tei:add[@hand='#PBS']) + count(//tei:del[@hand='#PBS'])"/></td>
        <td><xsl:value-of select="count(//tei:add[@hand='#MWS']) + count(//tei:del[@hand='#MWS'])"/></td>
        <td><xsl:value-of select="count(//tei:add) + count(//tei:del)"/></td>
     </tr>
    </tbody>
</table>
</div>                          

</xsl:stylesheet>





