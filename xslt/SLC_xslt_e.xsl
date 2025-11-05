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
                    <title></title>
                    <link/>
                </head>
                <body>
                    <table>
                        <tr>
                            <th>Lable</th>
                            <th>string-length</th>
                        </tr>
                        <xsl:for-each select="//chapter">
                            <tr>
                                <td>chapter <xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select=".//crime =>string-join() =>string-length()"/></td>
                            </tr>
                        </xsl:for-each>
                        
                    </table>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>