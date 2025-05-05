---
author: "Roland Thomas Jr"
title: "Exploring Falyx"
date: "2025-05-04"
description: ""
tags: ["post", "falyx", "cli"]
ShowToc: false
ShowBreadCrumbs: true
---

## 🛠️ Exploring Falyx: Three Powerful Ways to Build Python CLIs

Falyx is a modern Python CLI framework for building structured, resilient workflows — whether you're scaffolding a new CLI, automating tasks, or managing global developer utilities.

In this post, we'll explore the three main modes of using Falyx:

1. **Interactive Menu Mode**
2. **CLI Execution Mode**
3. **Python API Mode**

---

### 1. 🧭 Interactive Menu Mode

In this mode, Falyx provides an interactive menu-driven interface, allowing users to navigate and execute tasks seamlessly.

#### How It Works

By defining your CLI structure in a configuration file (`falyx.yaml` or `falyx.toml`), Falyx can automatically generate an interactive menu. This menu leverages `prompt_toolkit` and `rich` to offer a user-friendly interface.

#### Example

```bash
❯ falyx
                        🛠️ Config-Driven CLI

            [C] Cleanup temp files
            [Y] History              [H] Help   [Q] Exit

>
```


This command launches the interactive menu, displaying available tasks and options.

#### Ideal For

- Project scaffolding and task runners
- Internal tools with multiple operations
- Users who prefer guided, menu-based interactions

---

### 2. ⚙️ CLI Execution Mode

For users who prefer direct command execution, Falyx offers a CLI mode that allows tasks to be run via specific keys or aliases.

#### How It Works

Each task defined in your configuration file is assigned a unique key or alias. You can execute these tasks directly from the command line.

#### Example

```bash
$ falyx run R
```


This command executes the task associated with the key `R`.

#### Ideal For

- Scripting and automation
- CI/CD pipelines
- Users who prefer quick, direct command execution

---

### 3. 🐍 Python API Mode

Falyx isn't just a CLI tool; it's also a Python framework that can be integrated directly into your applications.

#### How It Works

By importing Falyx into your Python code, you can programmatically define and execute tasks, offering greater flexibility and integration capabilities.

#### Example

```python
import asyncio

from falyx import Falyx, Action

async def my_task():
    print("Executing my task")

falyx = Falyx(title="My CLI")
falyx.add_command(
    key="M",
    description="Run my task",
    action=Action(name="my_task", action=my_task)
)

asyncio.run(falyx.run())
```

#### Ideal For

- Embedding CLI capabilities into Python applications
- Dynamic task generation
- Advanced integrations and custom workflows

---

### 🚀 Getting Started

To begin using Falyx, install it via pip:

```bash
pip install falyx
```


Then, initialize your project:

```bash
falyx init project_name
```

This command scaffolds an example project in the specified directory.

#### Common Commands
- `falyx init my-cli` to scaffold a new CLI
- `falyx run key` to run a task
- `falyx` to launch the interactive menu
- `falyx init-global` to define reusable global tasks

---

Falyx's multi-modal approach ensures that it can adapt to various workflows and user preferences. Whether you're building interactive menus, automating tasks via the CLI, or integrating with Python applications, Falyx provides the tools and flexibility to enhance your development experience.

Feel free to explore more on [Falyx's GitHub repository](https://github.com/rolandtjr/falyx) and contribute to its development!

Ready to build your next terminal workflow? Try falyx init or falyx init-global and see what Falyx can do for you.

---

### 🌍 Bonus: Global Task Runner with `falyx init-global`

Falyx also supports defining reusable, system-wide tasks via a global configuration file. You can set this up with:

```bash
falyx init-global
```

This creates the directory:

```
~/.config/falyx/
```

And adds a starter `falyx.yaml` and `tasks.py`, for example:

**\~/.config/falyx/falyx.yaml**

```yaml
- key: D
  description: Update dotfiles
  action: dotfiles.update
  aliases: [update-dotfiles]
```

**\~/.config/falyx/tasks.py**

```python
async def update():
    print("Updating dotfiles...")
```

Once initialized, you can run tasks from anywhere:

```bash
falyx run D
falyx run update-dotfiles
falyx              # view all global tasks as a menu
```

Falyx will automatically detect and use this config when no project config is present, and temporarily add its location to `PYTHONPATH` so imports like `dotfiles.update` just work.

#### Ideal For

* Personal automation (e.g., dotfiles, system restarts, daily routines)
* Lightweight global dev tools
* One-liner task execution from anywhere

---
