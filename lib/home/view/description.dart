import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../common/custom_text.dart';
import '../../common/textform.dart';
import '../home_provider/home_provider.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: h * 0.2,
              ),
              Text(
                'Partner with us',
                style: GoogleFonts.lobster(
                    fontSize: 30, color: const Color.fromARGB(255, 0, 76, 138)),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: value.descriptionFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: value.addressController,
                        validator: (val) {
                          return val!.isNotEmpty
                              ? null
                              : "This field is required";
                        },
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        decoration: textFieldInputDecoration(
                          'Address',
                          radius: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: value.descriptionController,
                        validator: (val) {
                          return val!.isNotEmpty
                              ? null
                              : "This field is required";
                        },
                        textInputAction: TextInputAction.next,
                        maxLines: 6,
                        decoration: textFieldInputDecoration(
                          'Description',
                          radius: 10,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 76, 138)),
                      onPressed: () {
                        value.changeNext();
                      },
                      child: customText("Previous"),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 12, 12, 12)),
                      onPressed: () {
                        value.submit(context);
                      },
                      child: customText("Submit"),
                    ),
                  )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
