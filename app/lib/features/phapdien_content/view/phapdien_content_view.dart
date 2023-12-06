import 'package:app/features/phapdien_content/providers/get_demuc_content.dart';
import 'package:app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

class PhapdienContentView extends ConsumerWidget {
  const PhapdienContentView(this.node, {super.key});

  final PhapdienNode node;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(node.text),
      ),
      body: _buildBody(context, ref),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    switch (node.type) {
      case ChuDePhapdienNodeType():
        return const SizedBox();
      case DeMucPhapdienNodeType():
        final raw = ref.watch(getDemucContentHtmlProvider(node));
        return raw.when(
          data: (content) => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(Spacings.md.value),
                sliver: HtmlWidget(
                  content,
                  renderMode: RenderMode.sliverList,
                  customWidgetBuilder: (element) {
                    if (element.localName == 'p' && element.className == 'pDieu') {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: Spacings.md.value,
                          bottom: Spacings.md.value,
                        ),
                        child: Text(
                          element.text,
                          style: theme.textTheme.displayLarge,
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text(error.toString())),
        );
      default:
        return const SizedBox();
    }
  }
}
