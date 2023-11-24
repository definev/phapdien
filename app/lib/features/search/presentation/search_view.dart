import 'package:app/features/search/presentation/hint_search_box.dart';
import 'package:app/features/search/presentation/recommendation_chips.dart';
import 'package:app/features/search/presentation/restrict_by_widget.dart';
import 'package:app/utils/spacing.dart';
import 'package:boxy/padding.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final showHintSearchBox = useState(false);

    final tags = useState(<String>[]);
    final showTagPallet = useState((tagAt: -1, tagText: ''));
    void executeClearPallet(BuildContext context) {
      showHintSearchBox.value = false;
      showTagPallet.value = (tagAt: -1, tagText: '');
    }

    void executeTagPallet(BuildContext context, int tagAt) {
      showTagPallet.value = (tagAt: tagAt, tagText: '');
    }

    bool isValidTagPallet(String text) {
      final tagAt = text.lastIndexOf('@');
      if (tagAt == -1) return false;
      final tagText = text.substring(tagAt + 1);
      return tagText.isNotEmpty;
    }

    bool canShowTagPallet() {
      final tagAt = showTagPallet.value.tagAt;
      if (tagAt != -1) return true;
      if (tags.value.isEmpty) return false;
      return true;
    }

    final searchBoxKey = useRef(GlobalKey());
    final searchBoxTextController = useTextEditingController();
    useEffect(
      () {
        void onTriggerAtSign() {
          final text = searchBoxTextController.text;
          if (isValidTagPallet(text)) {
            final tagAt = text.lastIndexOf('@');
            final tagText = text.substring(tagAt + 1);
            showTagPallet.value = (tagAt: tagAt, tagText: tagText);
            return;
          } else {
            showTagPallet.value = (tagAt: -1, tagText: '');
          }
          return switch (text) {
            _ when text.endsWith('@') => executeTagPallet(context, text.length - 1),
            _ => {},
          };
        }

        void onTriggerClear() {
          final text = searchBoxTextController.text;
          if (text.isNotEmpty) {
            showHintSearchBox.value = text.isNotEmpty;
            return;
          }
          executeClearPallet(context);
        }

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
              PortalTarget(
                visible: showHintSearchBox.value,
                anchor: const Aligned(
                  follower: Alignment.topCenter,
                  target: Alignment.bottomCenter,
                ),
                portalFollower: switch (showHintSearchBox.value) {
                  true => RestrictByWidget(
                      targetKey: searchBoxKey.value,
                      restrictHeight: const RestrictSize.bySize(300),
                      child: OverflowPadding(
                        padding: EdgeInsets.only(
                          top: Spacings.sm.value,
                          bottom: 0,
                          left: -2,
                          right: -2,
                        ),
                        child: Row(
                          children: [
                            if (canShowTagPallet())
                              Flexible(
                                flex: 1,
                                child: TagsSearchBox(
                                  query: showTagPallet.value.tagText,
                                ),
                              ),
                            Flexible(
                              flex: 3,
                              child: HintSearchBox(
                                hints: const [
                                  'Đi tù 1 năm',
                                  'Đi trốn',
                                  'Đi tù 2 năm',
                                  'Đi canh gác',
                                  'Hiếp dâm',
                                  'Hiến tạng',
                                ],
                                onSelected: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  false => const SizedBox(),
                },
                child: TextField(
                  key: searchBoxKey.value,
                  controller: searchBoxTextController,
                  onSubmitted: (value) {
                    if (isValidTagPallet(value)) {
                      tags.value = [...tags.value, value];
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Thắc mắc về pháp điển của bạn là gì?',
                    filled: true,
                  ),
                ),
              ),
              Animate(
                effects: [
                  if (showHintSearchBox.value) //
                    const FadeEffect(end: 0)
                  else
                    const FadeEffect(end: 1),
                ],
                child: RecommendationChips(
                  onSelected: (value) => searchBoxTextController.text = value,
                  recommendations: [
                    for (var index = 0; index < 4; index++) 'Đi tù ${'năm ' * index}',
                  ],
                ),
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
