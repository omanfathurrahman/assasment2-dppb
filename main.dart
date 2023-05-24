import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

var nama = "";
var prodi = "";
var fakultas = "";
var keperluan = "";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {
                    nama = text;
                  },
                  decoration: InputDecoration(hintText: "Nama"),
                ),
                TextField(
                  onChanged: (text) {
                    prodi = text;
                  },
                  decoration: InputDecoration(hintText: "Prodi"),
                ),
                TextField(
                  onChanged: (text) {
                    fakultas = text;
                  },
                  decoration: InputDecoration(hintText: "Fakultas"),
                ),
                TextField(
                  onChanged: (text) {
                    keperluan = text;
                  },
                  decoration: InputDecoration(
                      hintText: "Keperluan peminjaman kendaraan"),
                ),
                const SizedBox(height: 32),
                const Kendaraan(),
                const SizedBox(height: 32),
                const Durasi(),
                const SizedBox(height: 32),
                const SwitchGenap(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()),
                      );
                    },
                    child: const Text("Kirim permintaan"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum JenisKendaraan { avanzaXenia, elf }

JenisKendaraan? kendaraan = JenisKendaraan.avanzaXenia;

class Kendaraan extends StatefulWidget {
  const Kendaraan({super.key});

  @override
  State<Kendaraan> createState() => _KendaraanState();
}

class _KendaraanState extends State<Kendaraan> {
  // JenisKendaraan? _kendaraan = JenisKendaraan.avanzaXenia;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Jenis Kendaraan"),
        ListTile(
          title: const Text('Avanza/Xenia'),
          leading: Radio<JenisKendaraan>(
            value: JenisKendaraan.avanzaXenia,
            groupValue: kendaraan,
            onChanged: (JenisKendaraan? value) {
              setState(() {
                kendaraan = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Elf'),
          leading: Radio<JenisKendaraan>(
            value: JenisKendaraan.elf,
            groupValue: kendaraan,
            onChanged: (JenisKendaraan? value) {
              setState(() {
                kendaraan = value;
              });
            },
          ),
        )
      ],
    );
  }
}

class Durasi extends StatefulWidget {
  const Durasi({super.key});

  @override
  State<Durasi> createState() => _DurasiState();
}

enum DurasiPeminjaman { duaBelas, delapanBelas }

DurasiPeminjaman? durasi = DurasiPeminjaman.duaBelas;

class _DurasiState extends State<Durasi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Durasi Peminjaman Kendaraan"),
        ListTile(
          title: const Text('12 Jam'),
          leading: Radio<DurasiPeminjaman>(
            value: DurasiPeminjaman.duaBelas,
            groupValue: durasi,
            onChanged: (DurasiPeminjaman? value) {
              setState(() {
                durasi = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('18 Jam'),
          leading: Radio<DurasiPeminjaman>(
            value: DurasiPeminjaman.delapanBelas,
            groupValue: durasi,
            onChanged: (DurasiPeminjaman? value) {
              setState(() {
                durasi = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SwitchGenap extends StatefulWidget {
  const SwitchGenap({super.key});

  @override
  State<SwitchGenap> createState() => _SwitchGenapState();
}

final bool value = true;

class _SwitchGenapState extends State<SwitchGenap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Dengan Sopir"),
        SwitchListTile(
          value: value,
          onChanged: (value) {
            setState(
              () {
                value = !value;
              },
            );
          },
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Nama:" + nama),
            Text("Prodi:" + prodi),
            Text("Fakultas:" + fakultas),
            Text("Keperluan peminjaman:" + keperluan),
            Text("Jenis kendaraan:" + kendaraan.toString()),
            Text("Durasi Peminjaman:" + durasi.toString()),
            Text("Dengan sopir:" + (value ? 'ya' : 'tidak')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
