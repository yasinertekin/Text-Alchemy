part of '../image_picker_view.dart';

final class _ImagePickerFloatingActionButton extends StatelessWidget {
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
                    await imagePickerViewModel.pickImage();
                    pageController.jumpToPage(ImageData.text.index);
                  },
                ),
                const CustomSizedBox(),
                _CustomFloatingActionButton(
                  icon: Icons.camera_alt,
                  onPressed: () {},
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

final class FloatingViewModel extends ChangeNotifier {
  bool isEnable = false;

  void changeEnable() {
    isEnable = !isEnable;
    notifyListeners();
  }
}
