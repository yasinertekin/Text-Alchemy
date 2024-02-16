import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:text_recognitions/feature/image/view/mixin/image_picker_view_mixin.dart';
import 'package:text_recognitions/feature/image/view_model/image_pickar_view_model.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/core/enum/image_data.dart';
import 'package:text_recognitions/product/core/extensions/context_extensions.dart';
import 'package:text_recognitions/product/mixin/image_select_mixin.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/widget/copy_icon_button.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';
import 'package:text_recognitions/product/widget/custom_sized_box.dart';
import 'package:text_recognitions/product/widget/custom_text_field.dart';

part 'widget/custom_floating_action_button.dart';
part 'widget/image_header.dart';
part 'widget/image_is_empty_widget.dart';
part 'widget/image_picker_floating_action_button.dart';
part 'widget/select_image_button.dart';
part 'widget/text_is_empty.dart';

@RoutePage()

/// ImagePickerView is used to pick image from gallery or camera
final class ImagePickerView extends StatelessWidget
    with ImagePickermixin<ImagePickerView> {
  /// ImagePickerView constructor
  ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerViewModel>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          floatingActionButton: _ImagePickerFloatingActionButton(
            imagePickerViewModel: value,
            pageController: pageController,
          ),
          body: _ImagePickerBody(
            pageController: pageController,
            value: value,
          ),
        ),
      ),
    );
  }
}

final class _ImagePickerBody extends StatelessWidget {
  const _ImagePickerBody({
    required this.pageController,
    required this.value,
  });

  final PageController pageController;
  final ImagePickerViewModel value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _ImageHeader(
          imagePickerViewModel: value,
        ),
        _ImagePickerPageViewBuilder(
          pageController: pageController,
          imagePickerViewModel: value,
        ),
      ],
    );
  }
}

final class _ImagePickerPageViewBuilder extends StatelessWidget {
  const _ImagePickerPageViewBuilder({
    required this.pageController,
    required this.imagePickerViewModel,
  });

  final PageController pageController;
  final ImagePickerViewModel imagePickerViewModel;

  @override
  Widget build(BuildContext context) {
    const elevation = 5.0;
    return Padding(
      padding: context.paddingAllDefault,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.5),
        child: PageView.builder(
          controller: pageController,
          itemCount: ImageData.values.length,
          itemBuilder: (context, index) => Card(
            elevation: elevation,
            child: ImageData.values[index].widget(
              imagePickerViewModel,
              pageController,
            ),
          ),
        ),
      ),
    );
  }
}

/// ImageDataExtension is used to convert ImageData to Widget
extension ImageDataExtension on ImageData {
  /// Convert ImageData to Widget
  Widget widget(
    ImagePickerViewModel imagePickerViewModel,
    PageController pageController,
  ) {
    switch (this) {
      case ImageData.image:
        return _SelectImageButton(
          imagePickerViewModel: imagePickerViewModel,
          pageController: pageController,
        );

      case ImageData.text:
        return imagePickerViewModel.result?.text == null
            ? const _TextIsEmpty()
            : CustomTextField(
                onChanged: (value) {
                  imagePickerViewModel.updateText(value);
                },
                imagePickerViewModel.result ??
                    Result(
                      text: '',
                      imagePath: '',
                    ),
              );
    }
  }
}
