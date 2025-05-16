// Openapi Generator last run: : 2025-05-16T11:52:49.373060
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(
    pubName: 'corbado_frontend_api_client',
    pubVersion: '2.2.0',
    pubDescription: 'Client for the Corbado Frontend API',
    pubHomepage: 'https://docs.corbado.com/overview/welcome',
  ),
  inputSpec: InputSpec(path: './lib/openapi/corbado_public_api.yml'),
  generatorName: Generator.dio,
  outputDirectory: './lib/frontendapi',
)

/// Represents the Corbado API client
class CorbadoApiClient {}