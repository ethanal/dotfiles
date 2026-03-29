# Comments
- Be sparing with comments. Don't add comments to obvious code. Only add comments when extra context is required for a human to understand a piece of code.

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
