import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_field.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: true,
    home: TestFirst(),
  ));
}

class TestFirst extends StatelessWidget {
  static String routeName = '/test';
  const TestFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      // body: Column(
      body: SafeArea(
      child: SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/aktaris_logo_green.png',
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Form(
                  // key: controller.formKeyLogin,
                  child: Column(
                    children: [
                      // CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //       "https://scontent.fmji4-1.fna.fbcdn.net/v/t39.30808-6/340150796_1632318903937773_3651605346755215475_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=UKlVcr0UaF8AX-qQLRe&_nc_ht=scontent.fmji4-1.fna&oh=00_AfDDQVlYMKIpcdQbjj-D_KSKjVl_JpoxKc3gkB6HboROdw&oe=64481C81"),
                      //   radius: 50,
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Text(
                      //   "AKTARIS",
                      //   style: TextStyle(
                      //     fontFamily: "Pacifico", 
                      //     fontSize: 40, color: Colors.black),
                      // ),
                      Text(
                        "Masuk / Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "SourceSansPro",
                          letterSpacing: 3,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        endIndent: 20,
                        indent: 20,
                        thickness: 0.4,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomFieldForm(
                        // controller: controller.emailController,
                        label: 'Email',
                        hint: 'Masukan email',
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.mail,
                        maxLines: 1,
                        // validator: (value) => ValidatorHelper.field(
                        //   title: 'email',
                        //   value: value.toString(),
                        //   regex: AppRegex.email,
                        // ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Obx(() => 
                      CustomPasswordFieldForm(
                          // controller: controller.passwordController,
                          label: 'Kata Sandi',
                          hint: 'Masukan kata sandi',
                          // hiddenText: controller.hiddenText.value,
                          icon: Icons.lock,
                          // validator: (value) => ValidatorHelper.field(
                          //   title: 'Kata sandi',
                          //   value: value.toString(),
                          //   regex: AppRegex.password,
                          // ),
                          // endIcon: IconButton(
                          //   icon: Icon((controller.hiddenText.value)
                          //       ? Icons.visibility
                          //       : Icons.visibility_off),
                          //   onPressed: () {
                          //     controller.hiddenText.value =
                          //         !controller.hiddenText.value;
                          //   },
                          // ),
                          // endIcon: ,
                        ),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: ListTile(
                          leading: Icon(
                            Icons.email_sharp,
                            color: Colors.teal,
                          ),
                          title: Text("Libya/Tripoli"),
                        ),
                      ),
                      SkyButton(
                        text: 'Masuk',
                        textColor: Colors.white,
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}