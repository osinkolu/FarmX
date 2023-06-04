/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avocado.jpeg
  AssetGenImage get avocado =>
      const AssetGenImage('assets/images/avocado.jpeg');

  /// File path: assets/images/bellpepper.jpeg
  AssetGenImage get bellpepper =>
      const AssetGenImage('assets/images/bellpepper.jpeg');

  /// File path: assets/images/carrot.jpeg
  AssetGenImage get carrot => const AssetGenImage('assets/images/carrot.jpeg');

  /// File path: assets/images/cherrypepper.jpeg
  AssetGenImage get cherrypepper =>
      const AssetGenImage('assets/images/cherrypepper.jpeg');

  /// File path: assets/images/diagnose.jpeg
  AssetGenImage get diagnose =>
      const AssetGenImage('assets/images/diagnose.jpeg');

  /// File path: assets/images/greenpeas.jpeg
  AssetGenImage get greenpeas =>
      const AssetGenImage('assets/images/greenpeas.jpeg');

  /// File path: assets/images/lemon.jpeg
  AssetGenImage get lemon => const AssetGenImage('assets/images/lemon.jpeg');

  /// File path: assets/images/maize.jpeg
  AssetGenImage get maize => const AssetGenImage('assets/images/maize.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [
        avocado,
        bellpepper,
        carrot,
        cherrypepper,
        diagnose,
        greenpeas,
        lemon,
        maize
      ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/Home.svg
  String get home => 'assets/svgs/Home.svg';

  /// File path: assets/svgs/Profile.svg
  String get profile => 'assets/svgs/Profile.svg';

  /// File path: assets/svgs/Vector.svg
  String get vector => 'assets/svgs/Vector.svg';

  /// File path: assets/svgs/Vector1.svg
  String get vector1 => 'assets/svgs/Vector1.svg';

  /// File path: assets/svgs/Vector2.svg
  String get vector2 => 'assets/svgs/Vector2.svg';

  /// File path: assets/svgs/back.png
  AssetGenImage get back => const AssetGenImage('assets/svgs/back.png');

  /// File path: assets/svgs/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/svgs/background.png');

  /// File path: assets/svgs/burger.svg
  String get burger => 'assets/svgs/burger.svg';

  /// File path: assets/svgs/cancel.svg
  String get cancel => 'assets/svgs/cancel.svg';

  /// File path: assets/svgs/cucumber.jpg
  AssetGenImage get cucumber => const AssetGenImage('assets/svgs/cucumber.jpg');

  /// File path: assets/svgs/notification.svg
  String get notification => 'assets/svgs/notification.svg';

  /// File path: assets/svgs/onions.jpg
  AssetGenImage get onions => const AssetGenImage('assets/svgs/onions.jpg');

  /// File path: assets/svgs/palm.jpg
  AssetGenImage get palm => const AssetGenImage('assets/svgs/palm.jpg');

  /// File path: assets/svgs/product.svg
  String get product => 'assets/svgs/product.svg';

  /// File path: assets/svgs/setting.svg
  String get setting => 'assets/svgs/setting.svg';

  /// File path: assets/svgs/shoppingbag.svg
  String get shoppingbag => 'assets/svgs/shoppingbag.svg';

  /// List of all assets
  List<dynamic> get values => [
        home,
        profile,
        vector,
        vector1,
        vector2,
        back,
        background,
        burger,
        cancel,
        cucumber,
        notification,
        onions,
        palm,
        product,
        setting,
        shoppingbag
      ];
}

class Assets {
  Assets._();

  static const String analysis = 'assets/analysis.json';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String iot = 'assets/iot.json';
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const String plantRecommendation = 'assets/plant-recommendation.json';
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();

  /// List of all assets
  List<dynamic> get values => [analysis, iot, logo, plantRecommendation];
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
