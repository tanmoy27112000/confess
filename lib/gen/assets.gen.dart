/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/anonymous.png
  AssetGenImage get anonymous =>
      const AssetGenImage('assets/icons/anonymous.png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// List of all assets
  List<AssetGenImage> get values => [anonymous, search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/banner_bg.png
  AssetGenImage get bannerBg =>
      const AssetGenImage('assets/images/banner_bg.png');

  /// File path: assets/images/banner_icon.png
  AssetGenImage get bannerIcon =>
      const AssetGenImage('assets/images/banner_icon.png');

  /// File path: assets/images/cover.png
  AssetGenImage get cover => const AssetGenImage('assets/images/cover.png');

  /// File path: assets/images/rectangle_shap.png
  AssetGenImage get rectangleShap =>
      const AssetGenImage('assets/images/rectangle_shap.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [background, bannerBg, bannerIcon, cover, rectangleShap];
}

class Assets {
  Assets._();

  static const String companyName = 'assets/companyName.csv';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  List<String> get values => [companyName];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
