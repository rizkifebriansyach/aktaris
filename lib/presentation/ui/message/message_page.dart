import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/data.dart';
import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends StatelessWidget {
  static String routeName = '/message';
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SkyAppBar.primary(
          title: 'Chat',
          centerTitle: true,
          titleStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 18
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              padding: const EdgeInsets.only(left: 25),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              iconSize: 30,
              onPressed: () {},
            )
          ]),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(206, 154, 230, 199).withOpacity(0.2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_sharp,
                    color: AppColors.primary.withOpacity(0.7),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      'Chat akan terhapus 2 x 24 jam setelah transaksi selesai',
                      style: AppStyle.body1
                          .copyWith(color: AppColors.primary.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                  separatorBuilder: (context, length) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(chatList[index]['image']),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            chatList[index]['name'],
                                            style: AppStyle.body1.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              '30 Days',
                                              style: AppStyle.body3
                                                  .copyWith(color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text(
                                          chatList[index]['message'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppStyle.body1
                                              .copyWith(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: AppStyle.body2
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
