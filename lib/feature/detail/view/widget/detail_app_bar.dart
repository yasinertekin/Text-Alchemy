part of '../detail_view.dart';

final class _DetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _DetailAppBar({
    required this.result,
    required this.controller,
    required this.viewModel,
  });

  final Result result;
  final TabController controller;
  final DetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.topRoute.name == DetailTextFieldRoute.name
            ? StringConstants.textTab
            : StringConstants.imageTab,
      ),
      actions: [
        ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) => IconButton(
            onPressed: viewModel.isLoaded
                ? null
                : () async {
                    await viewModel.createPdf(context);
                  },
            icon: const Icon(Icons.picture_as_pdf),
          ),
        ),
        CopyIconButton(result: result),
      ],
      leading: const AutoLeadingButton(),
      bottom: _DetailTabBar(
        controller,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight);
}
