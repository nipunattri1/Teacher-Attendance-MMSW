import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

ThemeData themeData = ThemeDecoder.decodeThemeData({
      "applyElevationOverlayColor": true,
      "backgroundColor": "#ff201a1b",
      "bottomAppBarColor": "#ff201a1b",
      "brightness": "dark",
      "buttonTheme": {
        "alignedDropdown": false,
        "colorScheme": {
          "background": "#ff201a1b",
          "brightness": "dark",
          "error": "#ffffb4a9",
          "errorContainer": "#ff930006",
          "inversePrimary": "#ffbc0049",
          "inverseSurface": "#ffece0e0",
          "onBackground": "#ffece0e0",
          "onError": "#ff680003",
          "onErrorContainer": "#ffffb4a9",
          "onInverseSurface": "#ff362f30",
          "onPrimary": "#ff670024",
          "onPrimaryContainer": "#ffffd9df",
          "onSecondary": "#ff43292d",
          "onSecondaryContainer": "#ffffd9de",
          "onSurface": "#ffece0e0",
          "onSurfaceVariant": "#ffd6c1c3",
          "onTertiary": "#ff452b08",
          "onTertiaryContainer": "#ffffddb8",
          "outline": "#ff9f8c8e",
          "primary": "#ffffb2c0",
          "primaryContainer": "#ff900036",
          "secondary": "#ffe5bdc2",
          "secondaryContainer": "#ff5c3f43",
          "shadow": "#ff000000",
          "surface": "#ff201a1b",
          "tertiary": "#ffebbf90",
          "tertiaryContainer": "#ff5f411c"
        },
        "height": 36,
        "layoutBehavior": "padded",
        "minWidth": 88,
        "padding": {"bottom": 0, "left": 16, "right": 16, "top": 0},
        "shape": {
          "borderRadius": {
            "bottomLeft": {"type": "elliptical", "x": 2, "y": 2},
            "bottomRight": {"type": "elliptical", "x": 2, "y": 2},
            "topLeft": {"type": "elliptical", "x": 2, "y": 2},
            "topRight": {"type": "elliptical", "x": 2, "y": 2},
            "type": "only"
          },
          "side": {"color": "#ff000000", "style": "none", "width": 0},
          "type": "rounded"
        },
        "textTheme": "normal"
      },
      "canvasColor": "#ff201a1b",
      "cardColor": "#ff201a1b",
      "colorScheme": {
        "background": "#ff201a1b",
        "brightness": "dark",
        "error": "#ffffb4a9",
        "errorContainer": "#ff930006",
        "inversePrimary": "#ffbc0049",
        "inverseSurface": "#ffece0e0",
        "onBackground": "#ffece0e0",
        "onError": "#ff680003",
        "onErrorContainer": "#ffffb4a9",
        "onInverseSurface": "#ff362f30",
        "onPrimary": "#ff670024",
        "onPrimaryContainer": "#ffffd9df",
        "onSecondary": "#ff43292d",
        "onSecondaryContainer": "#ffffd9de",
        "onSurface": "#ffece0e0",
        "onSurfaceVariant": "#ffd6c1c3",
        "onTertiary": "#ff452b08",
        "onTertiaryContainer": "#ffffddb8",
        "outline": "#ff9f8c8e",
        "primary": "#ffffb2c0",
        "primaryContainer": "#ff900036",
        "secondary": "#ffe5bdc2",
        "secondaryContainer": "#ff5c3f43",
        "shadow": "#ff000000",
        "surface": "#ff201a1b",
        "tertiary": "#ffebbf90",
        "tertiaryContainer": "#ff5f411c"
      },
      "dialogBackgroundColor": "#ff201a1b",
      "disabledColor": "#62ffffff",
      "dividerColor": "#1fece0e0",
      "errorColor": "#ffffb4a9",
      "focusColor": "#1fffffff",
      "highlightColor": "#40cccccc",
      "hintColor": "#99ffffff",
      "hoverColor": "#0affffff",
      "iconTheme": {"color": "#ffffffff"},
      "indicatorColor": "#ffece0e0",
      "inputDecorationTheme": {
        "alignLabelWithHint": false,
        "filled": false,
        "floatingLabelAlignment": "start",
        "floatingLabelBehavior": "auto",
        "isCollapsed": false,
        "isDense": false
      },
      "materialTapTargetSize": "shrinkWrap",
      "platform": "windows",
      "primaryColor": "#ff201a1b",
      "primaryColorDark": "#ff000000",
      "primaryColorLight": "#ff9e9e9e",
      "primaryIconTheme": {"color": "#ffffffff"},
      "primaryTextTheme": {
        "bodyLarge": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 16,
          "inherit": true,
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 14,
          "inherit": true,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 12,
          "inherit": true,
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w300",
          "fontSize": 96,
          "inherit": true,
          "letterSpacing": -1.5,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w300",
          "fontSize": 60,
          "inherit": true,
          "letterSpacing": -0.5,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 48,
          "inherit": true,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 40,
          "inherit": true,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 34,
          "inherit": true,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 24,
          "inherit": true,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w500",
          "fontSize": 14,
          "inherit": true,
          "letterSpacing": 1.25,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 11,
          "inherit": true,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 10,
          "inherit": true,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w500",
          "fontSize": 20,
          "inherit": true,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 16,
          "inherit": true,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w500",
          "fontSize": 14,
          "inherit": true,
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "scaffoldBackgroundColor": "#ff201a1b",
      "secondaryHeaderColor": "#ff616161",
      "selectedRowColor": "#fff5f5f5",
      "shadowColor": "#ff000000",
      "splashColor": "#40cccccc",
      "splashFactory": "splash",
      "textTheme": {
        "bodyLarge": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 16,
          "inherit": true,
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 14,
          "inherit": true,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 12,
          "inherit": true,
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w300",
          "fontSize": 96,
          "inherit": true,
          "letterSpacing": -1.5,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w300",
          "fontSize": 60,
          "inherit": true,
          "letterSpacing": -0.5,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 48,
          "inherit": true,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 40,
          "inherit": true,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "color": "#b3ffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 34,
          "inherit": true,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 24,
          "inherit": true,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w500",
          "fontSize": 14,
          "inherit": true,
          "letterSpacing": 1.25,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 11,
          "inherit": true,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 10,
          "inherit": true,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w500",
          "fontSize": 20,
          "inherit": true,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w400",
          "fontSize": 16,
          "inherit": true,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "color": "#ffffffff",
          "decoration": "none",
          "fontFamily": "Segoe UI",
          "fontWeight": "w500",
          "fontSize": 14,
          "inherit": true,
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "toggleableActiveColor": "#ff64ffda",
      "typography": {
        "black": {
          "bodyLarge": {
            "color": "#dd000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "bodyMedium": {
            "color": "#dd000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "bodySmall": {
            "color": "#8a000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "displayLarge": {
            "color": "#8a000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "displayMedium": {
            "color": "#8a000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "displaySmall": {
            "color": "#8a000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "headlineLarge": {
            "color": "#8a000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "headlineMedium": {
            "color": "#8a000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "headlineSmall": {
            "color": "#dd000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "labelLarge": {
            "color": "#dd000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "labelMedium": {
            "color": "#ff000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "labelSmall": {
            "color": "#ff000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "titleLarge": {
            "color": "#dd000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "titleMedium": {
            "color": "#dd000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "titleSmall": {
            "color": "#ff000000",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          }
        },
        "dense": {
          "bodyLarge": {
            "fontWeight": "w500",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "bodyMedium": {
            "fontWeight": "w400",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "bodySmall": {
            "fontWeight": "w400",
            "fontSize": 13,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "displayLarge": {
            "fontWeight": "w100",
            "fontSize": 112,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "displayMedium": {
            "fontWeight": "w400",
            "fontSize": 56,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "displaySmall": {
            "fontWeight": "w400",
            "fontSize": 45,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "headlineLarge": {
            "fontWeight": "w400",
            "fontSize": 40,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "headlineMedium": {
            "fontWeight": "w400",
            "fontSize": 34,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "headlineSmall": {
            "fontWeight": "w400",
            "fontSize": 24,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "labelLarge": {
            "fontWeight": "w500",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "labelMedium": {
            "fontWeight": "w400",
            "fontSize": 12,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "labelSmall": {
            "fontWeight": "w400",
            "fontSize": 11,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "titleLarge": {
            "fontWeight": "w500",
            "fontSize": 21,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "titleMedium": {
            "fontWeight": "w400",
            "fontSize": 17,
            "inherit": false,
            "textBaseline": "ideographic"
          },
          "titleSmall": {
            "fontWeight": "w500",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "ideographic"
          }
        },
        "englishLike": {
          "bodyLarge": {
            "fontWeight": "w500",
            "fontSize": 14,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "bodyMedium": {
            "fontWeight": "w400",
            "fontSize": 14,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "bodySmall": {
            "fontWeight": "w400",
            "fontSize": 12,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "displayLarge": {
            "fontWeight": "w100",
            "fontSize": 112,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "displayMedium": {
            "fontWeight": "w400",
            "fontSize": 56,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "displaySmall": {
            "fontWeight": "w400",
            "fontSize": 45,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "headlineLarge": {
            "fontWeight": "w400",
            "fontSize": 40,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "headlineMedium": {
            "fontWeight": "w400",
            "fontSize": 34,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "headlineSmall": {
            "fontWeight": "w400",
            "fontSize": 24,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "labelLarge": {
            "fontWeight": "w500",
            "fontSize": 14,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "labelMedium": {
            "fontWeight": "w400",
            "fontSize": 12,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "labelSmall": {
            "fontWeight": "w400",
            "fontSize": 10,
            "inherit": false,
            "letterSpacing": 1.5,
            "textBaseline": "alphabetic"
          },
          "titleLarge": {
            "fontWeight": "w500",
            "fontSize": 20,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "titleMedium": {
            "fontWeight": "w400",
            "fontSize": 16,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "titleSmall": {
            "fontWeight": "w500",
            "fontSize": 14,
            "inherit": false,
            "letterSpacing": 0.1,
            "textBaseline": "alphabetic"
          }
        },
        "tall": {
          "bodyLarge": {
            "fontWeight": "w700",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "bodyMedium": {
            "fontWeight": "w400",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "bodySmall": {
            "fontWeight": "w400",
            "fontSize": 13,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "displayLarge": {
            "fontWeight": "w400",
            "fontSize": 112,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "displayMedium": {
            "fontWeight": "w400",
            "fontSize": 56,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "displaySmall": {
            "fontWeight": "w400",
            "fontSize": 45,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "headlineLarge": {
            "fontWeight": "w400",
            "fontSize": 40,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "headlineMedium": {
            "fontWeight": "w400",
            "fontSize": 34,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "headlineSmall": {
            "fontWeight": "w400",
            "fontSize": 24,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "labelLarge": {
            "fontWeight": "w700",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "labelMedium": {
            "fontWeight": "w400",
            "fontSize": 12,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "labelSmall": {
            "fontWeight": "w400",
            "fontSize": 11,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "titleLarge": {
            "fontWeight": "w700",
            "fontSize": 21,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "titleMedium": {
            "fontWeight": "w400",
            "fontSize": 17,
            "inherit": false,
            "textBaseline": "alphabetic"
          },
          "titleSmall": {
            "fontWeight": "w500",
            "fontSize": 15,
            "inherit": false,
            "textBaseline": "alphabetic"
          }
        },
        "white": {
          "bodyLarge": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "bodyMedium": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "bodySmall": {
            "color": "#b3ffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "displayLarge": {
            "color": "#b3ffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "displayMedium": {
            "color": "#b3ffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "displaySmall": {
            "color": "#b3ffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "headlineLarge": {
            "color": "#b3ffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "headlineMedium": {
            "color": "#b3ffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "headlineSmall": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "labelLarge": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "labelMedium": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "labelSmall": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "titleLarge": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "titleMedium": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          },
          "titleSmall": {
            "color": "#ffffffff",
            "decoration": "none",
            "fontFamily": "Segoe UI",
            "inherit": true
          }
        }
      },
      "unselectedWidgetColor": "#b3ffffff",
      "useMaterial3": false,
      "visualDensity": "compact"
    }) ??
    ThemeData();
