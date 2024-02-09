part of '../image_picker_view.dart';

final class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    required this.imagePickerViewModel,
  });

  final ImagePickerViewModel imagePickerViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _PinnedButton(
          imagePickerViewModel,
        ),
        CopyIconButton(
          result: imagePickerViewModel.result ??
              Result(
                text: '',
              ),
        ),
      ],
    );
  }
}

final class _PinnedButton extends StatelessWidget {
  const _PinnedButton(
    this.imagePickerViewModel,
  );

  final ImagePickerViewModel imagePickerViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextRecognitionCacheManagerCubit,
        PinnedCacheManagerState>(
      builder: (context, state) => Card(
        child: IconButton(
          onPressed: () {
            if (imagePickerViewModel.result != null) {
              if (state is PinnedCacheManagerLoadedState) {
                context
                    .read<TextRecognitionCacheManagerCubit>()
                    .addTextRecognitions(
                      imagePickerViewModel.result!,
                    );
              }
            }
          },
          icon: const Icon(
            Icons.push_pin_outlined,
          ),
        ),
      ),
    );
  }
}
