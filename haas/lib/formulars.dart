double tempritureCalculator(double temp, String tempMode) {
  switch (tempMode) {
    case 'k':
      return temp + 273.15;
    
    case 'f':
      return (temp * (9/5)) + 32;
  }
  return temp;
}
