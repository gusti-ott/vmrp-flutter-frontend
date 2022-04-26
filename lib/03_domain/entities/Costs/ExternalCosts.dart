class ExternalCosts {
  final double air;
  final double noise;
  final double climate;
  final double upstream;
  final double accidents;
  final double space;

  ExternalCosts(
      {required this.air,
      required this.noise,
      required this.climate,
      required this.upstream,
      required this.accidents,
      required this.space});

  getAllExternalCosts() {
    return (air + noise + climate + upstream + accidents + space);
  }
}
