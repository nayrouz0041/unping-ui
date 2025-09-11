import 'package:flutter/material.dart';

import '../widgetbook_theme.dart';

import 'package:flutter/material.dart';
import '../widgetbook_theme.dart';

class Setting extends StatelessWidget {
  const Setting({
    super.key,
    required this.name,
    this.description,
    this.trailing,
    required this.child,
  });

  final String name;
  final String? description;
  final Widget? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = WidgetbookTheme.of(context);

    final title = Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // If the available width is tiny we avoid a Row and stack instead
          final isNarrow = constraints.maxWidth < 180;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing == null || !isNarrow)
                Row(
                  children: [
                    Expanded(child: title),
                    if (trailing != null) ...[
                      const SizedBox(width: 8),
                      //  trailing shrink instead of overflowing
                      Flexible(
                        fit: FlexFit.loose,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: trailing!,
                          ),
                        ),
                      ),
                    ],
                  ],
                )
              else
              // Narrow: stack title over trailing to avoid overflow
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: trailing!,
                    ),
                  ],
                ),

              const SizedBox(height: 12),

              if (description != null) ...[
                Text(description!),
                const SizedBox(height: 12),
              ],

              child,
            ],
          );
        },
      ),
    );
  }
}

