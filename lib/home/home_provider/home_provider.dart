import 'package:flutter/widgets.dart';
import '../../common/cutom_snackbar.dart';

class HomeProvider with ChangeNotifier {
  bool next = false;
  final TextEditingController numberController = TextEditingController();
  late final TextEditingController emailConntroller = TextEditingController();
  final TextEditingController fssaiController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final descriptionFormKey = GlobalKey<FormState>();
  changeNext() {
    next = !next;
    notifyListeners();
  }

  validation() {
    if (formKey.currentState!.validate()) {
      next = !next;
      notifyListeners();
    }
  }

  submit(BuildContext context) {
    if (descriptionFormKey.currentState!.validate()) {
      clearTextfields();
      next = !next;
      notifyListeners();
      customSnackBar(context, "Form successfully submitted");
    }
  }

  clearTextfields() {
    addressController.clear();
    descriptionController.clear();
    nameController.clear();
    fssaiController.clear();
    emailConntroller.clear();
    numberController.clear();
  }
}
