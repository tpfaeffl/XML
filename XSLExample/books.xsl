<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:template match="/">
		<!-- transfer this HTML to XHTML for display -->
		<html >
			<head><title>Books for Sale</title></head>
				<body style="background-color:ivory">
				<h1>Tom's Bookstore</h1>
				<p><b>Address: San Mateo, California</b></p> 
				
				<xsl:for-each select="books">
					<xsl:apply-templates select="messages"/>
				</xsl:for-each>
				
				
				
					<!-- build template logic for book elements -->
						<xsl:for-each select="books/book">
							<xsl:apply-templates select="name" />
							<xsl:apply-templates select="author"/>
							<xsl:apply-templates select="title"/>
							<xsl:apply-templates select="price"/>
							<xsl:apply-templates select="summary"/>				
						</xsl:for-each>
				</body>
		</html>
	</xsl:template>
	
	<!-- template for name, author, title, price elements -->
	
	<xsl:template match="messages">
		<div style="display:block; color:red; font-size:20pt; margin-top: 20pt; margin-bottom: 10pt;">
			<xsl:value-of select="."/>
		</div>	
	</xsl:template>	
	<xsl:template match="name">
		<div style="color:blue; font-size:20pt;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="author">
		<div style="display:list-item; color:black; margin-left:20pt;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="title">
		<div style="display:list-item; color:black; margin-left:20pt;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="price">
		<div style="display:list-item; color:black; margin-left:20pt;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
		<xsl:template match="summary">
		<div style="display:block; color:black; margin-left:10pt; margin-top:10pt; margin-bottom: 20pt; font-family:serif; font-style: italic;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
</xsl:stylesheet>