import 'dart:io';

double getInput(String prompt) {
  print(prompt);
  String? input = stdin.readLineSync();
  return double.tryParse(input ?? '') ?? 0.0;
}

// Fungsi operasi matematika.
double tambah(double a, double b) => a + b;
double kurang(double a, double b) => a - b;
double kali(double a, double b) => a * b;
double bagi(double a, double b) {
  if (b == 0) {
    throw ArgumentError('Pembagian dengan nol tidak diperbolehkan.');
  }
  return a / b;
}

// Fungsi kalkulator utama.
void kalkulator() {
  print('Selamat datang di Kalkulator Dart!');

  while (true) {
    print('\nPilih operasi yang ingin Anda lakukan:');
    print('1. Tambah (+)');
    print('2. Kurang (-)');
    print('3. Kali (*)');
    print('4. Bagi (/)');
    print('5. Keluar');

    print('Masukkan pilihan Anda (1-5): ');
    String? choice = stdin.readLineSync();

    if (choice == '5') {
      print('Terima kasih telah menggunakan Kalkulator Dart. Sampai jumpa!');
      break;
    }

    double num1 = getInput('Masukkan angka pertama: ');
    double num2 = getInput('Masukkan angka kedua: ');

    double hasil;

    switch (choice) {
      case '1':
        hasil = tambah(num1, num2);
        print('Hasil: $num1 + $num2 = $hasil');
        break;
      case '2':
        hasil = kurang(num1, num2);
        print('Hasil: $num1 - $num2 = $hasil');
        break;
      case '3':
        hasil = kali(num1, num2);
        print('Hasil: $num1 * $num2 = $hasil');
        break;
      case '4':
        try {
          hasil = bagi(num1, num2);
          print('Hasil: $num1 / $num2 = $hasil');
        } catch (e) {
          print(e);
        }
        break;
      default:
        print('Operasi tidak valid. Silakan pilih antara 1-5.');
    }
  }
}

void main() {
  kalkulator();
}
