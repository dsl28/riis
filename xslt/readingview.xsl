<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="riis" select="document('../xml/currentriis.xml')"/>
    
    <xsl:template match="$riis"><!--whc: When calling for a variable, it needs to start with a dollar sign: $riis  -->
        <xsl:result-document method="xhtml" indent="yes" href="../docs/testreadingview.html">
        <html>
            
            <head><title>How The Other Half Lives</title>
                <link rel="stylesheet" type="text/css" href="style.css"/></head> <!--whc: Your html is already in the docs folder, so you should get rid of the file path that climbs up out of the docs folder and drops back down into it. Oddly, this would prevent your css from working on GitHub Pages, as the Frankenstein team discovered recently. You just want "style.css" here. -->
            
            <body>
                <!--whc: This is where you want to insert your header and nav bar. You can just copy that straight from index.html and paste it in here. -->
                
                <!--whc: OK, now for the page content. Because you have a mix of elements in the XML, you won't want to use an xsl:for-each. Instead, use <xsl:apply-templates/>, without a select attribute, to say "pass over the whole text of the input document". Below that, maybe put an <hr/> element (horizontal rule, to separate parts of the page), add a footer to the page, and then you're at the end of your top-level template rule: that should be followed by the closing tags for body and html. Everything thereafter will be separate template rules that say, for example, match on <p> in the input and re-tag it with <p> in the output. You'll need to decide what heading sizes to use for things like chapter titles. The template rules you have below to tag bits of text with span/class look good and should start to work right away at that point. This is also where Hunter should be adding the special template rules to handle the tables. These will look a little different because they will say, in effect, "anything inside a table element should be passed over including all elements, attributes, and attribute values". -->
                <xsl:apply-templates/>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="table">
        <table><xsl:apply-templates/></table>
        </xsl:template>
    
    <xsl:template match="table/@*">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>        
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody><xsl:apply-templates/></tbody>
    </xsl:template>
    
    <xsl:template match="tr">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="td">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    
    <xsl:template match="a">
        <a><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="immigrants">
        <span class="immigrants"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="conditions">
        <span class="conditions"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="death">
        <span class="death"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="vice">
        <span class="vice"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="disease">
        <span class="disease"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="crime">
        <span class="crime"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="work">
        <span class="work"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="policing">
        <span class="policing"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="children">
        <span class="children"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="charity">
        <span class="charity"><xsl:apply-templates/></span>
    </xsl:template>
    
    
    
</xsl:stylesheet>
    





