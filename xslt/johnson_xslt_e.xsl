<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="Riis" select="document('../xml/currentriis.xml')"/>
    <xsl:variable name="xspacer" select="50"/>
    <xsl:variable name="yspacer" select="25"/>
    
    
    <!--takes you to the document-->
    <xsl:template match="$Riis">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/johnsongraphs.html">
            <html>
                <head>
                    <title>Cause and Frequency</title>
                    <link rel="stylesheet" type="text/css" href="style.css"></link>
                    <div id="menu"><a href="index.html">Home</a> | <a href="about.html">About:</a> | <a href="testreadingview.html">Augmented Reading View:</a> | <a href="johnsongraphs.html">Graphs:</a> | <a href="SLC_excerciseE.html">Charts and Data:</a> | <a href="team.html">Meet Our Team!</a> | <a href="links.html">Links:</a></div>
                </head>
                    <body>
                        <h1>Total Causes of Death</h1>
                        <table border="1"><tr><th>Cause</th><th>Number</th></tr>
                        <xsl:for-each-group select=".//death" group-by="@cause"> 
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <tr>
                            <td><xsl:apply-templates select="@cause"/></td>
                                <td><xsl:value-of select="count(current-group())"/></td>
                            </tr>                                                                                       
                        </xsl:for-each-group>  
                        </table> 
                                                
                        <h1>Graph of the Total Causes of Death</h1>
                        This graph represents how many causes of death there were throughout the book and also the number of deaths associated with said cause.
                        <svg viewBox="0 0 500 500">
                            <g transform="translate(200,10)">
                                <xsl:for-each-group select=".//death" group-by="@cause">
                                    <xsl:sort select="count(current-group())" order="descending"/>
                                    
                                    
                                    <xsl:variable name="cause-count" select="count(current-group())"/>
                                    <xsl:variable name="cause" select="@cause"/>
                                    
                                    <line x1="0" x2="{$xspacer * $cause-count}" y1="{$yspacer * position()}" y2="{$yspacer * position()}" stroke-width="10" stroke="red"/>
                                    <text x="-25" y="{$yspacer * position() + 5}" text-anchor="end" stroke="white"><xsl:value-of select="@cause"/></text>
                                    <text x="{$xspacer * $cause-count + 10}" y="{$yspacer * position() + 5}" text-anchor="right" stroke="white"><xsl:value-of select="$cause-count"/></text>
                                </xsl:for-each-group>   
                                
                                <line x1="0" y1="0" x2="0" y2="{count(//div) * $yspacer}" stoke="blue" stroke-width="1"/>                                
                            </g>                                                                                                                                       
                        </svg>
                        
                      <!-- may need to move graph over in transform/translate, if not add the font element  -->  
                        
                        
                        <h1>Causes of Death by Chapter</h1>
                        <table border="1"><tr><th>Chapter</th><th>Causes</th></tr>
                            <xsl:for-each select="//chapter">
                                <tr>
                                    <td>Chapter <xsl:value-of select="chapnum/@number"/></td>
                                    <td> 
                                        <xsl:if test=".//death"><xsl:apply-templates select=".//death/@cause=>string-join(': ')"/></xsl:if>
                                    <xsl:if test="not(.//death)">(no mentions of death)</xsl:if>
                                    </td>                                    
                                </tr>                                                                                                                                
                            </xsl:for-each>                                                                                           
                        </table>                                                                                               
                    </body>
            </html>
        </xsl:result-document>
    </xsl:template>    
</xsl:stylesheet>