# Changelog

## Release 0.1.6

Change installation method, don't rely on sourcing the script manually,
but utilize the vendor directories in fish.

## Release 0.1.5

- Fix fry install rubies parser for `ruby-install`.
- Fix initializer for fry installer to work with fish `2.1.1`.
- Add fallback help command to fry config.

## Release 0.1.4

Fix `fry current` to work with fish `2.1.1`. Before it assumed to have
functionality inside fish master.

## Release 0.1.3

- Optimized `fry rubies`, before it was slowed down by the amount of
  rubies you had installed.

- Switch from `PATH` to `fish_user_paths`, this allows further control
  and visibility into your paths. You might not want to have the ruby
  path very first etc.

- Add config option for `prepend` path. In case you would like to have
  identical behaviour to the previous implementation (if you are using
  `fish_user_paths` for something).

- Introduce `fry env` that is a helper function to output a POSIX
  compatible PATH export.

- Rubinius gems path was moved in front of the ruby path.

## Release 0.1.2

- Absolute matches for versions take precedence.
- Fix an unstable option flag check (which broke in newer fish versions).
- Remove version validation for install command.

## Release 0.1.1

A minor fix to the new installer logic, making sure an error is not
shown when binary is missing.

## Release 0.1.0

This is a major bump in version, not because of major new functionality,
but because it has been very stable for a long time.

The newly added features are:

- More flexible installer support (now also with support for
  ruby-install).
- Support for rubinius custom gem bin folder (it is now added to PATH).
- Updated docs.
