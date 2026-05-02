import 'dart:io';

import '../../app/modal/modal_popular_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/data_file.dart';
import '../modal/modal_card.dart';
import '../modal/modal_feature_event.dart';
import '../modal/modal_trending_event.dart';
import '../modal/model_country.dart';

mixin SearchableList<T> {
  List<T> sourceList = [];
  List<T> filteredList = [];

  void filterList(String value, List<T> list, String Function(T) nameSelector) {
    filteredList = list
        .where(
          (item) =>
              nameSelector(item).toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
  }
}

class IntroController extends GetxController {
  late PageController pageController;
  final ValueNotifier<int> selectedPage = ValueNotifier(0);
  final RxInt select = 0.obs;

  void change(RxInt index) {
    select.value = index.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address.';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password.';
    }
    return null;
  }
}

class ForgotController extends GetxController {
  late TextEditingController emailController;
  final forgotFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}

class ResetController extends GetxController {
  late TextEditingController oldPassController;
  late TextEditingController newPassController;
  late TextEditingController confPassController;
  final resetFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    oldPassController = TextEditingController();
    newPassController = TextEditingController();
    confPassController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    oldPassController.dispose();
    newPassController.dispose();
    confPassController.dispose();
  }
}

class SignUpController extends GetxController
    with SearchableList<ModelCountry> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController searchController;

  final RxString image = "flag.png".obs;
  final RxString code = "+1".obs;
  final RxBool check = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    searchController = TextEditingController();
    sourceList = DataFile.countryList;
    filteredList = sourceList;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    searchController.dispose();
  }

  void onItemChanged(String value) {
    filterList(value, sourceList, (item) => item.name ?? '');
    filteredList = filteredList;
    update();
  }

  void getImage(String value, String value1) {
    image.value = value;
    code.value = value1;
    update();
  }

  void onCheck() {
    check.value = !check.value;
    update();
  }

  String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter full name.';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address.';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number.';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password.';
    }
    return null;
  }
}

class HomeController extends GetxController {
  final RxInt index = 0.obs;

  void onChange(RxInt value) {
    index.value = value.value;
    update();
  }
}

class ActivityController extends GetxController {
  final Rx<DateTime> selectDate = DateTime.now().obs;
  final RxInt select = 0.obs;
  final RxInt item = 5.obs;

  void itemChange(RxInt value, RxInt value1) {
    select.value = value.value;
    item.value = value1.value;
    update();
  }

  void onChange(Rx<DateTime> date) {
    selectDate.value = date.value;
    update();
  }
}

class HomeScreenController extends GetxController {
  late TextEditingController searchController;
  final RxInt select = 0.obs;

  void onChange(RxInt value) {
    select.value = value.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

class FeatureEventController extends GetxController
    with SearchableList<ModalFeatureEvent> {
  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    sourceList = DataFile.featureEventList;
    filteredList = sourceList;
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void onItemChanged(String value) {
    filterList(value, sourceList, (item) => item.name ?? '');
    update();
  }
}

class PopularEventController extends GetxController
    with SearchableList<ModalPopularEvent> {
  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    sourceList = DataFile.popularEventList;
    filteredList = sourceList;
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void onItemChanged(String value) {
    filterList(value, sourceList, (item) => item.name ?? '');
    update();
  }
}

class TrendingController extends GetxController
    with SearchableList<ModalTrendingEvent> {
  late TextEditingController searchController;
  final RxInt select = 0.obs;

  void onChange(RxInt value) {
    select.value = value.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    sourceList = DataFile.trendingEventList;
    filteredList = sourceList;
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void onItemChanged(String value) {
    filterList(value, sourceList, (item) => item.name ?? '');
    update();
  }
}

class BuyTicketController extends GetxController {
  final RxInt select = 0.obs;
  final RxInt count = 1.obs;

  void countChange(RxInt value) {
    count.value = value.value;
    update();
  }

  void onChange(RxInt value) {
    select.value = value.value;
    update();
  }
}

class PaymentController extends GetxController {
  final RxInt select = 0.obs;

  void onChange(RxInt value) {
    select.value = value.value;
    update();
  }
}

class CreateEventController extends GetxController {
  late TextEditingController eventNameController;
  late TextEditingController addressController;
  late TextEditingController priceController;
  late TextEditingController dateController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;

  final RxInt select = 0.obs;
  final List<File?> _images = List.filled(5, null);
  String? imagePath;
  final ImagePicker _picker = ImagePicker();

  File? get image1 => _images[0];
  File? get image2 => _images[1];
  File? get image3 => _images[2];
  File? get image4 => _images[3];
  File? get image5 => _images[4];

  void onDateChange(RxString value) {
    dateController.text = value.value;
    update();
  }

  void onStartTimeChange(RxString value) {
    startTimeController.text = value.value;
    update();
  }

  void onEndTimeChange(RxString value) {
    endTimeController.text = value.value;
    update();
  }

  Future<void> getImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _images[index] = File(pickedFile.path);
      imagePath = pickedFile.path;
      update();
    }
  }

  void clearImage(int index) {
    _images[index] = null;
    update();
  }

  void onChange(RxInt value) {
    select.value = value.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    eventNameController = TextEditingController();
    addressController = TextEditingController();
    priceController = TextEditingController();
    dateController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    eventNameController.dispose();
    addressController.dispose();
    priceController.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
  }
}

class EditProfileController extends GetxController {
  late TextEditingController fullnameController;
  late TextEditingController emailController;
  late TextEditingController dateController;

  @override
  void onInit() {
    super.onInit();
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    fullnameController.dispose();
    emailController.dispose();
    dateController.dispose();
  }
}

class CardController extends GetxController {
  final List<ModalCard> cardLists = List.from(DataFile.cardLists);

  void ondelete(RxInt index) {
    cardLists.removeAt(index.value);
  }
}

class EditCardController extends GetxController {
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController dateController;
  late TextEditingController cvvController;

  @override
  void onInit() {
    super.onInit();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    cardNameController.dispose();
    cardNumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
  }
}
