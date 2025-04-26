class PollOption {
  final String option;
  int votes;

  PollOption({required this.option, this.votes = 0});

  factory PollOption.fromJson(Map<String, dynamic> json) {
    return PollOption(
      option: json['option'] as String? ?? '',
      votes: json['votes'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option': option,
      'votes': votes,
    };
  }

  PollOption copyWith({
    String? option,
    int? votes,
  }) {
    return PollOption(
      option: option ?? this.option,
      votes: votes ?? this.votes,
    );
  }

  // Since poll options are comma delimited strings, we need to convert them to a list of PollOption objects.
  static List<PollOption> fromString(String options) {
    return options.split(',').map((e) => PollOption(option: e.trim())).toList();
  }
}
