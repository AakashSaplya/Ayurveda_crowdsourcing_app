import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class vpkChange extends StatefulWidget {
  final int V;
  final int P;
  final int K;
  const vpkChange({Key? key, required this.V, required this.P, required this.K})
      : super(key: key);

  @override
  State<vpkChange> createState() => _vpkChangeState();
}

// ignore: camel_case_types
class _vpkChangeState extends State<vpkChange> {
  @override
  Widget build(BuildContext context) {
    return widget.V != 0
        ? widget.V > 0
            ? widget.V == 1
                ? Lottie.network(
                    "https://assets3.lottiefiles.com/packages/lf20_khrclx93.json") //V == 1
                : Lottie.network(
                    "https://assets6.lottiefiles.com/packages/lf20_fzqgqxxw.json") //V == 2
            : widget.V == -1
                ? Lottie.network(
                    "https://assets2.lottiefiles.com/datafiles/mBcU0bs3hiqgyCF/data.json") //V == -1
                : Lottie.network(
                    "https://assets6.lottiefiles.com/private_files/lf30_muhbrucd.json") //V == -2
        : widget.P != 0
            ? widget.P > 0
                ? widget.P == 1
                    ? Lottie.network(
                        "https://assets10.lottiefiles.com/packages/lf20_no9qrf5p.json") //P == 1
                    : Lottie.network(
                        "https://assets3.lottiefiles.com/packages/lf20_gkmkgw96.json") //P == 2
                : widget.P == -1
                    ? Lottie.network(
                        "https://assets10.lottiefiles.com/packages/lf20_ugupogp1.json") //P == -1
                    : Lottie.network(
                        "https://assets4.lottiefiles.com/packages/lf20_bgmkqg6b.json") //P == -2
            : widget.K != 0
                ? widget.K > 0
                    ? widget.K == 1
                        ? Lottie.network(
                            "https://assets9.lottiefiles.com/packages/lf20_spzm7slx.json") //K == 1
                        : Lottie.network(
                            "https://assets2.lottiefiles.com/packages/lf20_w9GTXN.json") //K == 2
                    : widget.K == -1
                        ? Lottie.network(
                            "https://assets1.lottiefiles.com/packages/lf20_puh9ap4k.json") //K == -1
                        : Lottie.network(
                            "https://assets10.lottiefiles.com/packages/lf20_jggbnfb8.json") //K == -2
                : Lottie.network(
                    "https://assets7.lottiefiles.com/private_files/lf30_qkyxqwha.json"); //V = 0 or P == 0 or K == 0

    /* ? widget.P == 0
            ? widget.K == 0
                ? Lottie.network(
                    'https://assets8.lottiefiles.com/private_files/lf30_qkyxqwha.json')
                : Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_spzm7slx.json')
            : Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_5dbf6say.json')
        : Lottie.network(
            'https://assets6.lottiefiles.com/packages/lf20_khrclx93.json');*/
  }
}
