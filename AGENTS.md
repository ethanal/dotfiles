# Error handling
- In scripts intended for human consumptions, don't worry about elegant error handling by default. Just panic or let the original exception throw without attempting to make a nice error message.

# Comments
- Do not leave code comments unless I specifically ask for them.

# Version Control
- Use Jujutsu for all version control operations.
- ABSOLUTELY NEVER run any `jj` command except for the following (with appropriate arguments):
    - `jj show`
    - `jj diff`
    - `jj log`
    - `jj status`
- DO NOT run a `jj` command that modifies revisions other than the current one, `@`. For example:
    - If I ask to fix conflicts, DO NOT run `jj new`, DO NOT run `jj squash`
    - NEVER run `jj edit`
    - NEVER run `jj rebase`
- If you think a `jj` command that modifies commit other then `@`, recommend the command to me, but do not run it.

# Tests
- Prefer property-based testing if it's a good fit.
- If you do write unit tests, favor table-based testing rather than many tests with similar structure.

# Naming
- If variables are used immediately or shortly after being defined, they don't need long names.

# Dependencies
- If you think a dependency is a good fit for a problem but you don't have it
  available due to sandbox restrictions, don't give up on using it and roll
  your own. Ask the user for help resolving the issue.

# Rust code
- Using `unwrap()` is fine in tests. We don't need an error message for everything.
- For lock poisoning, you can just do `.unwrap()` instead of giving an `.expect("...")` message.
- If you see something like `self.x.iter()` separated onto multiple lines by the formatter, put it in parens like `(self.x.iter())` so it stays on one line.
- Where convenient, use the `test-case` crate for table-based testing.
- Never attempt to manually modify a `Cargo.lock` file. If your sandbox
  prohibits tools that update `Cargo.lock`, defer to the user to make the
  update outside the sandbox.
