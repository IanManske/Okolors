check:
  typos
  cargo fmt --check
  cargo doc --all-features --no-deps --lib
  cargo hack --rust-version --feature-powerset --skip default clippy
  cargo hack -p okolors --target wasm32-unknown-unknown --rust-version --feature-powerset --exclude-all-features --skip default,std,threads,image clippy

test:
  cargo test --all-features

test-hack:
  cargo test --all-features --doc
  cargo hack -p okolors --rust-version --feature-powerset --skip default test --lib
  cargo hack -p okolors-cli --rust-version --feature-powerset --skip default test
