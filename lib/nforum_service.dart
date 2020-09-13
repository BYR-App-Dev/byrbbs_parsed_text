import 'dart:io';

import 'package:flutter/widgets.dart';

class NForumService {
  static String token = "put your byrbbs oauth token here";
  static String makeGetAttachmentURL(String url) {
    return url + "?oauth_token=" + token ?? "";
  }
}

abstract class UploadedExtractor<T> {
  ImageProvider getProvider(T upload);
  bool getIsGroupShowable(T upload);
  bool getIsImage(T upload);
  bool getIsAudio(T upload);
  bool getIsTheme(T upload);
  bool getIsRefresher(T upload);
  String getAudioLoc(T upload);
  bool getIsAudioLocal(T upload);
  String getImgThumbnail(T upload);
  String getShowUrl(T upload);
  bool getIsPreview(T upload);
  bool getIsUsed(T upload);
  String getFileName(T upload);
  void setIsUsed(T upload, bool afterValue);
}

class PreviewUploadedModel {
  final String path;
  final int type;
  bool used;
  PreviewUploadedModel(this.path, this.type, {this.used = false});
}

class UploadedModel {
  UploadedModel({this.name, this.url, this.size, this.thumbnailSmall, this.thumbnailMiddle, this.used = false});
  String name;
  String url;
  String size;
  String thumbnailSmall;
  String thumbnailMiddle;
  bool used = false;
}

class PreviewUploadedExtractor extends UploadedExtractor<PreviewUploadedModel> {
  @override
  ImageProvider getProvider(PreviewUploadedModel upload) {
    String imagePath = upload.path;
    ImageProvider imageProvider;
    if (imagePath.contains('file://')) {
      final file = File.fromUri(Uri.parse(imagePath));
      imageProvider = FileImage(file);
    } else {
      imageProvider = NetworkImage(imagePath);
    }
    return imageProvider;
  }

  @override
  bool getIsGroupShowable(PreviewUploadedModel upload) {
    return false;
  }

  @override
  bool getIsImage(PreviewUploadedModel upload) {
    return upload.type == 1;
  }

  @override
  String getShowUrl(PreviewUploadedModel upload) {
    return upload.path;
  }

  @override
  bool getIsUsed(PreviewUploadedModel upload) {
    return upload.used;
  }

  @override
  void setIsUsed(PreviewUploadedModel upload, bool afterValue) {
    upload.used = afterValue;
  }

  @override
  bool getIsAudio(PreviewUploadedModel upload) {
    return upload.type == 2;
  }

  @override
  String getAudioLoc(PreviewUploadedModel upload) {
    return upload.path;
  }

  @override
  bool getIsAudioLocal(PreviewUploadedModel upload) {
    String path = upload.path;
    if (path.contains('file://')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  bool getIsPreview(PreviewUploadedModel upload) {
    return true;
  }

  @override
  String getImgThumbnail(PreviewUploadedModel upload) {
    return upload.path;
  }

  @override
  bool getIsTheme(PreviewUploadedModel upload) {
    String path = upload.path;
    if (path.contains('file://') && path.endsWith('.byrapptheme')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String getFileName(PreviewUploadedModel upload) {
    return " ";
  }

  @override
  bool getIsRefresher(PreviewUploadedModel upload) {
    String path = upload.path;
    if (path.contains('file://') && path.endsWith('.byrapprefresher')) {
      return true;
    } else {
      return false;
    }
  }
}

class UploadedModelUploadedExtractor extends UploadedExtractor<UploadedModel> {
  @override
  ImageProvider getProvider(UploadedModel upload) {
    if (upload.thumbnailMiddle == "") {
      return null;
    } else {
      String _curPicUrl = NForumService.makeGetAttachmentURL(upload.url);
      return NetworkImage(_curPicUrl);
    }
  }

  @override
  bool getIsGroupShowable(UploadedModel upload) {
    if (upload.thumbnailMiddle == "") {
      return false;
    } else {
      return true;
    }
  }

  @override
  bool getIsImage(UploadedModel upload) {
    if (upload.thumbnailMiddle == "") {
      return false;
    } else {
      return true;
    }
  }

  @override
  String getShowUrl(UploadedModel upload) {
    return NForumService.makeGetAttachmentURL(upload.url);
  }

  @override
  bool getIsUsed(UploadedModel upload) {
    return upload.used;
  }

  @override
  void setIsUsed(UploadedModel upload, bool afterValue) {
    upload.used = afterValue;
  }

  @override
  bool getIsAudio(UploadedModel upload) {
    return upload.name.length > 4 &&
        (upload.name.endsWith(".mp3") || upload.name.endsWith(".m4a") || upload.name.endsWith(".aac"));
  }

  @override
  String getAudioLoc(UploadedModel upload) {
    return NForumService.makeGetAttachmentURL(upload.url);
  }

  @override
  bool getIsAudioLocal(UploadedModel upload) {
    return false;
  }

  @override
  bool getIsPreview(UploadedModel upload) {
    return false;
  }

  @override
  String getImgThumbnail(UploadedModel upload) {
    return NForumService.makeGetAttachmentURL(upload.thumbnailMiddle);
  }

  @override
  bool getIsTheme(UploadedModel upload) {
    return upload.name.endsWith(".byrapptheme");
  }

  @override
  bool getIsRefresher(UploadedModel upload) {
    return upload.name.endsWith(".byrapprefresher");
  }

  @override
  String getFileName(UploadedModel upload) {
    return upload.name ?? "";
  }
}
