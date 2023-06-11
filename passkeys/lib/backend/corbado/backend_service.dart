import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(pubName: 'corbado_api'),
  inputSpecFile: './lib/backend/corbado/openapi/corbado_public_api.yml',
  generatorName: Generator.dart,
  outputDirectory: './lib/backend/corbado/generated',
)
class BackendService extends OpenapiGeneratorConfig {}
