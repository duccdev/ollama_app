import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/types/message.dart';
import 'package:ollama_app/widgets/ez/text.dart';

class EzMessage extends StatelessWidget {
  const EzMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          message.pfp,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EzText(message.username, fontSize: 20, bold: true),
                message.content == null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 30,
                        child: Shimmer.fromColors(
                          baseColor: Globals.ctp.surface0,
                          highlightColor: Globals.ctp.text,
                          period: const Duration(milliseconds: 1500),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.3),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : EzText(
                        message.content!,
                        fontSize: 20,
                        color: (message.error ?? false)
                            ? Globals.ctp.red
                            : Globals.ctp.text,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
