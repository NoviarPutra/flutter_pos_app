import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:pos_app/utils/color_pallete.dart';

import '../../../../widgets/basic_elevated_button.dart';
import '../../../../widgets/basic_form_text.dart';
import '../../../../widgets/title_form.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => FormBuilder(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleForm(title: "Email"),
                          BasicFormText(
                            name: "email",
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validator: FormBuilderValidators.required(),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Password"),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    "Lupa Password?",
                                    style: TextStyle(color: primary),
                                  ),
                                )
                              ],
                            ),
                          ),
                          BasicFormText(
                            name: "password",
                            hintText: "Password",
                            obsecureText: controller.obscureText.value,
                            keyboardType: TextInputType.visiblePassword,
                            validator: FormBuilderValidators.required(),
                            suffixIcon: InkWell(
                              onTap: () => controller.obscureText.value =
                                  !controller.obscureText.value,
                              child: Icon(
                                controller.obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          BasicElevatedButton(
                            title: "Log in",
                            onPressed: () => controller.login(),
                            isLoading: controller.isLoading.value,
                          ),
                          const SizedBox(height: 20),
                          BasicElevatedButton(
                            title: "Buat Akun",
                            color: Colors.grey.shade300,
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Dengan Login anda menyetujui",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Ketentuan dan Kebijakan Privasi",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
