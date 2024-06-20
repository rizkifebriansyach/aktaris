import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/helper/media_helper.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_controller.dart';
import 'package:aktaris_app/presentation/ui/message/preview_file_message/preview_file_message_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../widget/custom_button.dart';

class ChatScreenPage extends GetView<ChatScreenController> {
  static String routeName = "/chat-screen";
  const ChatScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //* AppBar
              Container(
                height: 60,
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(Icons.arrow_back)),
                        const SizedBox(width: 10),
                        ProfilePicture(
                            name: LocalStorage.to.getDetailsNotaris()!.name!,
                            radius: 30,
                            fontsize: 14),
                        // const CircleAvatar(
                        //   radius: 20,
                        //   backgroundImage:
                        //       AssetImage('assets/images/user1_image.png'),
                        // ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              child: AutoSizeText(
                                LocalStorage.to.getDetailsNotaris()!.name!,
                                style: AppStyle.body1
                                    .copyWith(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Online',
                                  style: AppStyle.body2
                                      .copyWith(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // IconButton(
                        //   icon: const Icon(Icons.phone),
                        //   color: AppColors.primary,
                        //   onPressed: () {},
                        // ),
                        // IconButton(
                        //   icon: const Icon(Icons.video_call),
                        //   color: AppColors.primary,
                        //   onPressed: () {},
                        // ),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //* Category
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(width: 0.5, color: Colors.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/agreement_icon.png',
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Akta Jual Beli',
                            style: AppStyle.body2.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        '|',
                        style: AppStyle.body1.copyWith(fontSize: 20),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Obx(
                            () => Text(
                              '${controller.minutes.value.toString()} : ${controller.seconds.value.toString().padLeft(2, '0')}',
                              style:
                                  AppStyle.body2.copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //* Chat Container
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                child: Obx(
                  () => ListView.builder(
                      reverse: true,
                      itemCount: controller.listMessage.length,
                      itemBuilder: (context, index) {
                        var message = controller.listMessage[
                            controller.listMessage.length - 1 - index];
                        var timeStamp =
                            controller.listMessage[index].ts.toString();
                        var updatedAt =
                            controller.listMessage[index].updatedAt.toString();
                        // var timeStamp = element.ts.toString();
                        // var updatedAt = element.updatedAt.toString();
                        var _updatedAt = DateTime.parse(updatedAt);
                        var dateTime = DateTime.parse(timeStamp).toLocal();
                        String formateDate =
                            DateFormat('HH:mm').format(dateTime);
                        String dateHistoryChat =
                            DateFormat("dd-MM-yyyy").format(_updatedAt);
                        debugPrint(
                            "Message nya mana : ${controller.listMessage[index].msg}");
                        if (message.file?.name == null) {
                          return ChatBubble(
                            clipper: ChatBubbleClipper6(
                                type: (controller.isSendByMe.value ==
                                        controller
                                            .listMessage[index].u?.username)
                                    ? BubbleType.sendBubble
                                    : BubbleType.receiverBubble),
                            alignment: (controller.isSendByMe.value ==
                                    controller.listMessage[index].u?.username)
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            margin: const EdgeInsets.only(top: 20),
                            backGroundColor: (controller.isSendByMe.value ==
                                    controller.listMessage[index].u?.username)
                                ? AppColors.primary
                                : Colors.grey,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    (controller.isSendByMe.value ==
                                            controller
                                                .listMessage[index].u?.username)
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.listMessage[index].msg!,
                                    style: AppStyle.body1
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    formateDate,
                                    style: AppStyle.body3
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return ChatBubble(
                            clipper: ChatBubbleClipper6(
                                type: (controller.isSendByMe.value ==
                                        controller
                                            .listMessage[index].u?.username)
                                    ? BubbleType.sendBubble
                                    : BubbleType.receiverBubble),
                            alignment: (controller.isSendByMe.value ==
                                    controller.listMessage[index].u?.username)
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            margin: const EdgeInsets.only(top: 20),
                            backGroundColor: (controller.isSendByMe.value ==
                                    controller.listMessage[index].u?.username)
                                ? AppColors.primary
                                : Colors.grey,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    (controller.isSendByMe.value ==
                                            controller
                                                .listMessage[index].u?.username)
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/pdf_icon.png",
                                          width: 50,
                                        ),
                                        Flexible(
                                          child: Text(
                                            message.file!.name!,
                                            style: AppStyle.body1
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    message.msg!,
                                    style: AppStyle.body1
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    formateDate,
                                    style: AppStyle.body3
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                ),
              )),
              //* Input Text
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: Column(
                  children: [
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: double.maxFinite,
                        height: controller.cardHeight.value,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    iconWithText(
                                        onPressed: () {
                                          MediaHelper.pickFile(
                                                  source: ImageSource.gallery,
                                                  fileType: FileType.custom)
                                              .then((value) {
                                            if (value != null) {
                                              debugPrint(
                                                  "filename: ${controller.filePath}");
                                              controller.filePath = value;
                                            }
                                            if (controller.filePath != null) {
                                              Get.toNamed(PreviewFileMessagePage
                                                  .routeName);
                                            }
                                          });
                                        },
                                        icon: Icons.attach_file,
                                        text: "Document",
                                        background: const Color(0xFFFE2E74))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.rectangle),
                            child: Row(
                              children: [
                                Obx(
                                  () => IconButton(
                                      onPressed: () =>
                                          controller.cardHeight.value == 0
                                              ? controller.cardHeight.value =
                                                  220
                                              : controller.cardHeight.value = 0,
                                      icon: Icon(
                                          controller.cardHeight.value == 0
                                              ? Icons.add_circle_outline
                                              : Icons.cancel_outlined)),
                                ),
                                Text(
                                  '|',
                                  style: AppStyle.body1
                                      .copyWith(color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: 230,
                                  child: TextFormField(
                                    controller:
                                        controller.inputMessageController,
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
                            controller.sendMessage();
                            controller.inputMessageController.clear();
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
        ),
      ),
    );
  }

  Widget iconWithText({
    required VoidCallback onPressed,
    required IconData icon,
    required String text,
    required Color background,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onPressed,
          icon: icon,
          background: background,
          minWidth: 50,
          iconColor: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(.2),
            width: 1,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
