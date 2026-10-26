---
description: Generate a commit message for the merge in progress (after conflicts are resolved)
agent: build
---

You are an expert at following the Conventional Commit specification.

Based on staged code, generate commit message for merging and commit that message for me

## Context

Current branch:
!`git branch --show-current`

Merge in progress (MERGE_HEAD, empty means no merge is in progress):
!`git rev-parse -q --verify MERGE_HEAD && git log -1 --pretty=format:"%h %s" MERGE_HEAD`

Default merge message from git (includes the branch names and the list of files that had conflicts):
!`cat "$(git rev-parse --git-path MERGE_MSG)" 2>/dev/null`

Commits being merged in:
!`git log --no-merges --pretty=format:"%h %s" HEAD..MERGE_HEAD 2>/dev/null`

Staged changes for the merge commit:
!`git diff --cached --stat`

Files that still contain conflict markers (should be empty):
!`git grep -lE '^(<<<<<<<|>>>>>>>) ' -- . 2>/dev/null`

## Instructions

1. If MERGE_HEAD is empty, tell the user there is no merge in progress and stop.
2. If any file still contains conflict markers, warn the user before giving the message.
3. Use the default merge message for the subject line (`Merge branch 'X' into Y`), keeping the branch names exactly as git wrote them.
4. Analyze the merged commits, the staged diff, and the list of conflicted files, then write the message in this format:

```
Merge branch 'X' into Y

<One or two sentences summarizing the purpose of the merged work.>

- <Key change 1>
- <Key change 2>
- <Key change 3>

Conflicts resolved:
- <file>: <how it was resolved and why>
```

5. Rules:
   - Subject line: 72 characters or fewer, no trailing period.
   - Focus on what changed and why, not on how.
   - Only include the "Conflicts resolved" section if the default message lists conflicted files. Briefly describe the resolution for each, inferring it from the staged diff. Do not invent reasons you cannot see in the diff.
   - If a ticket or issue number appears in the commit messages, include it at the end (e.g. `Refs: #123`).
   - Use git mcp instead of command shell
   - Do not stage any more file
   - Distinguish between AI instructions, agent skill or prompt files and documentation files of the project. Below are common name of them
     - AI intructions, agents skill or prompt files: `.github/copilot-instructions.md`, `AGENTS.md`, `CLAUDE.md`, `SKILLS.md`, `*.prompt.md`, `.rules`
     - Documentation files of project: `README.md`, `doc/*`, `*_doc.*`
