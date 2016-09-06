# GHT.vim Changelog

## [Unreleased]

### Added
- Add `CHANGELOG.md`.

### Changed
- Update `README.md` to include syntax highlighting and IRC info.
- Also added list info to `README.md`, but it's commented out until it starts working.

## [1.1.4] - 2016-08-05

### Added
- *Templates!~* Yes, `ISSUE_TEMPLATE.md`, `PULL_REQUEST.md`, and `CONTRIBUTING.md` are now present.
- `README.md` may or may not have been (read: was) updated.

## [1.1.3] - 2016-08-01

### Added
- Automatic Markdown syntax highlighting is now a thing.

## [1.1.2] - 2016-07-29

### Added
- If you try `GHT('derp')` or similar, you'll get a nice error message.

### Changed
- The codebase got a slight makeover.

## [1.1.1] - 2016-07-29

### Added
- If you don't have the template you try loading, you'll get a nice warning message.

### Fixed
- Filesystem root detection is no longer broken, so no more infinite loops outside of a repository.

## [1.1.0] - 2016-07-29

### Fixed
- The main `GHT()` function no longer sports a broken scope designation.

## [1.0.0] - 2016-07-28

### Added
- Implement basic features:
    - `GHTIssue` and `GHTPR` commands load appropriate templates in a scratch buffer.

[Unreleased]: https://github.com/nkantar/GHT.vim/compare/v1.1.4...HEAD
[1.1.4]: https://github.com/nkantar/GHT.vim/compare/v1.1.3...v1.1.4
[1.1.3]: https://github.com/nkantar/GHT.vim/compare/v1.1.2...v1.1.3
[1.1.2]: https://github.com/nkantar/GHT.vim/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/nkantar/GHT.vim/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/nkantar/GHT.vim/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/nkantar/GHT.vim/commit/fd4369e32e978ea7be32a4b1f988db822a334026
