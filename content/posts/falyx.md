---
author: "Roland Thomas Jr"
title: "Falyx"
date: "2025-04-15"
description: ""
tags: ["post", "falyx", "cli"]
ShowToc: false
ShowBreadCrumbs: true
---

## 🛡️ Introducing Falyx: A Resilient CLI Framework for Modern Workflows
In the ever-evolving landscape of software development, tools that offer resilience, clarity, and introspection are invaluable.  

Enter **Falyx**—a robust, asynchronous command-line interface (CLI) framework designed to streamline and fortify your workflows.  

### ⚙️ What is Falyx?
Falyx is a Python-based CLI framework that empowers developers to build **modular**, **fault-tolerant** command-line applications. Inspired by the discipline and strength of a phalanx, Falyx ensures that each component of your workflow stands firm — even in the face of failure.

### 🚀 Key Features

- **Modular Action Chaining** Compose complex workflows by chaining together discrete actions, each with its own context and lifecycle.
- **Built-in Retry Mechanism** – Handle flaky or transient failures with configurable retry policies, including exponential backoff.
- **Lifecycle Hooks** – Inject logic at every stage: `before`, `after`, `on_success`, `on_error`, and `on_teardown`.
- **Execution Tracing** – Built-in logging, result tracking, and timing for complete visibility.
- **Async-First Design** – Built on `asyncio`, with optional multiprocessing via `ProcessAction`.
- **Extensible CLI Menus** – Create interactive or headless menus using `prompt_toolkit` and `rich`, with support for history, tags, toggle states, and more.

### 🧪 Getting Started

Here's a simple example to illustrate how Falyx can be used to build a resilient CLI application:

```python
import asyncio
import random
from falyx import Falyx, Action, ChainedAction

# Define a flaky asynchronous step
async def flaky_step():
    await asyncio.sleep(0.2)
    if random.random() < 0.5:
        raise RuntimeError("Random failure!")
    return "ok"

# Create actions with retry enabled
step1 = Action(name="step_1", action=flaky_step, retry=True)
step2 = Action(name="step_2", action=flaky_step, retry=True)

# Chain the actions together
chain = ChainedAction(name="my_pipeline", actions=[step1, step2])

# Set up the CLI menu
falyx = Falyx("🚀 Falyx Demo")
falyx.add_command(
    key="R",
    description="Run My Pipeline",
    action=chain,
    logging_hooks=True,
    preview_before_confirm=True,
    confirm=True,
)

# Entry point
if __name__ == "__main__":
    asyncio.run(falyx.run())
```

When run, this script presents an interactive CLI menu with built-in preview, confirmation, and retry handling.

```bash
❯ python simple.py
                                🚀 Falyx Demo

  [R] Run My Pipeline
  [Y] History                                         [Q] Exit

>
```

Or run headlessly using intuitive CLI arguments:

```bash
❯ python simple.py run R
Command: 'R' — Run My Pipeline
└── ⛓ ChainedAction 'my_pipeline'
    ├── ⚙ Action 'step_1'
    │   ↻ Retries: 3x, delay 1.0s, backoff 2.0x
    └── ⚙ Action 'step_2'
        ↻ Retries: 3x, delay 1.0s, backoff 2.0x
Confirm execution of R — Run My Pipeline (calls `my_pipeline`)  [Y/n] y
[2025-04-15 22:03:57] WARNING   ⚠️ Retry attempt 1/3 failed due to 'Random failure!'.
✅ Result: ['ok', 'ok']
```

### 📈 Real-World Applications

Falyx is particularly well-suited for:

- **Automation Script**: Build resilient tools that self-heal from transient errors.
- **Data Pipelines**: Orchestrate complex data flows with retry logic and full observability.
- **Deployment Tooling**: Create safe deploys with preview, rollback, and confirmation baked in.

### 📚 Learn More

- 📖 [Source Code on GitHub](https://github.com/rolandtjr/falyx)

---

Falyx was designed for developers who don’t just want CLI tools to **run** — they want them to **recover**, **report**, and **adapt**.

If that sounds like you, give it a spin and start building resilient command flows today.

> _"Like a phalanx: organized, resilient, and reliable."_ ⚔️

---
