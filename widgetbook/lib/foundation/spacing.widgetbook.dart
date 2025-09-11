import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:unping_ui/unping_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_workspace/utils/background.widgetbook.dart';
import '../utils/header.widgetbook.dart';
import '../utils/description.widgetbook.dart';

const double _kNameW = 120;
const double _kRemW = 160;
const double _kPxW = 128;
const double _kDefaultPadRight = 64;
const double _kGraphMin = 400;
const double _kTableMinWidth =
    _kNameW + _kRemW + _kPxW + (4 * _kDefaultPadRight) + _kGraphMin;

double _gapForWidth(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  if (w < 480) return 12;
  if (w < 640) return 16;
  if (w < 900) return 24;
  return _kDefaultPadRight;
}

/// Auto-shrinks text to fit horizontally without a plugin.
class _AutoText extends StatelessWidget {
  const _AutoText(this.text, this.style, {this.maxLines = 1, super.key});
  final String text;
  final TextStyle style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: style,
        maxLines: maxLines,
        overflow: TextOverflow.visible,
        softWrap: false,
      ),
    );
  }
}

@UseCase(
  name: 'Spacing System',
  type: UiSpacing,
  designLink: 'https://www.figma.com/design/D1jFOBHi38okdjyBFwN97c/unping-ui.com-%7C-Public--Community-?node-id=4913-7276&p=f&t=fMXcYIOzZi7Elvf6-0',
  path: 'Foundation',
)
Widget buildUiSpacingUseCase(BuildContext context) {
  return UnpingUIWidgetbookBackground(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          padding: UiSpacing.allXxl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UnpingUiWidgetbookHeader(
                breadcrumbs: const ['Foundation', 'Spacing'],
                title: 'Spacing',
              ),
              const SizedBox(height: UiSpacing.spacing4),
              UnpingUiWidgetbookDescription(
                description:
                'Consistent and well-defined spacing is crucial for creating a visually balanced and user-friendly interface. Our design system includes a comprehensive set of spacing guidelines to ensure consistency and clarity across all user interfaces. These guidelines help maintain a cohesive layout and improve the overall user experience.\n\n',
                lists: {
                  'Spacing Scale:': [
                    'Based on a 4px base unit for mathematical consistency.',
                    'Ranges from 0px to 1,920px to cover all design needs.',
                    'Follows a logical progression for predictable scaling.',
                    'Includes fractional values (0.5, 1, 2, 3) for fine-tuned control.',
                  ],
                  'Usage Guidelines:': [
                    'Use smaller values (0-24px) for component-level spacing.',
                    'Use medium values (32-96px) for section and layout spacing.',
                    'Use larger values (120px+) for page-level margins and major sections.',
                    'Maintain consistency by using predefined spacing values.',
                  ],
                },
              ),
            ],
          ),
        ),

        // TABLE (fixed width via LayoutBuilder + horizontal scroll)
        Container(
          width: double.infinity,
          padding: UiSpacing.allXxl,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Give the table a definite width so every box has a size during layout .
              final tableWidth =
              math.max(_kTableMinWidth, constraints.maxWidth);

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: tableWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SpacingHeader(),
                      const SizedBox(height: 12),
                      ..._buildSpacingRows(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

class _SpacingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gap = _gapForWidth(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: UiColors.neutral200, width: 1),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: _kNameW,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16, right: gap),
              child: _AutoText(
                'Name',
                UiTextStyles.textXsMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: _kRemW,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16, right: gap),
              child: _AutoText(
                'Size (16px base)',
                UiTextStyles.textXsMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: _kPxW,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16, right: gap),
              child: _AutoText(
                'Pixel',
                UiTextStyles.textXsMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16, right: gap),
              child: _AutoText(
                'Spacing',
                UiTextStyles.textXsMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildSpacingRows() {
  final spacingData = [
    {'name': '0', 'rem': '0rem', 'px': '0px', 'value': UiSpacing.spacing0},
    {'name': '0.5', 'rem': '0.125rem', 'px': '2px', 'value': UiSpacing.spacing0_5},
    {'name': '1', 'rem': '0.25rem', 'px': '4px', 'value': UiSpacing.spacing1},
    {'name': '2', 'rem': '0.5rem', 'px': '8px', 'value': UiSpacing.spacing2},
    {'name': '3', 'rem': '0.75rem', 'px': '12px', 'value': UiSpacing.spacing3},
    {'name': '4', 'rem': '1rem', 'px': '16px', 'value': UiSpacing.spacing4},
    {'name': '5', 'rem': '1.25rem', 'px': '20px', 'value': UiSpacing.spacing5},
    {'name': '6', 'rem': '1.5rem', 'px': '24px', 'value': UiSpacing.spacing6},
    {'name': '8', 'rem': '2rem', 'px': '32px', 'value': UiSpacing.spacing8},
    {'name': '10', 'rem': '2.5rem', 'px': '40px', 'value': UiSpacing.spacing10},
    {'name': '12', 'rem': '3rem', 'px': '48px', 'value': UiSpacing.spacing12},
    {'name': '16', 'rem': '4rem', 'px': '64px', 'value': UiSpacing.spacing16},
    {'name': '20', 'rem': '5rem', 'px': '80px', 'value': UiSpacing.spacing20},
    {'name': '24', 'rem': '6rem', 'px': '96px', 'value': UiSpacing.spacing24},
    {'name': '32', 'rem': '8rem', 'px': '128px', 'value': UiSpacing.spacing32},
    {'name': '40', 'rem': '10rem', 'px': '160px', 'value': UiSpacing.spacing40},
    {'name': '48', 'rem': '12rem', 'px': '192px', 'value': UiSpacing.spacing48},
    {'name': '56', 'rem': '14rem', 'px': '224px', 'value': UiSpacing.spacing56},
    {'name': '64', 'rem': '16rem', 'px': '256px', 'value': UiSpacing.spacing64},
    {'name': '80', 'rem': '20rem', 'px': '320px', 'value': UiSpacing.spacing80},
    {'name': '96', 'rem': '24rem', 'px': '384px', 'value': UiSpacing.spacing96},
    {'name': '120', 'rem': '30rem', 'px': '480px', 'value': UiSpacing.spacing120},
    {'name': '140', 'rem': '35rem', 'px': '560px', 'value': UiSpacing.spacing140},
    {'name': '160', 'rem': '40rem', 'px': '640px', 'value': UiSpacing.spacing160},
    {'name': '180', 'rem': '45rem', 'px': '720px', 'value': UiSpacing.spacing180},
    {'name': '192', 'rem': '48rem', 'px': '768px', 'value': UiSpacing.spacing192},
    {'name': '256', 'rem': '64rem', 'px': '1,024px', 'value': UiSpacing.spacing256},
    {'name': '320', 'rem': '80rem', 'px': '1,280px', 'value': UiSpacing.spacing320},
    {'name': '360', 'rem': '90rem', 'px': '1,440px', 'value': UiSpacing.spacing360},
    {'name': '400', 'rem': '100rem', 'px': '1,600px', 'value': UiSpacing.spacing400},
    {'name': '480', 'rem': '120rem', 'px': '1,920px', 'value': UiSpacing.spacing480},
  ];

  return spacingData
      .map((data) => _SpacingRow(
    name: data['name'] as String,
    rem: data['rem'] as String,
    px: data['px'] as String,
    value: (data['value'] as double),
  ))
      .toList();
}

class _SpacingRow extends StatelessWidget {
  const _SpacingRow({
    required this.name,
    required this.rem,
    required this.px,
    required this.value,
  });

  final String name;
  final String rem;
  final String px;
  final double value;

  @override
  Widget build(BuildContext context) {
    final gap = _gapForWidth(context);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: UiColors.neutral200, width: 1),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: _kNameW,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12).copyWith(right: gap),
              child: Badges.badge(
                text: name,
                size: BadgeSize.md,
                backgroundColor: const Color(0xFF3B4554),
                textColor: Colors.white,
                borderColor: UiColors.neutral200,
              ),
            ),
          ),
          SizedBox(
            width: _kRemW,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12).copyWith(right: gap),
              child: _AutoText(
                rem,
                UiTextStyles.textSm.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: _kPxW,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12).copyWith(right: gap),
              child: _AutoText(
                px,
                UiTextStyles.textSm.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12).copyWith(right: gap),
              child: _SpacingVisualization(value: value),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpacingVisualization extends StatelessWidget {
  const _SpacingVisualization({required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    const double maxDisplayWidth = 600.0;
    const double maxSpacingValue = 1920.0;

    double displayWidth;
    if (value == 0) {
      displayWidth = 0.0;
    } else if (value <= 24) {
      displayWidth = value;
    } else {
      final remainingValue = value - 24;
      final remainingMax = maxSpacingValue - 24;
      final scaledRemainingWidth =
          (remainingValue / remainingMax) * (maxDisplayWidth - 24);
      displayWidth = 24 + scaledRemainingWidth;
    }

    return SizedBox(
      height: 16,
      child: Align(
        alignment: Alignment.centerLeft,
        child: value == 0
            ? const SizedBox.shrink()
            : Container(
          width: displayWidth,
          height: 16,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFE040FA),
                Color(0xFF40C4FE),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
