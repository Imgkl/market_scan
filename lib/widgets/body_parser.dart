part of '../screens/app.dart';

List<Widget> _getCriteriaBody(Criteria criteria) {
  switch (criteria[0]['type']) {
    case "plain_text":
      List<Widget> plainText = [];
      for (Map<String, dynamic> criteriaData in criteria) {
        plainText.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              if (criteria.last != criteriaData)
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "and\n",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
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
        Widget x = CriteriaWidget(criteria: criteriaData);

        variable.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              x,
              if (criteria.last != criteriaData)
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "and\n",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
        );
      }
      return variable;
    default:
      return [];
  }
}
