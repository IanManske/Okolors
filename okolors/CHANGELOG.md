# Changelog

# v0.9.0

## Breaking

- Removed the `sampling_factor` and `batch_size` options in favor of the new `kmeans_options` method. It takes the new `KmeansOptions` struct as input.
- Removed the `ColorSlice` and `AboveMaxLen` types. Instead, `Okolors::new` now takes a regular slice and can error with a `LengthOutOfRange` error.
- Methods on the `Okolors` builder struct now take owned `self`s instead of references to `self`.
- The `palette_size` option now takes just `PaletteSize` as input instead of `impl Into<PaletteSize>`. `PaletteSize`s can also no longer be zero, requiring other breaking changes to its API.

## Other

- Added the `dedup` option to control when the pixel deduplication optimization is run. Previously, deduplication was always performed.
- Added the `std` cargo feature to enable/disable Rust `std` usage for `no_std` support.
  - In theory, this library is now `no_std` compatible (still needs `alloc` though). The `image`, `threads`, and `std` features must be disabled.
- Bumped `quantette` dependency version to `0.5.1`.

# v0.8.1

- Bumped `quantette` dependency version to `0.3.0`.

# v0.8.0

## Breaking

- Methods on the `Okolors` builder struct now take references to `self` instead of owned `self`s.

## Other

- `Okolors::palette_size` now takes `impl Into<PaletteSize>` instead of just `PaletteSize`.
- Added re-exports for constants from `quantette`.
- Updated/expanded documentation.

# v0.7.0

- External crates that have types present in `okolors`'s public API are now reexported (`palette` and `image`).
- Types from `quantette` that are in the public API are also now reexported.
- Bumped `image` version to `0.25.0`.

## Breaking changes

- Removed the `{color}_palette_par` functions in favor of the `Okolors::parallel` function.

# v0.6.0

- Added a `Okolors::sort_by_frequency` function which will sort the colors in the returned palette by ascending frequency (the number of pixels corresponding to the palette color).
- `Okolors` now implements `Debug` and `Clone`.
- `Okolors` builder now takes and returns `Self` instead of `&mut Self`.

# v0.5.1

Changelog starts here.
