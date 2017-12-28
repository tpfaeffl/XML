<!-- <?xml version="1.0" encoding="UTF-8"?> -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:template match="/">
	
	<!-- Author: Thomas Pfaeffle -->
	<!--Assignment 4 -->
	
	<!-- Use this file to transfer books.xml to XHTML. Displays the store name and address, 
	book categories in alphabetical order. Also publisher, publication date, author, title, price, book summary.
	
	h1 and h2 styles from default HTML definitions. These styles are defined in this xsl document: 
	
	storename {
	  display:block; 
	  color:black; 
	  font-size:20pt; 
	  margin-top: 20pt;
	  margin-bottom: 5pt;
	  }
	
	address {
		display:block; 
		color:black; 
		font-size:10pt;
	}
	
	messages {
		display:block; 
		color:red; 
		font-size:20pt; 
		margin-top: 20pt; 
		margin-bottom: 10pt;
	}
	
	
	name (book category) {
		color:blue; 
		font-size:20pt;
	}
	
	author, title, price selectors display as a bullet list {
	
		display:list-item; 
		color:black; 
		margin-left:20pt;
	}
	
	summary {
		display:block; 
		color:black; 
		margin-left:10pt; 
		margin-top:10pt; 
		margin-bottom: 20pt; 
		font-family:serif; 
		font-style: italic;
	}
	 -->
	
		<!-- transfer this HTML to XHTML for display -->
		<html>
			<head><title>Books for Sale</title></head>
				<body style="background-color:ivory">

<!-- This block mixes HTML elements with XML to pick up the store name and address -->				
				<xsl:for-each select="store">
				<h1>
				<xsl:apply-templates select="storename"/>
				</h1>		 
				</xsl:for-each>

<!-- This block mixes HTML elements with XML to pick up the "List of Books for Sale" message -->				
				<h2>				
				<xsl:for-each select="store/books">
					<xsl:apply-templates select="messages"/>
				</xsl:for-each>
				</h2>				
				
<!-- build template logic for book elements. The list is sorted alphabetically 
by name (book category). Adds Publisher and Date attributes. Adds an HTML element for "Note".
Could not figure out how to test for null values or existence of an attribute. -->
						<xsl:for-each select="store/books/book">
						<xsl:sort select="name"/>
							<xsl:apply-templates select="name" />
							<p><b>Publisher: <xsl:value-of select="@publisher"/> </b></p>
							<p><b>Publication Date: <xsl:value-of select="@year"/> </b></p> 
							<xsl:apply-templates select="author"/>
							<xsl:apply-templates select="title"/> 
							<xsl:apply-templates select="price"/>
							<xsl:apply-templates select="summary"/>	
							<p><b>Note: Price subject to availability.</b></p>			
						</xsl:for-each>
						
				</body>
		</html>
	</xsl:template>
	
<!-- template for store name, address, messages, name, author, title, 
	price, summary elements -->
	
<!-- This selector displays the storename (20pt) and address (10pt) in black font.  -->
	
 	<xsl:template match="storename">
	  <div style="display:block; color:black; font-size:20pt; margin-top: 20pt; margin-bottom: 5pt;">	  
			<xsl:value-of select="."/>
			</div>
			<div style="display:block; color:black; font-size:10pt;">
			<xsl:value-of select="@address"/>
			</div>
	</xsl:template>
	
<!-- this selector displays "List of Books for Sale" in red 20pt font -->
	
	<xsl:template match="messages">
		<div style="display:block; color:red; font-size:20pt; margin-top: 20pt; margin-bottom: 10pt;">
			<xsl:value-of select="."/>
		</div>	
	</xsl:template>	
	

<!-- This selector displays the category name of the books in blue font  -->	
	<xsl:template match="name">
		<div style="color:blue; font-size:20pt;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	
<!-- The author, title, price selectors display as a bullet list -->
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
	
<!-- This selector describes a summary of the book as a text block -->
		<xsl:template match="summary">
		<div style="display:block; color:black; margin-left:10pt; margin-top:10pt; margin-bottom: 20pt; font-family:serif; font-style: italic;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
</xsl:stylesheet>