<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="Riis" select="document('../xml/currentriis.xml')"/>
    <!--takes you to the document-->
    <xsl:template match="$Riis">
        <xsl:result-document method="xhtml" indent="yes" href="..docs/johnson_exercise_e.html">
            <html>
                <head>
                    <title>Cause and Frequency</title>
                    <link/>
                    <body>
                        Causes of Death in Each Chapter
                        <table border="1"><tr><th>Cause</th><th>Number</th></tr>
                        <xsl:for-each-group select=".//death" group-by="@cause"> 
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <tr>
                            <td><xsl:apply-templates select="@cause"/></td>
                                <td><xsl:value-of select="count(current-group())"/></td>
                            </tr>                                                                                       
                        </xsl:for-each-group>  
                        </table>   
                    </body>
                </head>
            </html>
        </xsl:result-document>
    </xsl:template>    
</xsl:stylesheet>