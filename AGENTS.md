# Error handling
- In scripts intended for human consumptions, don't worry about elegant error handling by default. Just panic or let the original exception throw without attempting to make a nice error message.

# Comments
- Do not leave code comments unless I specifically ask for them.
- If you're moving or refactoring code that already has comments, keep them and adapt them if needed.

# Version Control
- Use Jujutsu for all version control operations.
- Unless I explicitly ask for `jj` actions, DO NOT run any `jj`
  command except for the following read only actions (with appropriate
  arguments):
    - `jj show`
    - `jj diff`
    - `jj log`
    - `jj status`
    - `jj op log`
    - `jj file show`
    - `jj file list`
    - `jj file search`
- If I ask you to use a workspace or a worktree, use the `jj workspace` commands.
- If I ask to fix conflicts, DO NOT run `jj new` and DO NOT run `jj squash`.
  Resolve the conflicts by editing files in @.
- If I specifically request splitting up a diff/commit, you may use the
  `jj-hunk` skill if it is available. When doing this, you can `jj edit` a
  commit in the split stack to fix the build or modify the stack so each commit
  stands on its own. Before starting one of these refactors, take note of the
  `jj op log` so you can back out mistakes.
- If you think a `jj` command that does not comply with the above rules is
  helpful, recommend the command to me, but do not run it.

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
