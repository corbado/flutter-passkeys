import 'package:flutter/material.dart';
import 'package:passkeys_example/auth_service.dart';

class SelectTestConfiguration extends StatefulWidget {
  const SelectTestConfiguration({
    required this.configurations,
    required this.selectedConfiguration,
    required this.onSelectConfiguration,
    super.key,
  });

  final void Function(Configuration?) onSelectConfiguration;
  final Configuration? selectedConfiguration;
  final List<Configuration> configurations;

  @override
  _SelectTestConfigurationState createState() =>
      _SelectTestConfigurationState();
}

class _SelectTestConfigurationState extends State<SelectTestConfiguration> {
  Configuration? _selectedConfiguration;

  @override
  void initState() {
    super.initState();
    _selectedConfiguration = widget.selectedConfiguration;
  }

  @override
  void didUpdateWidget(covariant SelectTestConfiguration oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedConfiguration != widget.selectedConfiguration) {
      setState(() {
        _selectedConfiguration = widget.selectedConfiguration;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Configuration?>(
      key: const Key('test-selector'),
      value: _selectedConfiguration,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      hint: const Text('Select Configuration'),
      underline: Container(height: 2, color: Colors.deepPurpleAccent),
      items: widget.configurations
          .map(
            (Configuration configuration) => DropdownMenuItem<Configuration?>(
              value: configuration,
              child: Text(configuration.name),
            ),
          )
          .toList(),
      onChanged: (Configuration? newValue) {
        setState(() {
          _selectedConfiguration = newValue;
        });
        widget.onSelectConfiguration(newValue);
      },
    );
  }
}
