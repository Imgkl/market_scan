import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketscan/feature/marketScan/cubit/market_scan_cubit.dart';
import 'package:marketscan/feature/marketScan/models/market_scan.dart';
import 'package:marketscan/widgets/variable_text.dart';

part '../widgets/body_parser.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Scan'),
      ),
      body: BlocBuilder<MarketScanCubit, MarketScanState>(
        builder: (context, state) {
          if (state.scanData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.scanData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MarketScanCard(
                  data: state.scanData[index],
                  key: ValueKey(state.scanData[index].id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MarketScanCard extends StatefulWidget {
  final MarketScan data;
  const MarketScanCard({super.key, required this.data});

  @override
  State<MarketScanCard> createState() => _MarketScanCardState();
}

class _MarketScanCardState extends State<MarketScanCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandIconColor: Colors.white,
      expandedHeaderPadding: const EdgeInsets.all(0),
      dividerColor: Colors.black,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.black,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(widget.data.name,
                  style: const TextStyle(color: Colors.white)),
              subtitle: Text(widget.data.tag,
                  style: TextStyle(color: widget.data.color)),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _getCriteriaBody(widget.data.criteria),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
