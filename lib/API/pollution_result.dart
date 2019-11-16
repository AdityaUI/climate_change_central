
class PollutionResult {
  final double result;

  PollutionResult({this.result});

  factory PollutionResult.fromJson(Map<String, dynamic> json) {
    return PollutionResult(
      result: json['result'],
    );
  }

  double getResult(){
    return result;
  }

  @override
  String toString() {
    // TODO: implement toString
    return result.toString();
  }
}
