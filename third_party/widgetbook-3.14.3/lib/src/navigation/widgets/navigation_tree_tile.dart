import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../next.dart' as next;
import '../../widgetbook_theme.dart';
import '../icons/icons.dart';
import '../icons/resolve_icon.dart';
import '../nodes/nodes.dart';

class NavigationTreeTile extends StatelessWidget {
  const NavigationTreeTile({
    super.key,
    required this.node,
    this.onTap,
    this.isExpanded = false,
    this.isSelected = false,
  });

  static const double kIndent = 24;
  static const double kUltraNarrow = 20;    // icon-only
  static const double kLabelBreakpoint = 120;
  static const double kCompactBreakpoint = 180;

  final WidgetbookNode node;
  final VoidCallback? onTap;
  final bool isExpanded;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(kIndent);

    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final ultra = w <= kUltraNarrow;
        final compact = w < kCompactBreakpoint;
        final showText = w >= kLabelBreakpoint;
        final showExpander =
            !compact && !(node.isLeaf || node is WidgetbookLeafComponent);

        //  clamp icon width so the row never exceeds constraints
        final double iconWidth = compact ? math.min(w, kIndent) : kIndent;

        final tile = Container(
          height: kIndent,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: isSelected
                ? WidgetbookTheme.of(context).colorScheme.secondaryContainer
                : null,
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Row(
              children: [
                if (!compact) SizedBox(width: math.max(node.depth - 1, 0) * kIndent),
                if (showExpander)
                  SizedBox(width: kIndent, child: ExpanderIcon(isExpanded: isExpanded)),

                // Icon slot that *never* exceeds the available width
                SizedBox(
                  width: iconWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: resolveIcon(node),
                    ),
                  ),
                ),

                if (showText) const SizedBox(width: 4),

                if (showText)
                  Expanded(
                    child: Text(
                      node.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),

                if (showText &&
                    (node is next.Story ||
                        node is next.Component ||
                        node is next.LeafComponent)) ...[
                  const SizedBox(width: 8),
                  const next.ExperimentalBadge(),
                ],
              ],
            ),
          ),
        );

        return Semantics(
          label: node.name,
          selected: isSelected,
          button: true,
          child: ultra ? Tooltip(message: node.name, child: tile) : tile,
        );
      },
    );
  }
}
