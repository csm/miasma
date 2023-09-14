import 'package:flutter/foundation.dart';
import 'package:veilid/veilid.dart';

void veilidInit() {
  if (kIsWeb) {
    var platformConfig = const VeilidWASMConfig(
        logging: VeilidWASMConfigLogging(
            performance: VeilidWASMConfigLoggingPerformance(
                enabled: true,
                level: VeilidConfigLogLevel.debug,
                logsInTimings: true,
                logsInConsole: false),
            api: VeilidWASMConfigLoggingApi(
                enabled: true,
                level: VeilidConfigLogLevel.debug)
        )
    );
    Veilid.instance.initializeVeilidCore(platformConfig.toJson());
  } else {
    var platformConfig = const VeilidFFIConfig(
        logging: VeilidFFIConfigLogging(
            terminal: VeilidFFIConfigLoggingTerminal(
                enabled: false,
                level: VeilidConfigLogLevel.debug),
            otlp: VeilidFFIConfigLoggingOtlp(
                enabled: false,
                level: VeilidConfigLogLevel.debug,
                grpcEndpoint: "localhost:4317",
                serviceName: "miasma"),
            api: VeilidFFIConfigLoggingApi(enabled: true, level: VeilidConfigLogLevel.debug)));
    Veilid.instance.initializeVeilidCore(platformConfig.toJson());
  }
}