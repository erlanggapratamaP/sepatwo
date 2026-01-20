class Link {
  dynamic url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  @override
  String toString() => 'Link(url: $url, label: $label, active: $active)';

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json['url'] as dynamic,
    label: json['label'] as String?,
    active: json['active'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'active': active,
  };

  Link copyWith({dynamic url, String? label, bool? active}) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }
}
