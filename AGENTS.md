# Error handling
- In scripts intended for human consumptions, don't worry about elegant error handling by default. Just panic or let the original exception throw without attempting to make a nice error message.

# Comments
- Do not leave code comments unless I specifically ask for them.

# Version Control
- Use Jujutsu for all version control operations.
- Never run any `jj` command except for the following (with appropriate arguments):
    - `jj show`
    - `jj diff`
    - `jj log`
    - `jj status`

# Unit tests
- When writing unit tests, favor table-based testing rather than many tests with similar structure.

# Rust code
- Using `unwrap()` is fine in tests. We don't need an error message for everything.
- Where convenient, use the test-case crate for table-based testing.
- Never attempt to manually modify a `Cargo.lock` file. If your sandbox prohibits tools that update `Cargo.lock`, defer to the user to make the update outside the sandbox.
