import './main.dart';

/// this coverts c -> f | k
double temperatureCalculator(double temp, GlobalVars globalVars) {
  switch (globalVars.deviceInfo.tempMode) {
    case 'k':
      return temp + 273.15;
    
    case 'f':
      return (temp * (9/5)) + 32;
  }
  return temp;
}

/// gets the lowest value in a list<double | int>
dynamic min(List<num> numbers) {
  var lowest = numbers[0];
  for (var num in numbers) {
    if (num < lowest) {
      lowest = num;
    }
  }
  return lowest;
}

