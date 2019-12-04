import 'dart:collection';

///  Is this a valid credit card number?
///  Are credit card numbers just a random combination of the digits from 0-9? NO!
//  Credit card numbers are a systematic combination of numbers that can satisfy
//  a single test. This test is created so that errors can be avoided while
//  typing in credit card numbers as well as detect counterfeit cards!
//
//  The algorithm is as follows:
//
//  - Reverse the order of the digits in the number.
//  - Take the first, third, ... and every other odd digit in the reversed digits
//  and sum them to form the partial sum s1
//  - Taking the second, fourth ... and every other even digit in the reversed digits:
//        - Multiply each digit by two and sum the digits if the answer is greater
//          than nine to form partial sums for the even digits
//        - Sum the partial sums of the even digits to form s2
//  - If s1 + s2 ends in zero then the original number is in the form of a valid
//  credit card number as verified by the Luhn test.
//  Example
/// Input : 49927398716
/// Output: 49927398716 passes the test
bool checkCard(String cardNumber) {
  List<String> card = cardNumber.split("");
  print(card);
  List<String> reversedCard = [];
  for (int i = card.length - 1; i >= 0; i--) {
    reversedCard.add(card[i]);
  }
  print(reversedCard);
  return ((partialSumS1(reversedCard) + partialSumS2(reversedCard)) % 10 == 0);
}

partialSumS1(List<String> card) {
  int S1 = 0;
  for (int i = 0; i < card.length; i = i + 2) {
    S1 = S1 + int.parse(card[i]);
  }
  return S1;
}

partialSumS2(List<String> card) {
  int S2 = 0;
  for (int i = 1; i < card.length; i = i + 2) {
    S2 = S2 + reduceToOneDigit(int.parse(card[i]) * 2);
  }
  return S2;
}

int reduceToOneDigit(int input) {
  int output;
  (input > 9) ? output = (input ~/ 10) + input % 10 : output = input;
  return output;
}

main() {
  print(checkCard("49927398716"));
}
