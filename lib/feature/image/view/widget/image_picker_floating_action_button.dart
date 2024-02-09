part of '../image_picker_view.dart';

final class _ImagePickerFloatingActionButton extends StatelessWidget
    with ImageSelect {
  const _ImagePickerFloatingActionButton({
    required this.imagePickerViewModel,
    required this.pageController,
  });

  final ImagePickerViewModel imagePickerViewModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final floatingViewModel = FloatingViewModel();
    return ListenableBuilder(
      listenable: floatingViewModel,
      builder: (context, child) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (floatingViewModel.isEnable)
            Column(
              children: [
                _CustomFloatingActionButton(
                  icon: Icons.image,
                  onPressed: () async {
                    await selectImageFromGallery(
                      context: context,
                      pageController: pageController,
                      imagePickerViewModel: imagePickerViewModel,
                    );
                    floatingViewModel.changeEnable();
                  },
                ),
                const CustomSizedBox(),
                _CustomFloatingActionButton(
                  icon: Icons.camera_alt,
                  onPressed: () async {
                    await selectImageFromCamera(
                      context: context,
                      pageController: pageController,
                      imagePickerViewModel: imagePickerViewModel,
                    );
                    floatingViewModel.changeEnable();
                  },
                ),
              ],
            )
          else
            const SizedBox.shrink(),
          const CustomSizedBox(),
          _CustomFloatingActionButton(
            icon: floatingViewModel.isEnable ? Icons.close : Icons.add,
            onPressed: floatingViewModel.changeEnable,
          ),
        ],
      ),
    );
  }
}

/// CustomFloatingActionButton is used to show floating action button
final class FloatingViewModel extends ChangeNotifier {
  /// isEnable is used to enable or disable floating action button
  bool isEnable = false;

  /// changeEnable is used to change enable or disable floating action button
  void changeEnable() {
    isEnable = !isEnable;
    notifyListeners();
  }
}
