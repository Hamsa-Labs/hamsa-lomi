// Package imports:
import 'package:formz/formz.dart';

enum ImageGalleryInputError { aboveMax }

class ImageGalleryInput
    extends FormzInput<List<String>, ImageGalleryInputError> {
  const ImageGalleryInput.pure() : super.pure(const []);

  ImageGalleryInput.dirty(List<String> value) : super.dirty(value);

  @override
  ImageGalleryInputError? validator(List<String> value) {
    return value.length > 4 ? ImageGalleryInputError.aboveMax : null;
  }
}
