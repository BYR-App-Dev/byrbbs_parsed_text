# byrbbs_parsed_text

[EN](./README.md)|中文

基于Flutter的显示NForum文章的控件

## 结构
- main.dart
    
    示例程序入口


- nforum_parsed_text.dart
    
    显示文章的控件

- nforum_service.dart

    附件文件的数据结构

## 如何在北邮人论坛客户端中使用
- 把这个仓库添加到pubspec文件中
- 添加一个NForumParsedText控件，参数为填好的NForumTextParsingConfig

|||
|----------|----------|
|text| 文章文字内容|
|uploads| 文章附件|
|title| 文章标题 (当前未被使用)
|isMDBackgroundDark| markdown是否使用暗色配色|
|byrLinkHandler| 处理北邮人论坛链接的函数，如页面跳转|
|webLinkHandler| 处理链接的函数，如在webview中打开|
|contentColor| 文章文字内容颜色|
|quoteColor| 文章引用文字内容颜色|
|imageAttachmentWidget| 生成图片附件显示控件的函数|
|audioAttachmentWidget| 生成音频附件显示控件的函数|
|themeAttachmentWidget| 生成自定义配色附件显示控件的函数|
|refresherAttachmentWidget| 生成自定义刷新动画显示控件的函数|
|otherAttachmentWidget| 生成其他附件显示控件的函数|
|externalImageWidget| 生成外部图片显示控件的函数|

## 依赖
- flutter_markdown: ^0.4.3
- fast_gbk: ^0.1.2+1
- characters: ^1.0.0