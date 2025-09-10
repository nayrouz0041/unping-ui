import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:unping_ui/unping_ui.dart';
import 'package:widgetbook_workspace/utils/container.widgetbook.dart';

import '../shared/responsive_wrap.dart';

@widgetbook.UseCase(
  name: 'Filled',
  type: BaseButton,
  path: 'Components/Button/Showcase',
  designLink: 'https://www.figma.com/design/D1jFOBHi38okdjyBFwN97c/unping-ui.com-%7C-Public--Community-?node-id=4913-7279&p=f&t=fMXcYIOzZi7Elvf6-0',
)
Widget buildBaseButtonFilled(BuildContext context) {
  return UnpingUIContainer(
    breadcrumbs: ['Components', 'Button', 'Filled'],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(text: 'Button', onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ]),

        // Hovered
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(text: 'Button', onPressed: () {}, forceState: ButtonState.hovered),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.leading,
              forceState: ButtonState.hovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.hovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.hovered,
            ),
          ),
        ]),

        // Focused
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(text: 'Button', onPressed: () {}, forceState: ButtonState.focused),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.leading,
              forceState: ButtonState.focused,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.focused,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.filled(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.focused,
            ),
          ),
        ]),

        // Disabled
        ResponsiveWrap(children: [
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.filled(text: 'Button', onPressed: null),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.leading,
            ),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.filled(
              text: 'Button',
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
            ),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.filled(
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFF2A313C)),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ]),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Outline',
  type: BaseButton,
  path: 'Components/Button/Showcase',
)
Widget buildBaseButtonOutlined(BuildContext context) {
  return UnpingUIContainer(
    breadcrumbs: ['Components', 'Button', 'Outline'],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(text: 'Button', onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ]),

        // Hovered
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(text: 'Button', onPressed: () {}, forceState: ButtonState.hovered),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
              forceState: ButtonState.hovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.hovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.hovered,
            ),
          ),
        ]),

        // Focused
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(text: 'Button', onPressed: () {}, forceState: ButtonState.focused),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
              forceState: ButtonState.focused,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.focused,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.outline(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.focused,
            ),
          ),
        ]),

        // Disabled
        ResponsiveWrap(children: [
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.outline(text: 'Button', onPressed: null),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
            ),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.outline(
              text: 'Button',
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.outline(
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ]),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Ghost',
  type: BaseButton,
  path: 'Components/Button/Showcase',
)
Widget buildBaseButtonGhost(BuildContext context) {
  return UnpingUIContainer(
    breadcrumbs: ['Components', 'Button', 'Ghost'],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(text: 'Button', onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ]),

        // Hovered
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(text: 'Button', onPressed: () {}, forceState: ButtonState.hovered),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
              forceState: ButtonState.hovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.hovered,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.hovered,
            ),
          ),
        ]),

        // Focused
        ResponsiveWrap(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(text: 'Button', onPressed: () {}, forceState: ButtonState.focused),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
              forceState: ButtonState.focused,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.focused,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Buttons.ghost(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
              forceState: ButtonState.focused,
            ),
          ),
        ]),

        // Disabled
        ResponsiveWrap(children: [
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.ghost(text: 'Button', onPressed: null),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.leading,
            ),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.ghost(
              text: 'Button',
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
            Padding(
            padding: EdgeInsets.all(16),
            child: Buttons.ghost(
              onPressed: null,
              icon: Icon(Icons.radio_button_unchecked, size: 16, color: Color(0xFFFFFFFF)),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ]),
      ],
    ),
  );
}
