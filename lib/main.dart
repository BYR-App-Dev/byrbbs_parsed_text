import 'package:byrbbs_parsed_text/nforum_parsed_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  final String text =
      "测试[bbsemoji55357,57003][url=https://www.bupt.edu.cn]北邮网站[/url][bbsemoji55357,57027][bbsemoji55357,57017][bbsemoji55357,57028]北邮人论坛的各位用户：\n\n    近期论坛上出现多起用户帐号被盗后被不法份子用于发广告、屠版等恶劣行为，\n\n为保证用户和论坛的利益，请各位用户注意保护好自己的帐号密码，如果因为盗号行\n\n为导致不能正常发贴的用户请向站务联系。\n\n                                                     北邮人论坛站务委员会\n                                                       2015.1.3\n[bbsemoji55356,57104][bbsemoji55356,57301,65039][bbsemoji55356,57304,65039]\n[upload=1][/upload]~~~\n--\n";
  final List<UploadedModel> uploads = [
    UploadedModel(
        name: "logo.gif",
        url: "https://bbs.byr.cn/img/logo.gif",
        size: "999.3KB",
        thumbnailSmall: "https://bbs.byr.cn/img/logo.gif",
        thumbnailMiddle: "https://bbs.byr.cn/img/logo.gif"),
    UploadedModel(
        name: "2020_09.jpg",
        url: "http://bbs.byr.cn/img/welimg/2020_09.jpg",
        size: "1.1MB",
        thumbnailSmall: "http://bbs.byr.cn/img/welimg/2020_09.jpg",
        thumbnailMiddle: "http://bbs.byr.cn/img/welimg/2020_09.jpg"),
  ];

  bool simpleLinkHandler(String url) {
    print(url);
    return true;
  }

  Widget simpleImageAttachmentHandler(int upId) {
    return Image.network(NForumService.makeGetAttachmentURL(uploads[upId].url));
  }

  Widget simpleAudioAttachmentHandler(int upId) {
    return Text("this is an audio attachment, the url is $uploads[upId].url");
  }

  Widget simpleThemeAttachmentHandler(int upId) {
    return Text("this is a theme attachment, the url is $uploads[upId].url");
  }

  Widget simpleRefresherAttachmentHandler(int upId) {
    return Text("this is a theme attachment, the url is $uploads[upId].url");
  }

  Widget simpleOtherAttachmentHandler(int upId) {
    return Text("this attachment type is not supported on mobile, the url is $uploads[upId].url");
  }

  Widget simpleExternalImageHandler(String url) {
    return Image.network(url);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: NForumParsedText(
              NForumTextParsingConfig.uploaded(
                text,
                uploads,
                title: "this is an example title of the article",
                isMDBackgroundDark: false,
                byrLinkHandler: simpleLinkHandler,
                webLinkHandler: simpleLinkHandler,
                contentColor: Colors.black,
                quoteColor: Colors.grey,
                imageAttachmentWidget: simpleImageAttachmentHandler,
                audioAttachmentWidget: simpleAudioAttachmentHandler,
                themeAttachmentWidget: simpleThemeAttachmentHandler,
                refresherAttachmentWidget: simpleRefresherAttachmentHandler,
                otherAttachmentWidget: simpleOtherAttachmentHandler,
                externalImageWidget: simpleExternalImageHandler,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
