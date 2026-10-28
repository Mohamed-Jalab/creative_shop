# Contributing to Creative Shop

Thanks for your interest in contributing to Creative Shop.

## Ways to contribute

- Report bugs
- Suggest features
- Improve documentation
- Fix code issues
- Help with testing and validation

## Before you start

1. Fork the repository.
2. Create a feature branch from `main`.
3. Keep your changes focused and easy to review.
4. Avoid committing unrelated files.

## Development setup

```bash
git clone <your-fork-url>
cd creative_shop
flutter pub get
flutter pub run flutter_native_splash:create
```

If you are working on Firebase-related changes, make sure the Firebase configuration matches your environment and that security rules are reviewed before publishing.

## Pull request process

1. Update or add relevant documentation if your change affects setup or behavior.
2. Run the project checks locally.
3. Open a pull request with a clear title and summary.
4. Include screenshots or screen recordings when the UI changes.

## Reporting issues

When opening an issue, please include:

- clear title
- steps to reproduce
- expected behavior
- actual behavior
- environment details
- relevant screenshots if possible

## Code style

- Follow the existing Dart/Flutter style in the project.
- Prefer readable, small, well-named changes.
- Keep logic and UI separated where possible.

## Questions

If you are unsure about a contribution or design decision, open an issue and start a discussion before making a large change.
