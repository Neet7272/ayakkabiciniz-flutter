import 'package:flutter/material.dart';

void main() {
  runApp(const AyakkabicinizApp());
}

class AyakkabicinizApp extends StatefulWidget {
  const AyakkabicinizApp({super.key});

  @override
  State<AyakkabicinizApp> createState() => _AyakkabicinizAppState();
}

class _AyakkabicinizAppState extends State<AyakkabicinizApp> {
  final List<Map<String, dynamic>> ayakkabilar = [
    {
      "id": 1,
      "isim": "Spor Ayakkabı",
      "fiyat": 1200,
      "icon": Icons.directions_run,
      "resim": "assets/images/spor_ayakkabi.png",
      "numaraSecenekleri": [36, 37, 38, 39, 40, 41],
      "aciklama":
          "Nefes alabilen file yüzeyi ve esnek taban yapısı sayesinde gün boyu konfor sunar. Günlük yürüyüş, okul ve şehir içi kullanım için ideal bir modeldir. Darbe emici orta tabanı ayak yorgunluğunu azaltırken modern sportif tasarımı kombinlerinize dinamik bir görünüm katar.",
    },
    {
      "id": 2,
      "isim": "Futbol Ayakkabısı",
      "fiyat": 1800,
      "icon": Icons.sports_soccer,
      "resim": "assets/images/futbol_ayakkabisi.png",
      "numaraSecenekleri": [36, 37, 38, 39, 40, 41],
      "aciklama":
          "Dayanıklı sentetik üst yüzeyi ve zemin tutuşunu artıran dişli dış tabanı ile halı saha performansına odaklanır. Bileği destekleyen kalıbı ani yön değişimlerinde denge sağlar. Antrenman ve maç temposunda uzun ömürlü kullanım sunan, hız odaklı bir futbol ayakkabısıdır.",
    },
    {
      "id": 3,
      "isim": "Kışlık Bot",
      "fiyat": 1500,
      "icon": Icons.hiking,
      "resim": "assets/images/kislik_bot.png",
      "numaraSecenekleri": [36, 37, 38, 39, 40, 41],
      "aciklama":
          "Suya dayanıklı dış yüzeyi ve iç kısmındaki sıcak astarıyla soğuk havalarda ayaklarınızı korur. Kaymaz kauçuk tabanı yağmurlu ve karlı günlerde güvenli adım atmanıza yardımcı olur. Kış sezonunda hem günlük kullanım hem de uzun yürüyüşler için dayanıklı bir tercihtir.",
    },
    {
      "id": 4,
      "isim": "Topuklu Ayakkabı",
      "fiyat": 1300,
      "icon": Icons.woman,
      "resim": "assets/images/topuklu_ayakkabi.png",
      "numaraSecenekleri": [36, 37, 38, 39, 40, 41],
      "aciklama":
          "Zarif silueti ve dengeli topuk yüksekliğiyle özel davetlerde şıklığı tamamlar. Yumuşak iç tabanı uzun süreli kullanımda konforu desteklerken kaliteli dış materyali formunu korur. Elbise ve klasik kombinlerle uyum sağlayan zamansız bir stile sahiptir.",
    },
    {
      "id": 5,
      "isim": "Terlik",
      "fiyat": 400,
      "icon": Icons.beach_access,
      "resim": "assets/images/terlik.png",
      "numaraSecenekleri": [36, 37, 38, 39, 40, 41],
      "aciklama":
          "Hafif gövdesi ve yumuşak taban desteği sayesinde ev içinde ve yaz aylarında maksimum rahatlık sunar. Kolay temizlenebilen materyali günlük kullanımda pratiklik sağlar. Sade ve modern tasarımıyla plaj, balkon ve kısa dış mekan kullanımları için uygundur.",
    },
    {
      "id": 6,
      "isim": "Günlük Sneaker",
      "fiyat": 1450,
      "icon": Icons.shopping_bag,
      "resim": "assets/images/gunluk_sneaker.png",
      "numaraSecenekleri": [36, 37, 38, 39, 40, 41],
      "aciklama":
          "Günlük tempoya uygun nefes alabilen yapısı ve destekleyici tabanı ile gün boyu konfor sağlar. Aşınmaya dirençli dış tabanı farklı zeminlerde dengeli yürüyüş sunar. Spor-şık çizgisi sayesinde jean, eşofman ve casual kombinlerle kolayca uyum yakalar.",
    },
  ];

  final List<Map<String, dynamic>> sepet = [];

  void sepeteEkle(Map<String, dynamic> urun, int secilenNumara) {
    setState(() {
      final index = sepet.indexWhere(
        (item) => item["id"] == urun["id"] && item["numara"] == secilenNumara,
      );

      if (index != -1) {
        sepet[index]["adet"]++;
      } else {
        sepet.add({
          "id": urun["id"],
          "isim": urun["isim"],
          "fiyat": urun["fiyat"],
          "icon": urun["icon"],
          "resim": urun["resim"],
          "aciklama": urun["aciklama"],
          "numara": secilenNumara,
          "adet": 1,
        });
      }
    });
  }

  void adetArtir(int urunId, int numara) {
    setState(() {
      final index = sepet.indexWhere(
          (item) => item["id"] == urunId && item["numara"] == numara);
      if (index != -1) {
        sepet[index]["adet"]++;
      }
    });
  }

  void adetAzalt(int urunId, int numara) {
    setState(() {
      final index = sepet.indexWhere(
          (item) => item["id"] == urunId && item["numara"] == numara);
      if (index != -1) {
        if (sepet[index]["adet"] > 1) {
          sepet[index]["adet"]--;
        } else {
          sepet.removeAt(index);
        }
      }
    });
  }

  void urunSil(int urunId, int numara) {
    setState(() {
      sepet.removeWhere(
          (item) => item["id"] == urunId && item["numara"] == numara);
    });
  }

  int toplamSepetAdedi() {
    int toplam = 0;
    for (var item in sepet) {
      toplam += item["adet"] as int;
    }
    return toplam;
  }

  int toplamTutar() {
    int toplam = 0;
    for (var item in sepet) {
      toplam += (item["fiyat"] as int) * (item["adet"] as int);
    }
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayakkabıcınız',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => AnaSayfa(
              ayakkabilar: ayakkabilar,
              sepetAdedi: toplamSepetAdedi(),
            ),
          );
        }

        if (settings.name == '/detay') {
          final urun = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetaySayfasi(
              urun: urun,
              onSepeteEkle: (secilenNumara) {
                sepeteEkle(urun, secilenNumara);
              },
              sepetAdedi: toplamSepetAdedi(),
            ),
          );
        }

        if (settings.name == '/sepet') {
          return MaterialPageRoute(
            builder: (context) => SepetSayfasi(
              sepet: sepet,
              onArtir: adetArtir,
              onAzalt: adetAzalt,
              onSil: urunSil,
              toplamTutar: toplamTutar(),
            ),
          );
        }

        return null;
      },
    );
  }
}

class AnaSayfa extends StatefulWidget {
  final List<Map<String, dynamic>> ayakkabilar;
  final int sepetAdedi;

  const AnaSayfa({
    super.key,
    required this.ayakkabilar,
    required this.sepetAdedi,
  });

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String aramaMetni = "";

  @override
  Widget build(BuildContext context) {
    final filtrelenmisUrunler = widget.ayakkabilar.where((urun) {
      final isim = urun["isim"].toString().toLowerCase();
      return isim.contains(aramaMetni.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayakkabıcınız"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sepet');
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              if (widget.sepetAdedi > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      widget.sepetAdedi.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/banner.png',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  aramaMetni = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Ayakkabı ara...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.brown.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filtrelenmisUrunler.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                final urun = filtrelenmisUrunler[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detay',
                      arguments: urun,
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              urun["resim"],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            urun["isim"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${urun["fiyat"]} ₺",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetaySayfasi extends StatefulWidget {
  final Map<String, dynamic> urun;
  final ValueChanged<int> onSepeteEkle;
  final int sepetAdedi;

  const DetaySayfasi({
    super.key,
    required this.urun,
    required this.onSepeteEkle,
    required this.sepetAdedi,
  });

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  late final List<int> numaraSecenekleri;
  late int secilenNumara;

  @override
  void initState() {
    super.initState();
    numaraSecenekleri =
        List<int>.from(widget.urun["numaraSecenekleri"] as List);
    secilenNumara = numaraSecenekleri.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.urun["isim"]),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sepet');
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              if (widget.sepetAdedi > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      widget.sepetAdedi.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                child: Image.asset(
                  widget.urun["resim"],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.urun["isim"],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${widget.urun["fiyat"]} ₺",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.brown,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.urun["aciklama"],
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Numara Seçin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: numaraSecenekleri.map((numara) {
                return ChoiceChip(
                  label: Text(numara.toString()),
                  selected: secilenNumara == numara,
                  selectedColor: Colors.brown.shade200,
                  onSelected: (_) {
                    setState(() {
                      secilenNumara = numara;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  widget.onSepeteEkle(secilenNumara);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${widget.urun["isim"]} (Numara: $secilenNumara) sepete eklendi.",
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Sepete Ekle",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SepetSayfasi extends StatelessWidget {
  final List<Map<String, dynamic>> sepet;
  final Function(int, int) onArtir;
  final Function(int, int) onAzalt;
  final Function(int, int) onSil;
  final int toplamTutar;

  const SepetSayfasi({
    super.key,
    required this.sepet,
    required this.onArtir,
    required this.onAzalt,
    required this.onSil,
    required this.toplamTutar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
        centerTitle: true,
      ),
      body: sepet.isEmpty
          ? const Center(
              child: Text(
                "Sepetiniz şu anda boş.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepet.length,
                    itemBuilder: (context, index) {
                      final urun = sepet[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: Icon(
                            urun["icon"],
                            size: 38,
                            color: Colors.brown,
                          ),
                          title: Text(
                            urun["isim"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Numara: ${urun["numara"]} • ${urun["fiyat"]} ₺ x ${urun["adet"]} = ${urun["fiyat"] * urun["adet"]} ₺",
                          ),
                          trailing: SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      onAzalt(urun["id"], urun["numara"]),
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                Text(
                                  urun["adet"].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      onArtir(urun["id"], urun["numara"]),
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                          ),
                          onLongPress: () {
                            onSil(urun["id"], urun["numara"]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${urun["isim"]} (${urun["numara"]}) sepetten silindi.",
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    border: const Border(
                      top: BorderSide(color: Colors.brown, width: 0.4),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Toplam Tutar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$toplamTutar ₺",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Sipariş işlemi başarıyla simüle edildi."),
                              ),
                            );
                          },
                          child: const Text(
                            "Siparişi Tamamla",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
