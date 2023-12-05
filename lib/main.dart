import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketscan/feature/marketScan/cubit/market_scan_cubit.dart';
import 'package:marketscan/interface/fetch_data.dart';
import 'package:marketscan/service/navigation_service.dart';
import 'package:marketscan/service/route_service.dart';

void main() => runApp(const Nymble());

class Nymble extends StatefulWidget {
  const Nymble({super.key});

  @override
  State<Nymble> createState() => _NymbleState();
}

class _NymbleState extends State<Nymble> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MarketScanCubit(DefaultLoadJson())..init(),
        ),
      ],
      child: MaterialApp(
        initialRoute: Routes.app,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: Routers.generateRoute,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
