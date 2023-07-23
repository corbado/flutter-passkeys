import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(pubName: 'corbado_api'),
  inputSpecFile: './lib/openapi/corbado_public_api.yml',
  generatorName: Generator.dart,
  outputDirectory: './lib/frontendapi'
)
class CorbadoApiClient extends OpenapiGeneratorConfig {}
