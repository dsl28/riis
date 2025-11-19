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
                    <link/>
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
                    
                    <xsl:variable name="TagChart" select="document('SLC_excerciseE.html')"/>
                    
                    <!-- universal variables-->
                    <xsl:variable name="xspacer" select="30"/>
                    <xsl:variable name="yspacer" select="15"/>
                    <svg viewBox="0 0 1000 650">
                        <g transform="translate(250,10)">
                            <xsl:for-each-group select="//body//persName" group-by="@n">

                                <!--whc: these are local variables, meaning they only operate on the current group in the for-each-group loop-->
                                <xsl:variable name="pers-occurrence-count" select=""/>
                                <xsl:variable name="person-sequence" select="position()"/>
                                
                                <!--whc: this creates each bar in the bar graph-->
                                <line x1="0" x2="{$xspacer * $pers-occurrence-count}" 
                                    y1="{$yspacer * $person-sequence}" y2="{$yspacer * $person-sequence}"
                                    stroke-width="10" stroke="red"/>
                                
                                <!--whc: this labels each bar with the index number and name of each person-->
                                <text x="-10" y="{$yspacer * $person-sequence}" text-anchor="end">
                                    <xsl:value-of select="$person-sequence"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="string()[1]"/></text>
                                
                                <!--whc: this places the count number after the end of each bar-->
                                <text x="{$xspacer * $pers-occurrence-count + 10}" y="{$yspacer * $person-sequence}" text-anchor="right">
                                    <xsl:value-of select="$pers-occurrence-count"/></text>
                                
                            </xsl:for-each-group>
                            
                            <!--whc: this creates the vertical reference line: note that it is OUTSIDE the for-loop-->
                            <line x1="0" y1="0" x2="0" y2="{count(//body//persName=>distinct-values()) * $yspacer}" stroke="blue" stroke-width="1"/>
                            
                        </g>
                    </svg>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>