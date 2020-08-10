class Pagination {
  int skip;
  int take;

  int _skip;
  int _take;

  Pagination({
    this.skip = 0,
    this.take = 10,
  }) {
    _skip = skip;
    _take = take;
  }

  void reset() {
    skip = _skip;
    take = _take;
  }

  void increment() {
    skip += take;
  }

  Pagination copyWith(
    int skip,
    int take,
  ) {
    return Pagination(
      skip: skip ?? this.skip,
      take: take ?? this.take,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Skip': skip?.toString(),
      'Take': take?.toString(),
    };
  }
}
