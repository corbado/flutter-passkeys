import 'package:flutter/material.dart';
import 'package:passkeys_example/auth_service.dart';
import 'package:passkeys_example/local_relying_party_server.dart';

class SelectTestConfiguration extends StatelessWidget {
  SelectTestConfiguration(
      {Key? key,
      required this.configurations,
      required this.selectedConfiguration,
      required this.onSelectConfiguration})
      : super(key: key);

  final ValueSetter<Configuration?> onSelectConfiguration;
  final Configuration? selectedConfiguration;
  final List<Configuration> configurations;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Configuration?>(
      key: key,
      value: selectedConfiguration,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      items: configurations
          .map(
              (Configuration configuration) => DropdownMenuItem<Configuration?>(
                    value: configuration,
                    child: Text(configuration.name),
                  ))
          .toList(),
      onChanged: onSelectConfiguration,
    );
  }
}
