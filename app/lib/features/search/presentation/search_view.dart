import 'package:app/features/search/presentation/recommendation_chips.dart';
import 'package:app/utils/spacing.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBoxKey = useRef(GlobalKey());
    final searchBoxTextController = useTextEditingController();
    useEffect(
      () {
        void onTriggerAtSign() {}
        void onTriggerClear() {}
        void onTriggerSlash() {}

        searchBoxTextController.addListener(onTriggerClear);
        searchBoxTextController.addListener(onTriggerAtSign);
        searchBoxTextController.addListener(onTriggerSlash);
        return () {
          searchBoxTextController.removeListener(onTriggerClear);
          searchBoxTextController.removeListener(onTriggerAtSign);
          searchBoxTextController.removeListener(onTriggerSlash);
        };
      },
      [],
    );

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: PaddedColumn(
            padding: EdgeInsets.all(Spacings.lg.value),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: searchBoxKey.value,
                controller: searchBoxTextController,
                onSubmitted: (value) {},
                decoration: const InputDecoration(
                  hintText: 'Thắc mắc về pháp điển của bạn là gì?',
                  filled: true,
                ),
              ),
              RecommendationChips(
                onSelected: (value) => searchBoxTextController.text = value,
                recommendations: [
                  for (var index = 0; index < 4; index++) 'Đi tù ${'năm ' * index}',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagsSearchBox extends StatelessWidget {
  const TagsSearchBox({
    super.key,
    required this.query,
    this.tags = const [],
  });

  final String query;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Spacings.md.value),
            child: Text(
              'Thẻ tìm kiếm',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    query,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  onTap: () {},
                ),
                if (tags.isNotEmpty) const Divider(),
                for (final tag in tags)
                  ListTile(
                    title: Text(tag),
                    onTap: () {},
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
