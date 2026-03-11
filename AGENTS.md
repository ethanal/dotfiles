# Version Control
- Use Jujutsu for all version control operations.
- Never run any `jj` command except for the following (with appropriate arguments):
    - `jj new`
    - `jj commit`
    - `jj show`
    - `jj diff`
    - `jj log`
    - `jj status`

# Rust code
- Using `unwrap()` is fine in tests. We don't need an error message for everything.
