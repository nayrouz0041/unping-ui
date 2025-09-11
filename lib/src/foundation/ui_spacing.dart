import 'package:flutter/material.dart';

/// Unping-UI spacing system
/// Provides consistent spacing values throughout the design system
class UiSpacing {
  // ====== MOD: base unit to document intent (all values are multiples of 4) ======
  static const double _unit = 4.0;

  /// Spacing values from Figma design system
  /// Scale: 0, 0.5, 1, 2, 3, 4, 5, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56,
  /// 64, 80, 96, 120, 140, 160, 180, 192, 256, 320, 360, 400, 480

  /// Zero spacing - 0px
  static const double spacing0 = 0.0;

  /// 0.5 spacing - 2px
  static const double spacing0_5 = 0.5 * _unit * 4; // == 2

  /// 1 spacing - 4px
  static const double spacing1 = 1 * _unit; // 4

  /// 2 spacing - 8px
  static const double spacing2 = 2 * _unit; // 8

  /// 3 spacing - 12px
  static const double spacing3 = 3 * _unit; // 12

  /// 4 spacing - 16px
  static const double spacing4 = 4 * _unit; // 16

  /// 5 spacing - 20px
  static const double spacing5 = 5 * _unit; // 20

  /// 6 spacing - 24px
  static const double spacing6 = 6 * _unit; // 24

  /// 8 spacing - 32px
  static const double spacing8 = 8 * _unit; // 32

  /// 10 spacing - 40px
  static const double spacing10 = 10 * _unit; // 40

  /// 12 spacing - 48px
  static const double spacing12 = 12 * _unit; // 48

  /// 16 spacing - 64px
  static const double spacing16 = 16 * _unit; // 64

  /// 20 spacing - 80px
  static const double spacing20 = 20 * _unit; // 80

  /// 24 spacing - 96px
  static const double spacing24 = 24 * _unit; // 96

  /// 32 spacing - 128px
  static const double spacing32 = 32 * _unit; // 128

  /// 40 spacing - 160px
  static const double spacing40 = 40 * _unit; // 160

  /// 48 spacing - 192px
  static const double spacing48 = 48 * _unit; // 192

  /// 56 spacing - 224px
  static const double spacing56 = 56 * _unit; // 224

  /// 64 spacing - 256px
  static const double spacing64 = 64 * _unit; // 256

  /// 80 spacing - 320px
  static const double spacing80 = 80 * _unit; // 320

  /// 96 spacing - 384px
  static const double spacing96 = 96 * _unit; // 384

  /// 120 spacing - 480px
  static const double spacing120 = 120 * _unit; // 480

  /// 140 spacing - 560px
  static const double spacing140 = 140 * _unit; // 560

  /// 160 spacing - 640px
  static const double spacing160 = 160 * _unit; // 640

  /// 180 spacing - 720px
  static const double spacing180 = 180 * _unit; // 720

  /// 192 spacing - 768px
  static const double spacing192 = 192 * _unit; // 768

  /// 256 spacing - 1024px
  static const double spacing256 = 256 * _unit; // 1024

  /// 320 spacing - 1280px
  static const double spacing320 = 320 * _unit; // 1280

  /// 360 spacing - 1440px
  static const double spacing360 = 360 * _unit; // 1440

  /// 400 spacing - 1600px
  static const double spacing400 = 400 * _unit; // 1600

  /// 480 spacing - 1920px
  static const double spacing480 = 480 * _unit; // 1920

  // ====== Legacy aliases (kept) ======
  static const double zero = spacing0;
  static const double xxs = spacing1;   // 4
  static const double xs  = spacing2;   // 8
  static const double sm  = spacing3;   // 12
  static const double m   = spacing4;   // 16
  static const double l   = spacing6;   // 24
  static const double xl  = spacing8;   // 32
  static const double xxl = spacing12;  // 48
  static const double xxxl = spacing16; // 64

  // ====== Common EdgeInsets (kept) ======
  static const EdgeInsets allZero = EdgeInsets.all(zero);
  static const EdgeInsets allXxs  = EdgeInsets.all(xxs);
  static const EdgeInsets allXs   = EdgeInsets.all(xs);
  static const EdgeInsets allSm   = EdgeInsets.all(sm);
  static const EdgeInsets allM    = EdgeInsets.all(m);
  static const EdgeInsets allL    = EdgeInsets.all(l);
  static const EdgeInsets allXl   = EdgeInsets.all(xl);
  static const EdgeInsets allXxl  = EdgeInsets.all(xxl);
  static const EdgeInsets allXxxl = EdgeInsets.all(xxxl);

  static const EdgeInsets horizontalZero = EdgeInsets.symmetric(horizontal: zero);
  static const EdgeInsets horizontalXxs  = EdgeInsets.symmetric(horizontal: xxs);
  static const EdgeInsets horizontalXs   = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets horizontalSm   = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalM    = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets horizontalL    = EdgeInsets.symmetric(horizontal: l);
  static const EdgeInsets horizontalXl   = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets horizontalXxl  = EdgeInsets.symmetric(horizontal: xxl);
  static const EdgeInsets horizontalXxxl = EdgeInsets.symmetric(horizontal: xxxl);

  static const EdgeInsets verticalZero = EdgeInsets.symmetric(vertical: zero);
  static const EdgeInsets verticalXxs  = EdgeInsets.symmetric(vertical: xxs);
  static const EdgeInsets verticalXs   = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets verticalSm   = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalM    = EdgeInsets.symmetric(vertical: m);
  static const EdgeInsets verticalL    = EdgeInsets.symmetric(vertical: l);
  static const EdgeInsets verticalXl   = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsets verticalXxl  = EdgeInsets.symmetric(vertical: xxl);
  static const EdgeInsets verticalXxxl = EdgeInsets.symmetric(vertical: xxxl);

  static const EdgeInsets onlyTopZero = EdgeInsets.only(top: zero);
  static const EdgeInsets onlyTopXxs  = EdgeInsets.only(top: xxs);
  static const EdgeInsets onlyTopXs   = EdgeInsets.only(top: xs);
  static const EdgeInsets onlyTopSm   = EdgeInsets.only(top: sm);
  static const EdgeInsets onlyTopM    = EdgeInsets.only(top: m);
  static const EdgeInsets onlyTopL    = EdgeInsets.only(top: l);
  static const EdgeInsets onlyTopXl   = EdgeInsets.only(top: xl);
  static const EdgeInsets onlyTopXxl  = EdgeInsets.only(top: xxl);
  static const EdgeInsets onlyTopXxxl = EdgeInsets.only(top: xxxl);

  static const EdgeInsets onlyBottomZero = EdgeInsets.only(bottom: zero);
  static const EdgeInsets onlyBottomXxs  = EdgeInsets.only(bottom: xxs);
  static const EdgeInsets onlyBottomXs   = EdgeInsets.only(bottom: xs);
  static const EdgeInsets onlyBottomSm   = EdgeInsets.only(bottom: sm);
  static const EdgeInsets onlyBottomM    = EdgeInsets.only(bottom: m);
  static const EdgeInsets onlyBottomL    = EdgeInsets.only(bottom: l);
  static const EdgeInsets onlyBottomXl   = EdgeInsets.only(bottom: xl);
  static const EdgeInsets onlyBottomXxl  = EdgeInsets.only(bottom: xxl);
  static const EdgeInsets onlyBottomXxxl = EdgeInsets.only(bottom: xxxl);

  static const EdgeInsets onlyLeftZero = EdgeInsets.only(left: zero);
  static const EdgeInsets onlyLeftXxs  = EdgeInsets.only(left: xxs);
  static const EdgeInsets onlyLeftXs   = EdgeInsets.only(left: xs);
  static const EdgeInsets onlyLeftSm   = EdgeInsets.only(left: sm);
  static const EdgeInsets onlyLeftM    = EdgeInsets.only(left: m);
  static const EdgeInsets onlyLeftL    = EdgeInsets.only(left: l);
  static const EdgeInsets onlyLeftXl   = EdgeInsets.only(left: xl);
  static const EdgeInsets onlyLeftXxl  = EdgeInsets.only(left: xxl);
  static const EdgeInsets onlyLeftXxxl = EdgeInsets.only(left: xxxl);

  static const EdgeInsets onlyRightZero = EdgeInsets.only(right: zero);
  static const EdgeInsets onlyRightXxs  = EdgeInsets.only(right: xxs);
  static const EdgeInsets onlyRightXs   = EdgeInsets.only(right: xs);
  static const EdgeInsets onlyRightSm   = EdgeInsets.only(right: sm);
  static const EdgeInsets onlyRightM    = EdgeInsets.only(right: m);
  static const EdgeInsets onlyRightL    = EdgeInsets.only(right: l);
  static const EdgeInsets onlyRightXl   = EdgeInsets.only(right: xl);
  static const EdgeInsets onlyRightXxl  = EdgeInsets.only(right: xxl);

  // ====== MOD: bug fix - there was a 4x 'x' name. Keep a deprecated alias. ======
  @Deprecated('Typo kept for back-compat. Use onlyRightXxxl instead.')
  static const EdgeInsets onlyRightXxxxl = EdgeInsets.only(right: xxxl);
  static const EdgeInsets onlyRightXxxl  = EdgeInsets.only(right: xxxl);

  /// SizedBox spacing helpers
  static const SizedBox gapZero = SizedBox(height: zero, width: zero);
  static const SizedBox gapXxs  = SizedBox(height: xxs,  width: xxs);
  static const SizedBox gapXs   = SizedBox(height: xs,   width: xs);
  static const SizedBox gapSm   = SizedBox(height: sm,   width: sm);
  static const SizedBox gapM    = SizedBox(height: m,    width: m);
  static const SizedBox gapL    = SizedBox(height: l,    width: l);
  static const SizedBox gapXl   = SizedBox(height: xl,   width: xl);
  static const SizedBox gapXxl  = SizedBox(height: xxl,  width: xxl);
  static const SizedBox gapXxxl = SizedBox(height: xxxl, width: xxxl);

  static const SizedBox verticalGapZero = SizedBox(height: zero);
  static const SizedBox verticalGapXxs  = SizedBox(height: xxs);
  static const SizedBox verticalGapXs   = SizedBox(height: xs);
  static const SizedBox verticalGapSm   = SizedBox(height: sm);
  static const SizedBox verticalGapM    = SizedBox(height: m);
  static const SizedBox verticalGapL    = SizedBox(height: l);
  static const SizedBox verticalGapXl   = SizedBox(height: xl);
  static const SizedBox verticalGapXxl  = SizedBox(height: xxl);
  static const SizedBox verticalGapXxxl = SizedBox(height: xxxl);

  static const SizedBox horizontalGapZero = SizedBox(width: zero);
  static const SizedBox horizontalGapXxs  = SizedBox(width: xxs);
  static const SizedBox horizontalGapXs   = SizedBox(width: xs);
  static const SizedBox horizontalGapSm   = SizedBox(width: sm);
  static const SizedBox horizontalGapM    = SizedBox(width: m);
  static const SizedBox horizontalGapL    = SizedBox(width: l);
  static const SizedBox horizontalGapXl   = SizedBox(width: xl);
  static const SizedBox horizontalGapXxl  = SizedBox(width: xxl);
  static const SizedBox horizontalGapXxxl = SizedBox(width: xxxl);

  // ====== MOD: RTL-friendly directional insets (EdgeInsetsDirectional) ======
  static const EdgeInsetsDirectional dirHorizontalXs =
  EdgeInsetsDirectional.symmetric(horizontal: xs);
  static const EdgeInsetsDirectional dirHorizontalXl =
  EdgeInsetsDirectional.symmetric(horizontal: xl);
  static const EdgeInsetsDirectional dirOnlyStartSm =
  EdgeInsetsDirectional.only(start: sm);
  static const EdgeInsetsDirectional dirOnlyEndSm =
  EdgeInsetsDirectional.only(end: sm);

  // ====== MOD: Responsive helpers ======

  /// Returns a spacing multiplier based on width breakpoints.
  /// Tweak values to taste (slightly smaller on phones, slightly larger on big screens).
  static double _multiplierForWidth(double width, {bool compact = false}) {
    double m;
    if (width < 560) {
      m = 0.90; // phones
    } else if (width < 900) {
      m = 1.00; // tablets / small laptops
    } else if (width < 1200) {
      m = 1.05;
    } else if (width < 1536) {
      m = 1.10;
    } else {
      m = 1.15; // wides
    }
    return compact ? m * 0.9 : m;
  }

  /// Scale a raw spacing value by viewport width (and optional "compact" mode).
  static double adapt(BuildContext context, double value, {bool compact = false}) {
    final width = MediaQuery.sizeOf(context).width;
    return value * _multiplierForWidth(width, compact: compact);
  }

  /// Responsive EdgeInsets helpers (apply `adapt` to common patterns).
  static EdgeInsets insetsAll(BuildContext c, double base, {bool compact = false}) =>
      EdgeInsets.all(adapt(c, base, compact: compact));

  static EdgeInsets insetsSymmetric(
      BuildContext c, {
        double h = 0,
        double v = 0,
        bool compact = false,
      }) =>
      EdgeInsets.symmetric(
        horizontal: adapt(c, h, compact: compact),
        vertical: adapt(c, v, compact: compact),
      );

  static EdgeInsets insetsOnly(
      BuildContext c, {
        double left = 0,
        double top = 0,
        double right = 0,
        double bottom = 0,
        bool compact = false,
      }) =>
      EdgeInsets.only(
        left: adapt(c, left, compact: compact),
        top: adapt(c, top, compact: compact),
        right: adapt(c, right, compact: compact),
        bottom: adapt(c, bottom, compact: compact),
      );

  /// Adaptive gaps that scale on small/large screens (handy in tables/rows).
  static SizedBox hGap(BuildContext c, double w, {bool compact = false}) =>
      SizedBox(width: adapt(c, w, compact: compact));
  static SizedBox vGap(BuildContext c, double h, {bool compact = false}) =>
      SizedBox(height: adapt(c, h, compact: compact));
}

/// Theme extension for spacing system
/// (Kept minimal; you can add fields like `compact: true` to flip default behavior app-wide.)
class UiSpacingExtension extends ThemeExtension<UiSpacingExtension> {
  const UiSpacingExtension({this.compact = false, this.overrideMultiplier});

  /// MOD: allow a global compact toggle
  final bool compact;

  /// MOD: force a global multiplier (e.g., 0.95 for dense screens)
  final double? overrideMultiplier;

  static const light = UiSpacingExtension();
  static const dark = UiSpacingExtension();

  @override
  UiSpacingExtension copyWith({bool? compact, double? overrideMultiplier}) {
    return UiSpacingExtension(
      compact: compact ?? this.compact,
      overrideMultiplier: overrideMultiplier ?? this.overrideMultiplier,
    );
  }

  @override
  UiSpacingExtension lerp(ThemeExtension<UiSpacingExtension>? other, double t) {
    if (other is! UiSpacingExtension) return this;
    return UiSpacingExtension(
      compact: t < 0.5 ? compact : other.compact,
      overrideMultiplier: (overrideMultiplier ?? 1.0) * (1 - t) +
          (other.overrideMultiplier ?? 1.0) * t,
    );
  }
}

/// Extension on BuildContext to access spacing utilities without naming collisions
extension UiResponsiveSpacing on BuildContext {
  UiSpacingExtension get spacingTheme =>
      Theme.of(this).extension<UiSpacingExtension>() ?? const UiSpacingExtension();

  /// MOD: sugar helpers that respect theme compactness
  double spacingX(double value) =>
      UiSpacing.adapt(this, value, compact: spacingTheme.compact);

  EdgeInsets spacingAll(double base) =>
      UiSpacing.insetsAll(this, base, compact: spacingTheme.compact);

  EdgeInsets spacingSym({double h = 0, double v = 0}) =>
      UiSpacing.insetsSymmetric(this, h: h, v: v, compact: spacingTheme.compact);

  EdgeInsets spacingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      UiSpacing.insetsOnly(
        this,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        compact: spacingTheme.compact,
      );

  SizedBox hGap(double w) => UiSpacing.hGap(this, w, compact: spacingTheme.compact);
  SizedBox vGap(double h) => UiSpacing.vGap(this, h, compact: spacingTheme.compact);
}
