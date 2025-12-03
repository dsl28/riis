<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="riis" select="document('../xml/currentriis.xml')"/>
    <xsl:template match="$riis">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/SLC_excerciseE.html">
            <html>
                <head>
                    <title># of characters contained within each tag per chapter.</title>
                    <!--<link/>-->
                </head>
                <body>
                    <!-- this table counts the length of the sections about crime-->
                    <table>
                        <tr>
                            <th>Chapter</th>
                            
                        </tr>
                        <!-- this for each rule matches on each chapter element-->
                        <xsl:for-each select="//chapter">
                            <tr>
                                <!-- this first table data finds the number of each chapter and places it into the first box-->
                                <td>chapter <xsl:value-of select="position()"/></td>
                            </tr>    
                            <tr>
                                <!-- these next parts count the length of each tag for each chapter-->
                                <th>conditions</th>
                                <td><xsl:value-of select=".//conditions =>string-join() =>string-length()"/></td>
                            </tr>
                                
                            <tr>
                                <th>crime</th>
                                <td><xsl:value-of select=".//crime =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <th>vice</th>
                                <td><xsl:value-of select=".//vice =>string-join() =>string-length()"/></td>
                            </tr>    
                            <tr>
                                <th>immigrants</th>
                                <td><xsl:value-of select=".//immigrants =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <th>disease</th>
                                <td><xsl:value-of select=".//disease =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <th>work</th>
                                <td><xsl:value-of select=".//work =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <th>death</th>
                                <td><xsl:value-of select=".//death =>string-join() =>string-length()"/></td>
                            </tr>
                        </xsl:for-each>
                        
                    </table>
                    
     
                    
                    <!-- universal variables-->
                    <xsl:variable name="xspacer" select="0.1"/>
                    <xsl:variable name="yspacer" select="15"/>
                    <svg viewBox="0 0 1000 1000">
                        <g transform="translate(25,10)">
                            <xsl:for-each select=".//chapter">

                                <!--slc: these are local variables-->
                                <xsl:variable name="chapNum" select="position()"/>
                                <xsl:variable name="conditions" select=".//conditions =>string-join() =>string-length()"/>
                                <xsl:variable name="crime" select=".//crime =>string-join() =>string-length()"/>
                                <xsl:variable name="vice" select=".//vice =>string-join() =>string-length()"/>
                                <xsl:variable name="immigrants" select=".//immigrants =>string-join() =>string-length()"/>
                                <xsl:variable name="disease" select=".//disease =>string-join() =>string-length()"/>
                                <xsl:variable name="work" select=".//work =>string-join() =>string-length()"/>
                                <xsl:variable name="death" select=".//death =>string-join() =>string-length()"/>    
                                <!--slc: this creates conditions bar-->
                                <line x1="0" x2="{$xspacer * $conditions}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="red"/>
                                <!--slc: this creates the next bar down-->
                                <line x1="{$xspacer * $conditions}" x2="{$xspacer * ($crime+$conditions)}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="blue"/>
                                <!--slc:this continues till end-->
                                <line x1="{$xspacer * ($conditions + $crime)}" x2="{$xspacer * ($vice+$crime+$conditions)}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="green"/>
                                <line x1="{$xspacer * ($conditions + $crime + $vice)}" x2="{$xspacer * ($immigrants+$vice+$crime+$conditions)}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="yellow"/>
                                <line x1="{$xspacer * ($conditions + $crime + $vice + $immigrants)}" x2="{$xspacer * ($disease+$immigrants+$vice+$crime+$conditions)}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="orange"/>
                                <line x1="{$xspacer * ($conditions + $crime + $vice + $immigrants + $disease)}" x2="{$xspacer * ($work+$disease+$immigrants+$vice+$crime+$conditions)}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="pink"/>
                                <line x1="{$xspacer * ($conditions + $crime + $vice + $immigrants + $disease + $work)}" x2="{$xspacer * ($death+$work+$disease+$immigrants+$vice+$crime+$conditions)}" 
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="purple"/>
                                <!--slc: ignore this for now
                                <text x="-10" y="{$yspacer * $conditions}" text-anchor="end">
                                    <xsl:value-of select="$conditions"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="string()[1]"/></text>
                                
                              <!
                                <text x="{$xspacer * $chapter + 10}" y="{$yspacer * $conditions}" text-anchor="right">
                                    <xsl:value-of select="$conditions"/></text>
                                -->
                            </xsl:for-each>
                            
                            <!--whc: this creates the vertical reference line: note that it is OUTSIDE the for-loop-->
                            <line x1="0" y1="0" x2="0" y2="{count(//body//conditions=>distinct-values()) * $yspacer}" stroke="blue" stroke-width="1"/>
                            
                        </g>
                    </svg>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>