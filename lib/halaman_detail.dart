import 'package:kuistpm/data_buku.dart';
import 'package:flutter/material.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku buku;
  const HalamanDetail({Key? key, required this.buku}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isAda = true;
  String kondisi = "Tersedia";
  var warna = Colors.blue;

  statusbutton() {
    if (isAda == false) {
      return null;
    }
    else {
      return () {
        String text = " ";
        if (isAda == true) {
          setState(() {
            text = "Berhasil Meminjam Buku";
            kondisi = "Tidak Tersedia";
            warna = Colors.red;
            isAda = false;
          });
        }
        SnackBar snackBar = SnackBar(content: Text(text));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.buku.title}"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3,
              ),
              Container(
                height: 400,
                width: 260,
                padding: const EdgeInsets.all(5),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(widget.buku.imageLink),
                  ],
                ),
              ),

              Card(
                child: Container(
                  height: 150,
                  width: 800,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 90,
                        height: 450,
                      ),
                      //biar bertingkat diberi column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Judul                       : " + widget.buku.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Penulis                    : " + widget.buku.author,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Bahasa                    : " + widget.buku.language,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Negara                    : " + widget.buku.country,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Jumlah Halaman    : " + widget.buku.pages.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Tahun Terbit           : " +
                                widget.buku.year.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Status                    : ' + kondisi,
                            style: TextStyle(fontSize: 16, color: warna),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 35,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(10),
                    ),
                    onPressed: statusbutton(),
                    child: const Text('Pinjam Buku'),
                  )),
            ],
          ),
        ));
  }
}