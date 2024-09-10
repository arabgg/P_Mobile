import 'package:pertemuan3/pertemuan3.dart' as pertemuan3;

void main() {
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print('prima : $i');
      print("nama  : Zaidan");
      print("nim   : 2241760130");
    }
  }
}

bool isPrime(int number) {
  if (number <= 0) return false;
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) return false;
  }
  return true;
}
