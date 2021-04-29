import 'dart:math';

Random rn = new Random();

int randomNumberValues(int low, int high) {
  int number = low + rn.nextInt(high - low);
  return number;
}
