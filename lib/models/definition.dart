class Definition {
  String definition;
  int thumbs_up;
  int thumbs_down;
  DateTime writtenOn;
  String example;

  getWrittenOnDate() {
    return "${writtenOn.year}-${writtenOn.month}-${writtenOn.day}";
  }

  Definition(
      {this.definition,
      this.example,
      this.thumbs_up,
      this.thumbs_down,
      this.writtenOn});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
        definition: json['definition'],
        example: json['example'],
        thumbs_up: json['thumbs_up'],
        thumbs_down: json['thumbs_down'],
        writtenOn: DateTime.parse(json['written_on']));
  }
}
