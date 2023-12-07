import 'package:exercise/core/const/colors.dart';
import 'package:exercise/product/extension/context/border_radius.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/material.dart';

class ClubScreen extends StatelessWidget with _PageUtility {
  const ClubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              // * Resim ve yazıyı üst üste getirmek için Stack widgeti kullanıldı.
              children: <Widget>[
                Container(
                  height: context.sized.dynamicHeigth(0.34),
                  width: context.sized.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/turkeymap.jpg'),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        AppColor.whiteheaven.getColor().withOpacity(0.0),
                        AppColor.whiteheaven.getColor().withOpacity(1),
                      ],
                      stops: const [0.53, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                ),
                Positioned(
                  top: 23,
                  right: 20,
                  child: TextButton(
                    onPressed: () {
                      //      * QR Code Scanner'a yönlendirme yapılacak.
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: context.border.smallBorderRadius,
                        color: Colors.white70,
                      ),
                      //  ? QR Code Scanner fotoğraf mı olsun yoksa icon mu?
                      child: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  top: context.sized.dynamicHeigth(0.28),
                  child: Text("Macera Kulübü",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                )
              ],
            ),
            Container(
              // MİD
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColor.whiteheaven.getColor(),
                  AppColor.snowflake.getColor(),
                ], stops: const [
                  0.1,
                  1.0
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: context.sized.dynamicHeigth(0.07),
                        width: context.sized.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: context.border.smallBorderRadius,
                          color: AppColor.lakeSide.getColor(),
                          border: Border.all(
                            color: Colors.blue.shade200,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              spreadRadius: 0.5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          "Birlikte Harika Açık Havayı Keşfedin, Gelişin ve Fethedin.",
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              kulupToplanma(context,
                                  ikon: Icons.location_on_sharp,
                                  title: " Öğrenci Merkezi , Oda 201"),
                              kulupToplanma(context,
                                  ikon: Icons.schedule,
                                  title: " Her Perşembe saat 18:30'da"),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // * Kulübe katılma sayfasına yönlendirme yapılacak.
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.camellia.getColor(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: context.border.smallBorderRadius,
                              ),
                            ),
                            child: Text("ŞİMDİ KATIL",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                          )
                        ],
                      ),
                      Container(
                        height: context.sized.dynamicHeigth(0.28),
                        width: context.sized.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColor.whiteheaven.getColor(),
                          borderRadius: context.border.smallBorderRadius,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.transparent.withOpacity(0.05),
                              spreadRadius: 0.5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Ne Yapıyoruz",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  "  Aşağıdaki tarzda açık hava gezileri organize ediyoruz.",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Row(
                                children: [
                                  gezicontainer(
                                      geziIcon: "assets/images/hiking.png",
                                      geziIsmi: "Doğa Yürüyüşü"),
                                  gezicontainer(
                                      geziIsmi: "Kamp",
                                      geziIcon: "assets/images/tent.png"),
                                  gezicontainer(
                                      geziIsmi: "Sörf",
                                      geziIcon: "assets/images/surfing.png"),
                                ],
                              ),
                              Row(
                                children: [
                                  gezicontainer(
                                      geziIcon: "assets/images/snowboard.png",
                                      geziIsmi: "Kayak"),
                                  gezicontainer(
                                      geziIcon: "assets/images/kano.png",
                                      geziIsmi: "Kano Turları"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      const Divider(),
                      const SizedBox(height: 10),
                      Text(
                        "Üyelik",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lime.shade50.withOpacity(0.4),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              "assets/images/hands.png",
                              fit: BoxFit.cover,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          title: Text(
                            "Üyelik kolay ve tüm öğrencilere açıktır.",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: context.sized.dynamicHeigth(0.19),
                        width: context.sized.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.lime.shade50.withOpacity(0.4),
                          borderRadius: context.border.smallBorderRadius,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.transparent,
                              spreadRadius: 0.5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "Kulüp Açıklaması",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                'Macera Kulübü, 2015 yılında kurulmuş olup, Türkiye\'nin her yerinden macera severleri bir araya getirmeyi amaçlamaktadır',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _PageUtility {
  Padding gezicontainer({required String geziIsmi, required geziIcon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 6, top: 8),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xfffdf9f6),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(geziIcon,
                    height: 28, width: 28, fit: BoxFit.cover),
              ),
              Text(geziIsmi,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox kulupToplanma(BuildContext context,
      {required IconData ikon, required String title}) {
    return SizedBox(
      height: context.sized.dynamicHeigth(0.07),
      width: context.sized.width * 0.45,
      child: Row(
        children: [
          Icon(ikon),
          Text(
            title,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
