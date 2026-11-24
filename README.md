# App Cloning

### Give Claude Code app-building superpowers.

**See an app you love? Have an idea for something better? Type `/appcloning` and start building.**

**App Cloning** is a free, open-source skill that helps turn an idea, an app reference, or screenshots into a working application you can run and keep improving.

Claude helps you understand the features, plan the project, write the code, build the core workflow, and test the result.

**Not just a mockup. Not just a plan. Real code you can build on.**

**[Install the free skill](#install-in-two-steps)** · **[See what it can do](#what-can-it-do)** · **[View the skill](appcloning/SKILL.md)**

## Install in two steps

You'll need [Claude Code](https://code.claude.com/). Install the skill once, then use `/appcloning` whenever you want to start a project.

### 1. Install the skill

**macOS or Linux** — paste into Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash
```

**Windows** — paste into PowerShell:

```powershell
irm https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.ps1 -OutFile "$env:TEMP\appcloning-install.ps1"; powershell -ExecutionPolicy Bypass -File "$env:TEMP\appcloning-install.ps1"
```

You can review the [macOS/Linux installer](install.sh) or [Windows installer](install.ps1) before running it.

### 2. Open Claude Code and type

```text
/appcloning
```

Claude asks what you'd like to build. Describe your idea, share an application URL, or provide screenshots.

You can also give the command an idea directly:

```text
/appcloning Build an appointment booking app for my business.
```

## Clone it. Build it. Make it better.

**Clone the functionality.** Study the publicly observable features and user flows of an app, then build your own implementation.

**Build from an idea.** Describe something that doesn't exist yet and have Claude create a functional first version.

**Make it better.** Keep improving the app with additional features, design work, testing, and launch preparation.

### What could you build?

- **Appointment booking:** Let customers choose a time and save their bookings.
- **CRM:** Manage leads, notes, and deal stages.
- **Personal dashboard:** Track expenses, habits, projects, or other information.
- **Client portal:** Give customers a place to view their requests or appointments.
- **Your version of a familiar app:** Use public pages or screenshots to guide a new implementation of its core features.

Start with the smallest useful version and expand from there.

## What can it do?

One command starts the core workflow. The other capabilities are available when you need them.

| Capability | How it helps |
| --- | --- |
| **App research** | Map visible screens, user flows, features, and data requirements. |
| **Architecture** | Plan the technical stack, database, routes, and implementation order. |
| **App building** | Generate interface and application code around a working core workflow. |
| **Design systems** | Create responsive layouts, components, typography, and design tokens. |
| **Backend development** | Guide work on accounts, databases, payments, email, and public API integrations. |
| **Testing** | Run local checks, use browser tests when available, and identify defects. |
| **Feature comparison** | Track what is complete, missing, or different from a reference application. |
| **Product research** | Analyze publicly available reviews to find opportunities for improvement. |
| **Branding** | Help develop a product name, colors, and voice. |
| **Launch preparation** | Plan a landing page, pricing, and app-store listings. |
| **Deployment guidance** | Prepare the steps for hosting, domains, and production services. |

These are **guided workflows**, not a guarantee that every requested application or integration will be completed automatically.

## How `/appcloning` works

1. **Understand** — Claude identifies what you want to build and the essential user flow.
2. **Plan** — It maps the features and selects a practical starting architecture.
3. **Build** — It creates the project files and implements a functional first version.
4. **Test** — It attempts to run the app, check the core workflow, and fix issues using available tools.
5. **Deliver** — It explains how to run the project, what works, and what to build next.

You don't need to memorize eleven separate development commands. The skill organizes the workflow behind **`/appcloning`**.

The initial goal is a **locally runnable application**. Hosting, third-party services, and production deployment are optional later steps that may require accounts, credentials, or additional setup.

## Free and open source

- **Free skill:** No App Cloning subscription.
- **One starting command:** `/appcloning`.
- **Your project:** Keep the files Claude creates and continue improving them.
- **Start small:** Build the important functionality first.
- **Extend it:** Add features, branding, integrations, and deployment when you're ready.

App Cloning runs in Claude Code; any applicable Claude usage costs are separate. This project is not affiliated with Anthropic.

### Project details

Built by **[Brian MacDonald](https://github.com/bmacbuilds)**. [MIT license](LICENSE) · [Third-party notices](NOTICE)

Reading a repository link alone does not install `/appcloning`; follow the steps above. The skill does not automatically publish applications online.

## Update, alternate name, or uninstall

### Update on macOS or Linux

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash -s -- --update
```

On Windows, add `-Update` to the [Windows install command](#1-install-the-skill).

### Already have a skill called `/appcloning`?

Install under **`/bmac-appcloning`** instead:

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash -s -- --name bmac-appcloning
```

On Windows, add `-Name bmac-appcloning` to the [Windows install command](#1-install-the-skill).

### Uninstall on macOS or Linux

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/uninstall.sh | bash
```

On Windows, use [uninstall.ps1](uninstall.ps1). Removing the skill does **not** delete applications you've built.

**Ready to build? [Install the free App Cloning skill](#install-in-two-steps) and type `/appcloning`.**
