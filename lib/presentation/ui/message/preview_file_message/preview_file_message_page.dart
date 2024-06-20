import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

import '../../../../config/theme/app_style.dart';
import '../../../widget/custom_appbar.dart';

class PreviewFileMessagePage extends GetView<ChatScreenController> {
  static String routeName = '/preview-file';
  const PreviewFileMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: path.basename(controller.filePath!.path),
          titleStyle: const TextStyle(
              color: Colors.black, fontFamily: "Poppins", fontSize: 18),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => (controller.filePath!.path.contains(".pdf"))
                  ? PDFView(
                      filePath: controller.filePath!.path,
                      nightMode: false,
                      enableSwipe: false,
                      fitPolicy: FitPolicy.BOTH,
                      onViewCreated: (vc) {
                        controller.pdfViewController = vc;
                      },
                    )
                  : Image.file(
                      controller.filePath!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: Container(
                        decoration:
                            const BoxDecoration(shape: BoxShape.rectangle),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 100,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                controller:
                                    controller.inputMessageFileController,
                                decoration: const InputDecoration(
                                    hintText: 'Tulis pesan...',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins'),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                                // onChanged: (value) {
                                //   controller.chatMessage = value;
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        controller.sendFile(controller.filePath);
                        controller.inputMessageFileController.clear();
                      },
                      child: Image.asset(
                        'assets/icons/send_icon.png',
                        width: 50,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
