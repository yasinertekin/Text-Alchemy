import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:text_recognitions/feature/image/view_model/image_pickar_view_model.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/feature/settings/settings_view.dart';
import 'package:text_recognitions/product/core/enum/image_data.dart';
import 'package:text_recognitions/product/image_picker/image_picker.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/widget/copy_icon_button.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';
import 'package:text_recognitions/product/widget/custom_sized_box.dart';
import 'package:text_recognitions/product/widget/custom_text_field.dart';

part 'widget/custom_floating_action_button.dart';
part 'widget/image_header.dart';
part 'widget/image_is_empty_widget.dart';
part 'widget/image_picker_app_bar.dart';
part 'widget/image_picker_floating_action_button.dart';

@RoutePage()
final class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    final imagePickerViewModel = ImagePickerViewModel(
      ImagePickers(picker),
    );
    final pageController = PageController();
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: _ImagePickerFloatingActionButton(
          imagePickerViewModel: imagePickerViewModel,
          pageController: pageController,
        ),
        appBar: const _ImagePickerAppBar(),
        body: _ImagePickerBody(
          imagePickerViewModel: imagePickerViewModel,
          pageController: pageController,
        ),
      ),
    );
  }
}

final class _ImagePickerBody extends StatelessWidget {
  const _ImagePickerBody({
    required this.imagePickerViewModel,
    required this.pageController,
  });

  final ImagePickerViewModel imagePickerViewModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: imagePickerViewModel,
      builder: (context, child) => Column(
        children: <Widget>[
          _ImageHeader(
            imagePickerViewModel: imagePickerViewModel,
          ),
          _ImagePickerPageViewBuilder(
            pageController: pageController,
            imagePickerViewModel: imagePickerViewModel,
          ),
        ],
      ),
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
      padding: const EdgeInsets.all(8),
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
        return GestureDetector(
          onTap: () async {
            await imagePickerViewModel.pickImage();
            if (imagePickerViewModel.result?.imagePath == null) {
              return;
            }
            await pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: imagePickerViewModel.result?.imagePath == null
              ? _ImageIsEmptyWidget(
                  imagePickerViewModel: imagePickerViewModel,
                  pageController: pageController,
                )
              : CustomImage(
                  imagePickerViewModel.result?.imagePath ?? '',
                ),
        );

      case ImageData.text:
        return CustomTextField(
          imagePickerViewModel.result ??
              Result(
                text: '',
              ),
        );
    }
  }
}