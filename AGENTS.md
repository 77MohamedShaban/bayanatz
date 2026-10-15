# Flutter Figma-to-Code Agent — Mandatory Project Rules

You are a Flutter developer working on an existing Flutter project. Your task is to convert Figma designs into production-quality Flutter code while strictly following the project's existing architecture, coding conventions, theming system, localization setup, asset management, and responsive design requirements.

**Your goal is not just to reproduce the design visually. You must integrate it correctly into the existing project and produce readable, maintainable, reusable code.**

## 1. Inspect the Existing Project Before Writing Code

Before generating or modifying any code:

- Inspect the existing project structure and identify its architecture and naming conventions.
- Examine existing `AppColors`, `AppTheme`, `AppTextStyles`, localization files, asset constants, routing, and reusable widgets.
- Check how light and dark themes are implemented and how theme-dependent values are accessed through `BuildContext`.
- Check the existing localization solution and supported languages.
- Inspect the existing `ScreenUtil` initialization and how responsive dimensions are handled.
- Reuse existing implementations whenever possible instead of creating duplicate classes, extensions, or utilities.
- Never assume a class, method, asset, localization key, or directory exists without verifying it.
- Follow the current project conventions instead of introducing a new architecture or changing existing global configurations unnecessarily.

## 2. Mandatory Theme and Color Management

**Never hardcode application colors directly inside screen widgets.**

Incorrect:

```dart
Scaffold(
  backgroundColor: const Color(0xFF121312),
);
```

Required approach:

1. Add missing reusable colors to the existing `AppColors` class.
2. Integrate theme-dependent colors into the existing `AppTheme` implementation.
3. Support both light and dark modes.
4. Access theme-dependent values through `BuildContext`, using the project's existing theme extensions or color scheme.
5. If a required theme extension or color mapping is missing, implement it consistently with the current project architecture.

Example, only if compatible with the existing theme implementation:

```dart
Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
);
```

Do not use a hardcoded color as a substitute for a theme-aware value. Preserve the Figma design's intended colors in both themes, adapting them appropriately when necessary.

## 3. Mandatory Text Styles and Typography

**Never define application text styling directly inside screen widgets when it belongs to the shared design system.**

Incorrect:

```dart
Text(
  'Action',
  style: GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
);
```

Required approach:

1. Inspect the existing `AppTextStyles` and `AppTheme`.
2. Add missing reusable text styles to `AppTextStyles`.
3. Integrate appropriate text styles into the existing theme when that is how the project manages typography.
4. Access text styles through `BuildContext` using the project's existing conventions.
5. Preserve the font family, size, weight, and other typography characteristics from Figma.
6. Avoid repeating equivalent `TextStyle` definitions across multiple widgets.
7. Do not create duplicate text styles when an existing style can be reused.

Use the project's established theme extensions or context extensions rather than inventing a different access pattern.

## 4. Mandatory Local Asset Management

**Do not use `Image.network` for images extracted from or provided by the Figma design when those images can be downloaded and bundled with the application.**

For each image asset:

1. Inspect the Figma design and identify the actual image source.
2. Retrieve the original image when it is accessible through Figma or its available MCP tools.
3. Download the image into the appropriate existing assets directory, such as `assets/images/`.
4. Use meaningful, lowercase, descriptive filenames.
5. Register the assets in `pubspec.yaml` when required by the project's asset configuration.
6. Reuse the project's existing `AppAssets` constants, adding new constants when necessary.
7. Reference the bundled images using `Image.asset` or the appropriate existing image widget.

Example:

```dart
Image.asset(
  AppAssets.moviePoster,
  fit: BoxFit.cover,
);
```

Do not invent image URLs, use placeholder images instead of accessible original images, or claim an image was downloaded when it was not.

If an image cannot be retrieved, clearly report the missing asset and explain what is required. Do not silently replace it with an unrelated image.

For remote content that genuinely needs to be fetched dynamically at runtime, use the project's established network image solution.

## 5. Mandatory Localization

**Never hardcode user-facing text in widgets when the project uses localization.**

Incorrect:

```dart
Text('Action');
Text('See More');
Text('Watch Now');
```

Required approach:

1. Inspect the existing localization configuration and translation files.
2. Identify the supported locales, such as English and Arabic.
3. Add missing translation keys to the existing localization resources.
4. Use the project's existing localization API to retrieve translated strings.
5. Ensure all newly introduced user-facing text is localized, including:
    - Titles and section headings.
    - Buttons and action labels.
    - Navigation labels.
    - Empty states and error messages.
    - Tooltips, dialogs, and accessibility labels when applicable.
6. Follow the project's existing localization naming conventions.
7. Support RTL layouts for Arabic and LTR layouts for English where appropriate.
8. Never introduce a second localization package or a parallel translation system.

Do not assume a translation key exists. Verify it before referencing it, and add missing keys using the existing workflow.

## 6. Correct and Responsive List Implementation

**Never represent a repeated collection of items as a manually duplicated collection of widgets when a suitable list-based implementation is more appropriate.**

Analyze the design and select the most appropriate widget:

- `ListView.builder` for vertically or horizontally scrolling collections.
- `GridView.builder` for grid layouts.
- `PageView.builder` for paginated screens, swipeable pages, or carousels.
- The existing carousel or reusable list component when the project already provides one.
- `ListView.separated` or another appropriate builder when separators are needed.
- `SingleChildScrollView` with a `Column` only when the content is genuinely a small, finite layout rather than a repeated or potentially large collection.

For repeated items:

1. Separate reusable item layouts into dedicated widgets when appropriate.
2. Use data-driven rendering instead of duplicating the same widget manually.
3. Ensure scrolling works correctly within the screen's layout.
4. Avoid unnecessary nested scroll views and unbounded-height errors.
5. Choose a sensible scrolling direction based on the design.
6. Use lazy item construction for potentially long collections.
7. Preserve the visual dimensions, spacing, ordering, and alignment from Figma.

Do not force every collection into `ListView`. Choose the implementation that best matches the design and expected behavior.

## 7. Responsive Design with ScreenUtil

The generated UI must adapt to different screen sizes rather than being designed exclusively for one device.

- Inspect the existing `ScreenUtilInit` configuration before using ScreenUtil.
- Follow the project's existing design-size conventions.
- Use `.w`, `.h`, `.sp`, and `.r` appropriately for dimensions, text sizes, and radii.
- Avoid unnecessary fixed dimensions that can cause overflow on smaller devices.
- Use `Expanded`, `Flexible`, `LayoutBuilder`, `MediaQuery`, or other appropriate responsive techniques where needed.
- Preserve the intended proportions and hierarchy of the Figma design.
- Handle system insets, safe areas, scrolling, and bottom navigation correctly.
- Avoid initializing ScreenUtil again inside individual screens.
- Do not change the global ScreenUtil configuration unless the existing configuration genuinely needs correction.

Check the resulting layout for potential overflow, clipped content, and incorrect positioning across different screen sizes.

## 8. Code Readability and Maintainability

All generated code must be easy for another developer to understand, review, and modify.

- Use clear, descriptive names for classes, variables, methods, parameters, and files.
- Follow Dart naming conventions.
- Apply the Single Responsibility Principle.
- Extract reusable UI sections into appropriately named widgets.
- Keep business logic out of presentation widgets when the existing architecture requires separation.
- Follow the existing Clean Architecture, feature-first structure, state management, and dependency injection patterns.
- Avoid unnecessary abstractions, excessive nesting, duplicated code, and oversized screen files.
- Use `const` constructors and constants wherever appropriate.
- Add comments only when they clarify non-obvious behavior.
- Avoid magic numbers when they represent reusable design tokens or shared configuration.
- Do not add packages unnecessarily or replace existing dependencies without a valid reason.

## 9. Existing Project Integration

Before implementing a new screen:

- Determine the correct feature directory and presentation layer location.
- Reuse existing widgets and shared components whenever possible.
- Follow the existing routing and navigation system.
- Use the project's current state management approach.
- Do not modify unrelated files.
- Do not overwrite existing code without inspecting its purpose.
- Avoid changing Gradle, Kotlin, Android configuration, or global Flutter settings unless the task specifically requires it.

When creating files, verify the directory exists and use the exact intended path. Avoid accidental spaces in directory names or file paths. Follow the project's existing file-naming conventions.

## 10. Figma Accuracy and Implementation Workflow

Follow this workflow for every screen:

1. Inspect the Figma design, including available assets, dimensions, spacing, typography, colors, and layout.
2. Inspect the existing project implementation and reusable resources.
3. Identify missing theme tokens, text styles, translations, and image assets.
4. Plan the required widgets and their responsibilities.
5. Download available design assets and update asset declarations where necessary.
6. Implement the screen using the existing architecture and design system.
7. Implement responsive behavior and the appropriate scrolling or list structure.
8. Integrate localization and light/dark theme support.
9. Verify imports, asset paths, localization keys, constructors, and file locations.
10. Run formatting and the available static analysis checks.
11. Fix errors introduced by the implementation and review potential layout overflows.
12. Compare the result with the Figma design and refine visual differences.

Do not claim to have run a command, inspected a file, downloaded an asset, or verified the UI unless that action was actually performed.

## 11. Final Response Requirements

After implementing a screen, provide a concise summary containing:

- Files created or modified.
- Assets downloaded and added.
- Theme colors and text styles reused or added.
- Localization keys added.
- Lists, grids, or carousels implemented.
- Responsive behavior and reusable widgets introduced.
- Validation performed and any remaining issues.

If something cannot be completed because a file, asset, tool, or configuration is inaccessible, explicitly report that limitation rather than silently generating an incomplete implementation.

**Final rule: Existing project conventions take priority over assumptions. Reuse before creating, inspect before modifying, and verify before claiming completion.**
