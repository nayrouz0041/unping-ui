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
        // Tweak breakpoints as you like.
        const narrowW = 140.0;     // collapse search UI
        const tinyW = 96.0;        // even tighter paddings
        const hideFooterH = 380.0; // hide footer when very short

        final isNarrow = c.maxWidth < narrowW;
        final isTiny = c.maxWidth < tinyW;
        final isShort = c.maxHeight < hideFooterH;

        final allPad = EdgeInsets.all(isTiny ? 8 : 16);
        final listHPad = EdgeInsets.symmetric(horizontal: isTiny ? 8 : 16);
        final footerPad = EdgeInsets.all(isTiny ? 4 : 8);

        Widget search = isNarrow
            ? _CollapsedSearchButton(
          initial: query,
          onChanged: WidgetbookState.of(context).updateQuery,
        )
            : SearchField(
          value: query,
          onChanged: WidgetbookState.of(context).updateQuery,
          onCleared: () => WidgetbookState.of(context).updateQuery(''),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.header != null)
              Padding(padding: allPad, child: widget.header!),

            Padding(padding: allPad, child: search),

            if (filteredRoot.children != null)
              Expanded(
                child: ListView.builder(
                  padding: listHPad,
                  itemCount: filteredRoot.children!.length,
                  itemBuilder: (context, index) => NavigationTreeNode(
                    node: filteredRoot.children![index],
                    selectedNode: selectedNode,
                    onNodeSelected: (node) {
                      if (!node.isLeaf || node.path == selectedNode?.path) return;
                      setState(() => selectedNode = node);
                      widget.onNodeSelected?.call(node);
                    },
                  ),
                ),
              ),

            if (!isShort)
              Padding(
                padding: footerPad,
                child: StatsBanner(
                  componentsCount: WidgetbookState.of(context).root.componentsCount,
                  useCasesCount: WidgetbookState.of(context).root.useCasesCount,
                ),
              ),
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
              title: const Text('Search'),
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
                  child: const Text('Clear'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(controller.text),
                  child: const Text('Apply'),
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
