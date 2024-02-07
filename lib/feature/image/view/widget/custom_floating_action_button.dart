part of '../image_picker_view.dart';

final class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton({
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        icon,
      ),
    );
  }
}
