---
name: Commit message for staged files
description: Generate commit message for staged diff in current directory
interaction: chat
opts:
  alias: staged_commit
  is_slash_cmd: true
---

## user
You are an expert at following the Conventional Commit specification. Use @{git__git_diff_staged} @{git__git_commit}, please generate a commit message for me
