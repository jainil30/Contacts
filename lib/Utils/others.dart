import 'package:image_picker/image_picker.dart';

Future<XFile?> selectImage(ImageSource imageSource) {
  final pickedImage = ImagePicker().pickImage(source: imageSource);
  return pickedImage;
}
