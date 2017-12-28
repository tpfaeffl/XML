
Author: Thomas Pfaeffle
Date 12/22/2017
Assignment - 4

books.xsl--XHTML transfer file
books.xml--data file for books in the bookstore

internal-ie.png--screenshot of the result in IE and the internal browser.
google.png--the only output I get when I try to display it in Chrome.

OS: Windows 10
Browsers: IE, Internal browser. 
Google will not render the page at all. When I enter: 

Program Files (x86)\Google\Chrome\Application>chrome.exe --allow-file-access-from-files

All I get is the XML tree when I change the stylsheet type to "type="application/xsl""
Otherwise, I get a blank screen.

Inovations:

Added category for Romance in the XML
Exposed the messages (List of Books), publisher and year information. Added elements for store, book summary, 
storename with address attribute. 
Mixed XML with HTML in the XSD file.
book categories display in alphabetical order.
