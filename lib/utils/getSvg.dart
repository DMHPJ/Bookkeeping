import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasicSvgProps {
  final double? width;
  final double? height;
  final Color? color;

  BasicSvgProps({this.width, this.height, this.color});
}

Future<String?> getSvgUrl(name) async {
  String imgUrl = "http://120.76.43.198:9597/svg/$name.svg";

  try {
    (await NetworkAssetBundle(
      Uri.parse(imgUrl),
    ).load(imgUrl)).buffer.asUint8List();
    return imgUrl;
  } catch (e) {
    return null;
  }
}

class GetSvg {
  static Widget url(String name, {BasicSvgProps? props}) {
    return FittedBox(
      fit: BoxFit.contain,
      child: FutureBuilder(
        future: getSvgUrl(name),
        builder: (context, url) {
          bool error = url.data == null;
          return error
              ? SvgPicture.asset(
                "assets/svg/pic_break.svg",
                fit: BoxFit.contain,
                width: props?.width,
                height: props?.height,
                colorFilter:
                    props?.color != null
                        ? ColorFilter.mode(props!.color!, BlendMode.srcIn)
                        : null,
              )
              : SvgPicture.network(
                url.data!,
                fit: BoxFit.contain,
                width: props?.width,
                height: props?.height,
                colorFilter:
                    props?.color != null
                        ? ColorFilter.mode(props!.color!, BlendMode.srcIn)
                        : null,
              );
        },
      ),
    );
  }
}
