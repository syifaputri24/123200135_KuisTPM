import 'package:kuistpm/halaman_detail.dart';
import 'package:kuistpm/data_buku.dart';
import 'package:flutter/material.dart';

class HalamanList extends StatelessWidget {
  const HalamanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Buku'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HalamanDetail(buku: buku,),),
              );
            },
            child: Card(
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.height/2,
                width: 800,
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                      child: SizedBox(
                          height: 800,
                          width: 300,
                          child: Image.network(buku.imageLink)
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buku.title,
                          style: TextStyle(fontSize: 25),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          buku.author,
                          style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                          maxLines: 1,
                        ),

                      ],

                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
