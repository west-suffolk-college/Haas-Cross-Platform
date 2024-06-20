String tempMode = 'c';

double tempritureCalculator(double temp) {
  switch (tempMode) {
    case 'k':
      return temp + 273.15;
    
    case 'f':
      return (temp * (9/5)) + 32;
  }
  return temp;
}
