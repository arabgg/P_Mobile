import 'dart:io';

void main() {
  print("========================================");
  print("       Program Menghitung IPK Mahasiswa      ");
  print("========================================");

  stdout.write("Masukkan jumlah semester: ");
  int jumlahSemester = int.parse(stdin.readLineSync()!);

  double totalSKS = 0;
  double totalNilai = 0;

  for (int i = 1; i <= jumlahSemester; i++) {
    stdout.write("Masukkan jumlah mata kuliah semester $i: ");
    int jumlahMatkul = int.parse(stdin.readLineSync()!);

    double nilaiSemester = 0;
    double sksSemester = 0;

    for (int j = 1; j <= jumlahMatkul; j++) {
      stdout.write("Masukkan nama mata kuliah ke $j: ");
      String namaMatkul = stdin.readLineSync()!;

      stdout.write("Masukkan jumlah sks matkul: ");
      int sks = int.parse(stdin.readLineSync()!);

      stdout.write("Masukkan nilai matkul: ");
      String nilaiHuruf = stdin.readLineSync()!.toUpperCase();

      double nilaiAngka;
      switch (nilaiHuruf) {
        case 'A':
          nilaiAngka = 4.0;
          break;
        case 'B':
          nilaiAngka = 3.0;
          break;
        case 'C':
          nilaiAngka = 2.0;
          break;
        case 'D':
          nilaiAngka = 1.0;
          break;
        case 'E':
          nilaiAngka = 0.0;
          break;
        default:
          nilaiAngka = 0.0;
          break;
      }

      sksSemester += sks;
      nilaiSemester += nilaiAngka * sks;
    }

    totalSKS += sksSemester;
    totalNilai += nilaiSemester;

    double nr = nilaiSemester / sksSemester;
    print("\n----------------------------------------");
    print("Hasil Semester $i:");
    print("SKS   : $sksSemester");
    print("NR    : ${nr.toStringAsFixed(2)}");
    print("----------------------------------------\n");
  }

  double ipk = totalNilai / totalSKS;
  print("========================================");
  print("Total SKS : $totalSKS");
  print("IPK       : ${ipk.toStringAsFixed(2)}");
  print("========================================");
}