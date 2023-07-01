import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(pubName: 'corbado_api'),
  inputSpecFile: './lib/src/services/corbado_api/openapi/corbado_public_api.yml',
  generatorName: Generator.dart,
  outputDirectory: './lib/src/services/corbado_api/generated',
)
class CorbadoApiClient extends OpenapiGeneratorConfig {}
