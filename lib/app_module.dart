import 'package:flutter_modular/flutter_modular.dart';
import 'package:mooviedb/core/network/api/api_constants.dart';
import 'package:mooviedb/core/network/api/dio_client.dart';

import 'moovies/movies_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => DioClient(apiBaseUrl: ApiConstants.baseUrlDebug),
        ),
        Bind.lazySingleton((i) => i.get<DioClient>().dio),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: MovieModule(),
    ),
  ];
}
