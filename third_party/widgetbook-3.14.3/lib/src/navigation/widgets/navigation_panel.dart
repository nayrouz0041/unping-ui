import 'package:flutter/material.dart';

import '../../state/widgetbook_state.dart';
import '../nodes/nodes.dart';
import 'navigation_tree_node.dart';
import 'search_field.dart';
import 'stats_banner.dart';

class NavigationPanel extends StatefulWidget {
  const NavigationPanel({
    super.key,
    this.initialPath,
    this.onNodeSelected,
    required this.root,
    this.header,
  });

  final String? initialPath;
  final ValueChanged<WidgetbookNode>? onNodeSelected;
  final WidgetbookNode root;
  final Widget? header;

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  WidgetbookNode? selectedNode;

  bool filterNode(WidgetbookNode node, String query) {
    final escapedQuery = RegExp.escape(query);
    final regex = RegExp(escapedQuery, caseSensitive: false);
    return node.name.contains(regex);
  }

  @override
  void initState() {
    super.initState();
    selectedNode = widget.initialPath != null
        ? widget.root.find((child) => child.path == widget.initialPath)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final query = WidgetbookState.of(context).query ?? '';
    final filteredRoot = query.isEmpty
        ? widget.root
        : widget.root.filter((n) => filterNode(n, query)) ?? widget.root;

    return LayoutBuilder(
      builder: (context, c) {
        // ── Responsiveness knobs ────────────────────────────────────────────────
        const narrowW = 140.0;     // collapse search UI
        const tinyW = 96.0;        // tighter paddings
        const hideFooterH = 380.0; // hide footer when very short

        final isNarrow = c.maxWidth < narrowW;
        final isTiny = c.maxWidth < tinyW;
        final isShort = c.maxHeight < hideFooterH;

        final allPad = EdgeInsets.all(isTiny ? 8 : 16);
        final listHPad = EdgeInsets.symmetric(horizontal: isTiny ? 8 : 16);
        final footerPad = EdgeInsets.all(isTiny ? 4 : 8);

        // Collapsible search (button -> dialog on very narrow panels)
        final search = isNarrow
            ? _CollapsedSearchButton(
          initial: query,
          onChanged: WidgetbookState.of(context).updateQuery,
        )
            : SearchField(
          value: query,
          onChanged: WidgetbookState.of(context).updateQuery,
          onCleared: () => WidgetbookState.of(context).updateQuery(''),
        );

        // ── FIX: Replace Column+Expanded/ListView with CustomScrollView  ───────
        // This prevents "RenderFlex overflowed" when the panel height is small:
        // everything scrolls instead of trying to fit.
        final children = filteredRoot.children ?? const <WidgetbookNode>[];

        return CustomScrollView(
          slivers: [
            if (widget.header != null)
              SliverToBoxAdapter(
                child: Padding(padding: allPad, child: widget.header!),
              ),

            SliverToBoxAdapter(
              child: Padding(padding: allPad, child: search),
            ),

            if (children.isNotEmpty)
              SliverPadding(
                padding: listHPad,
                sliver: SliverList.separated(
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    final node = children[index];
                    return NavigationTreeNode(
                      node: node,
                      selectedNode: selectedNode,
                      onNodeSelected: (n) {
                        if (!n.isLeaf || n.path == selectedNode?.path) return;
                        setState(() => selectedNode = n);
                        widget.onNodeSelected?.call(n);
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                ),
              )
            else
              SliverToBoxAdapter(
                child: Padding(
                  padding: allPad,
                  child: Opacity(
                    opacity: 0.6,
                    child: _AutoText(
                      'No matches',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),

            if (!isShort)
              SliverToBoxAdapter(
                child: Padding(
                  padding: footerPad,
                  child: StatsBanner(
                    componentsCount:
                    WidgetbookState.of(context).root.componentsCount,
                    useCasesCount:
                    WidgetbookState.of(context).root.useCasesCount,
                  ),
                ),
              ),
            // Give a little breathing room at the bottom so last item isn't flush
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
          ],
        );
      },
    );
  }
}

/// Tiny search trigger for narrow sidebars.
/// Pops a dialog with a TextField and pushes the value back.
class _CollapsedSearchButton extends StatelessWidget {
  const _CollapsedSearchButton({
    required this.onChanged,
    this.initial = '',
  });

  final String initial;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        tooltip: 'Search',
        icon: const Icon(Icons.search),
        onPressed: () async {
          final controller = TextEditingController(text: initial);
          final result = await showDialog<String>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: _AutoText(
                'Search',
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
              content: TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Type to filter…',
                ),
                onSubmitted: (v) => Navigator.of(ctx).pop(v),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(''),
                  child: const _AutoText('Clear'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(controller.text),
                  child: const _AutoText('Apply'),
                ),
              ],
            ),
          );
          if (result != null) onChanged(result);
        },
      ),
    );
  }
}

/// Lightweight auto-sizing text that scales down to fit its box.
/// Useful for very narrow sidebars and dialog buttons/titles.
class _AutoText extends StatelessWidget {
  const _AutoText(
      this.data, {
        this.style,
        this.maxLines = 1,
        this.textAlign,
      });

  final String data;
  final TextStyle? style;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
