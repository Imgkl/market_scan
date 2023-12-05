import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marketscan/service/navigation_service.dart';
import 'package:marketscan/service/route_service.dart';

class CriteriaWidget extends StatelessWidget {
  final Map<String, dynamic> criteria;

  const CriteriaWidget({super.key, required this.criteria});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: highlightVariableText(criteria['text'], criteria['variable']),
      ),
    );
  }

  TextSpan highlightVariableText(String text, Map<String, dynamic> variables) {
    final RegExp variablePattern = RegExp(r'\$\d+');

    final Iterable<RegExpMatch> matches = variablePattern.allMatches(text);

    final List<TextSpan> textSpans = [];

    int startIndex = 0;

    for (RegExpMatch match in matches) {
      textSpans.add(TextSpan(text: text.substring(startIndex, match.start)));

      final String variableName = match.group(0)!;

      textSpans.add(
        TextSpan(
          text: variableName,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              NavigationService.instance.pushNamed(Routes.details,
                  args: criteria['variable'][variableName]);
            },
        ),
      );

      startIndex = match.end;
    }

    textSpans.add(TextSpan(text: text.substring(startIndex)));

    return TextSpan(children: textSpans);
  }
}
