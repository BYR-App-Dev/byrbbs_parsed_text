# byrbbs_parsed_text

EN|[中文](./README-CN.md)

A Flutter widget to display NForum articles

## Structure
- main.dart
    
    the main entry of the example application


- nforum_parsed_text.dart
    
    the widget to display article

- nforum_service.dart

    data models of uploaded files

## How to use it in byrbbs app
- add this repository into pubspec file
- insert a NForumParsedText widget with a filled NForumTextParsingConfig instance as argument.

|||
|----------|----------|
|text| content of the article|
|uploads| attachments of the article|
|title| title of the article (currently not used in the display)
|isMDBackgroundDark| this is to specify whether markdown component to use dark theme|
|byrLinkHandler| the function to handle byrbbs URLs, e.g. page routing|
|webLinkHandler| the function to handle URLs e.g. opening in webview|
|contentColor| the text color for article content|
|quoteColor| the text color for article quote|
|imageAttachmentWidget| how to generate a widget for image attachment display|
|audioAttachmentWidget| how to generate a widget for audio attachment display|
|themeAttachmentWidget| how to generate a widget for customized theme attachment display|
|refresherAttachmentWidget| how to generate a widget for customized refresher attachment display|
|otherAttachmentWidget| how to generate a widget for other attachment display|
|externalImageWidget| how to generate a widget for external (non-attachment) image display|