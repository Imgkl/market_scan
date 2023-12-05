part of '../screens/app.dart';

List<Widget> _getCriteriaBody(Criteria criteria) {
  switch (criteria[0]['type']) {
    case "plain_text":
      List<Widget> plainText = [];
      for (Map<String, dynamic> criteriaData in criteria) {
        plainText.add(
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  criteriaData['text'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return plainText;
    case "variable":
      List<Widget> variable = [];
      for (Map<String, dynamic> criteriaData in criteria) {
        variable.add(CriteriaWidget(criteria: criteriaData));
      }
      return variable;
    default:
      return [];
  }
}
