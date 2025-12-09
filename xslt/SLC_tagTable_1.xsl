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
                    <link rel="stylesheet" type="text/css" href="style.css"/>
                </head>
                <body>
                    <div id="menu">
                        <a href="index.html">Home</a> | <a href="about.html">About:</a> | <a href="testreadingview.html">Augmented Reading View:</a> | <a href="johnsongraphs.html">Graphs:</a> | <a href="SLC_excerciseE.html">Charts and Data:</a> | <a href="team.html">Meet Our Team!</a> | <a href="links.html">Links:</a>   
                    </div>
                    <h1>Elements of Jacob A. Riis's writings compared by the number of characters dedicated to a subject within each chapter.</h1>
                    <h2>Across the 25 chapters of the book our research found that conditions were afforded the longest and most frequent descriptions.</h2>
                    
                    <!-- slc: creates and colors the graph key-->
                    <p> <span style="background-color: red; color: black;">Conditions  </span>
                        <span style="background-color: blue; color: white;">Crime  </span>
                        <span style="background-color: green; color: black;">Vice  </span>
                        <span style="background-color: yellow; color: black;">Immigration  </span>
                        <span style="background-color: orange; color: black;">Disease  </span>
                        <span style="background-color: pink; color: black;">Work  </span>
                        <span style="background-color: purple; color: white;">Death  </span></p>
                    
                    <!-- universal variables-->
                    <xsl:variable name="xspacer" select="0.05"/>
                    <xsl:variable name="yspacer" select="15"/>
                    <svg viewBox="0 0 1000 450">
                        <g transform="translate(50,10)">
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
                                <!-- this creates the label for each line -->
                                <text x="-5"
                                    y="{$yspacer * $chapNum + 4}"
                                    text-anchor="end"
                                    font-size="10"
                                    fill="white">
                                    Chap <xsl:value-of select="$chapNum"/>
                                </text>
                                <!--slc: this creates the crime bar -->
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
                                
                                
                            </xsl:for-each>
                            
                        </g>
                    </svg>
                    
                    <h1>The table below displays the number of characters contained within each tag on a chapter by chapter basis.</h1>
                    <h2>By looking at this graph we can see that most of Riis's chapters are grouped up based on the subject that is covered. For example, the "Chinatown" (ch9) chapter has a much 
                        larger number of characters related to immigrants than the other chapters. Some chapters were largely made up of stories that did not fit into our tagging scheme. For example chapter 16 
                        "Waifs of the City's Slums" is almost entirely tragic stories about the fate of children living in these impoverished areas. Many of these stories fit slightly into one tag or another, 
                        but largely, they stand on their own and discuss other aspects of life in the slums that our tags did not accomodate.</h2>
                    <!-- this table counts the length of the sections about crime-->
                    <table>
                        <tr>
                            <th></th>
                            
                        </tr>
                        <!-- this for each rule matches on each chapter element-->
                        <xsl:for-each select="//chapter">
                            <tr>
                                <!-- this first table data finds the number of each chapter and places it into the first box-->
                                <th>chapter <xsl:value-of select="position()"/></th>
                                <th><xsl:value-of select="normalize-space(chaptitle)"/></th>
                            </tr>    
                            <tr>
                                <!-- these next parts count the length of each tag for each chapter-->
                                <td>conditions</td>
                                <td><xsl:value-of select=".//conditions =>string-join() =>string-length()"/></td>
                            </tr>
                                
                            <tr>
                                <td>crime</td>
                                <td><xsl:value-of select=".//crime =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <td>vice</td>
                                <td><xsl:value-of select=".//vice =>string-join() =>string-length()"/></td>
                            </tr>    
                            <tr>
                                <td>immigrants</td>
                                <td><xsl:value-of select=".//immigrants =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <td>disease</td>
                                <td><xsl:value-of select=".//disease =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <td>work</td>
                                <td><xsl:value-of select=".//work =>string-join() =>string-length()"/></td>
                            </tr>
                            <tr>
                                <td>death</td>
                                <td><xsl:value-of select=".//death =>string-join() =>string-length()"/></td>
                            </tr>
                        </xsl:for-each>
                        
                    </table>
                    
     

                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>