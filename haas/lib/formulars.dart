import './main.dart';

double tempritureCalculator(double temp) {
  switch (tempMode) {
    case 'k':
      return temp + 273.15;
    
    case 'f':
      return (temp * (9/5)) + 32;
  }
  return temp;
}

dynamic min(List nums) {
  var lowest = nums[0];
  for (var num in nums) {
    if (num < lowest) {
      lowest = num;
    }
  }
  return lowest;
}

