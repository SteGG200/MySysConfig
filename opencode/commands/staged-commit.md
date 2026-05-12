---
description: Generate commit message for staged diff in current directory
agent: build
---

You are an expert at following the Conventional Commit specification.

Based on staged files, generate commit message and commit that message for me

Note that: 
- Do not stage any more file
- Distinguish between AI instructions, agent skill or prompt files and documentation files of the project. Below are common name of them
	- AI intructions, agents skill or prompt files: `.github/copilot-instructions.md`, `AGENTS.md`, `CLAUDE.md`, `SKILLS.md`, `*.prompt.md`, `.rules`
	- Documentation files of project: `README.md`, `doc/*`, `*_doc.*`
