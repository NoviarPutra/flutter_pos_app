import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../../../../../utils/color_pallete.dart';
import '../../../../widgets/basic_elevated_button.dart';
import '../../../../widgets/basic_form_text.dart';
import '../../../../widgets/title_form.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Daftar",
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
                        const TitleForm(title: "Nama*"),
                        BasicFormText(
                          name: "name",
                          hintText: "Nama Lengkap",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.min(6),
                          ]),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z]'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const TitleForm(title: "Email*"),
                        BasicFormText(
                          name: "email",
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 20),
                        const TitleForm(title: "Password*"),
                        BasicFormText(
                          name: "password",
                          hintText: "Password",
                          obsecureText: controller.obscureText.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
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
                          title: "Daftar",
                          onPressed: () => controller.register(),
                          isLoading: controller.isLoading.value,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Sudah punya akun? "),
                            InkWell(
                              onTap: () => Get.offAllNamed('/login'),
                              child: const Text(
                                "Masuk",
                                style: TextStyle(color: primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
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
    );
  }
}
