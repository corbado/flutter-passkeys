class Checkpoint {
  final String name;
  final String description;
  final CheckpointType type;
  final String? documentationLink;

  Checkpoint({
    required this.name,
    required this.description,
    required this.type,
    this.documentationLink,
  });

  String toString() {
    return 'Checkpoint: $name\n'
           'Description: $description\n'
           'Type: $type\n'
           'Documentation Link: ${documentationLink ?? "N/A"}';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'type': type.toString(),
      'documentationLink': documentationLink,
    };
  }
}

enum CheckpointType { success, warning, error }