import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgetbook_theme.dart';

class StatsBanner extends StatelessWidget {
  const StatsBanner({
    super.key,
    required this.componentsCount,
    required this.useCasesCount,
  });

  final int componentsCount;
  final int useCasesCount;

  String _pluralize(int count, String unit) =>
      '$count ${count == 1 ? unit : '${unit}s'}';

  @override
  Widget build(BuildContext context) {
    final colors = WidgetbookTheme.of(context).colorScheme;
    final baseText = WidgetbookTheme.of(context).textTheme.bodySmall!;

    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final isTiny = w < 120;     // icon-only
        final isNarrow = w < 180;   // hide second line
        final pad = EdgeInsets.all(isTiny ? 6 : isNarrow ? 8 : 12);

        final summary =
            '${_pluralize(componentsCount, 'Component')} • '
            '${_pluralize(useCasesCount, 'Use-case')}';

        return Opacity(
          opacity: 0.64,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.outline),
            ),
            padding: pad,
            child: isTiny
            // Ultra-compact: only an icon with a tooltip
                ? Tooltip(
              message: summary,
              child: const Icon(Icons.info_outline, size: 16),
            )
                : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SummaryItem(
                  icon: Icons.info_outline,
                  text: summary,
                  textStyle: baseText,
                ),
                if (!isNarrow) ...[
                  const SizedBox(height: 2),
                  const _SummaryItem(
                    icon: Icons.open_in_new,
                    text: 'Golden test with Widgetbook Cloud',
                    url:
                    'https://docs.widgetbook.io/cloud?utm_source=oss&utm_medium=banner',
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.text,
    required this.icon,
    this.url,
    this.textStyle,
  });

  final String text;
  final IconData icon;
  final String? url;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final isClickable = url != null;
    final style = (textStyle ?? WidgetbookTheme.of(context).textTheme.bodySmall!)
        .copyWith(
      decoration: isClickable ? TextDecoration.underline : null,
    );

    return GestureDetector(
      onTap: isClickable ? () => launchUrl(Uri.parse(url!)) : null,
      behavior: HitTestBehavior.opaque,
      child: MouseRegion(
        cursor: isClickable ? SystemMouseCursors.click : MouseCursor.defer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            // Flexible to avoid horizontal overflow when super narrow
            Flexible(
              child: Text(
                text,
                style: style,
                softWrap: true,
                overflow: TextOverflow.fade,
                maxLines: 2, // keep height bounded a bit
              ),
            ),
          ],
        ),
      ),
    );
  }
}
