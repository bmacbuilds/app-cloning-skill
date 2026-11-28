# App Cloning

**Turn an idea, an app you like, or a few screenshots into a working app, right in your AI chat.** Free and open
source, for Claude and ChatGPT, on your phone or your computer. Version 1.4.1.

## Use it right here

Paste this link into Claude or ChatGPT, then pick one, or say what you want in your own words:

1. **Clone an app I like.** Share its link or a few screenshots.
2. **Build my own idea.** "A booking app for my studio" is enough to start.
3. **Improve an app I already have.**
4. **Show me what App Cloning can do.**

App Cloning's instructions are one plain text file, if you want to read them first:
https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning/SKILL.md

App Cloning asks a few quick questions, then builds a first version you can try right in the chat. No sign-up, no
install and nothing sent to us. Not a mockup and not just a plan: a working app you can keep improving.

**Developers:** install it in Claude Code for the full project in a folder, tested in a browser, ready to deploy.
[Install, update and remove](https://github.com/bmacbuilds/app-cloning-skill#install-update-and-remove).

| Where you use it | What you get |
| --- | --- |
| **Claude or ChatGPT, in a chat** | A first version of your app to try right in the chat, with its files to download. |
| **Claude Code on your computer** | The full project in a folder on your computer, run and tested in a browser. |
| **Claude Code on the web** | The full project, built and tested on a cloud computer, with a download or a push to your own GitHub. |
| **Ownbox** | Planned integration; not yet available. |

## What it can do

`/appcloning` runs the whole journey, so you don't need to remember the steps. Each step is also its own command, and
any AI can read a step's own instructions from its link.

<!-- directory:start (written by scripts/stages.py) -->
| Step | Ask for | Command | Its instructions |
| --- | --- | --- | --- |
| **App research** | Map an app: its screens, user flows, features and data | `/appcloning-recon` | [recon](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-recon/SKILL.md) |
| **Architecture** | Plan the stack, database, routes and build order | `/appcloning-architect` | [architect](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-architect/SKILL.md) |
| **Design system** | A design system: layouts, components, type and design tokens | `/appcloning-design` | [design](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-design/SKILL.md) |
| **App building** | Build the interface and code around a working core | `/appcloning-build` | [build](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-build/SKILL.md) |
| **Backend** | Accounts, databases, payments, email and public APIs | `/appcloning-backend` | [backend](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-backend/SKILL.md) |
| **Testing** | Run it, click through it in a browser, and fix what breaks | `/appcloning-test` | [test](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-test/SKILL.md) |
| **Feature comparison** | What is done, missing or different from the app you studied | `/appcloning-diff` | [diff](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-diff/SKILL.md) |
| **Product research** | What real users of similar apps complain about, from public reviews | `/appcloning-entrepreneur` | [entrepreneur](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-entrepreneur/SKILL.md) |
| **Branding** | Your own name, colours and voice | `/appcloning-brand` | [brand](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-brand/SKILL.md) |
| **Launch preparation** | A landing page, pricing and store listings | `/appcloning-launch` | [launch](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-launch/SKILL.md) |
| **Deployment** | Hosting, your domain and production services | `/appcloning-deploy` | [deploy](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/appcloning-deploy/SKILL.md) |
<!-- directory:end -->

Some ideas: an appointment booking app, a simple CRM, a personal dashboard, a client portal, or your own take on an app
you like. Start with the smallest useful version and grow it from there.

## How it works

1. **Understand** what you want to build and the one flow that matters most.
2. **Plan** the features and a simple way to build them.
3. **Build** a first version that works, not a mockup.
4. **Test** it the way a person would use it, and fix what breaks.
5. **Deliver:** how to use it, where its files are, what works, and what to build next.

Come back later and it picks up where you left off: bring your project, or its `appcloning-plan/` folder, and it
carries on from the next step.

The first version runs in your chat, on your computer or on a cloud computer, with no accounts and no keys. Hosting,
payments and other services come later, when you ask, and need your own accounts.

## Install, update and remove

You don't need any of this to start: the link is enough. Install App Cloning to have `/appcloning` ready in Claude
Code, or keep it in the Claude app.

<details>
<summary><b>Claude Code plugin</b></summary>

Type these two lines in Claude Code:

```text
/plugin marketplace add bmacbuilds/app-cloning-skill
/plugin install appcloning@app-cloning-skill
```

Then type `/appcloning`, or `/appcloning-recon` for one step. If another skill already uses those names, type
`/appcloning:appcloning` and `/appcloning:appcloning-recon` instead.

**Update:** `claude plugin update appcloning@app-cloning-skill`. **Remove:**
`claude plugin uninstall appcloning@app-cloning-skill`. The apps you built are never touched.

</details>

<details>
<summary><b>Install script (Mac, Linux, Windows)</b></summary>

**Mac or Linux.** Paste this into Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/install.sh | bash
```

**Windows.** Paste this into PowerShell:

```powershell
irm https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/install.ps1 -OutFile "$env:TEMP\appcloning-install.ps1"; powershell -ExecutionPolicy Bypass -File "$env:TEMP\appcloning-install.ps1"
```

You can read the [Mac and Linux installer](https://github.com/bmacbuilds/app-cloning-skill/blob/v1.4.1/install.sh) or
the [Windows installer](https://github.com/bmacbuilds/app-cloning-skill/blob/v1.4.1/install.ps1) first. Each adds
twelve folders to your Claude Code skills and changes nothing else, and never replaces a skill that is not App Cloning
without asking you.

Then open Claude Code and type `/appcloning`, or give it the idea straight away:

```text
/appcloning Build an MVP of a booking app for med spas.
```

**Update** to this version, 1.4.1 (Mac or Linux):

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/install.sh | bash -s -- --update
```

On Windows, add ` -Update` to the end of the Windows install line.

**Another skill already uses `/appcloning`?** Install App Cloning as `/bmac-appcloning` instead:

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/install.sh | bash -s -- --name bmac-appcloning
```

On Windows, add ` -Name bmac-appcloning` to the end of the Windows install line.

**Remove it.** The apps you built are never touched.

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.4.1/uninstall.sh | bash
```

On Windows, run [uninstall.ps1](https://github.com/bmacbuilds/app-cloning-skill/blob/v1.4.1/uninstall.ps1) the same way as the installer.

</details>

<details>
<summary><b>Copy the folders</b></summary>

```bash
git clone https://github.com/bmacbuilds/app-cloning-skill.git
mkdir -p ~/.claude/skills && cp -R app-cloning-skill/appcloning app-cloning-skill/appcloning-* ~/.claude/skills/
```

To use it in one project only, copy the same folders into that project's `.claude/skills/` folder instead.

**Update:** copy them again from the newest release. **Remove:** delete the twelve `appcloning` folders.

</details>

<details>
<summary><b>Keep it in the Claude app</b></summary>

Ask Claude to save App Cloning as a skill. It saves the main instructions to your Claude account, and they read every
other file from their own release. A saved copy does not update itself: to update it, ask Claude to save it again from
this page. To remove it, delete it in Claude's skill settings.

</details>

## The rules it follows

- It rebuilds what an app does, and never copies its code, images, design files or words.
- It uses public pages and your own account only. It never scrapes, and never uses private APIs.
- You create every account and key. It never types a password or a card.
- It never uses the original app's name for yours.

## What it runs, sends and fetches

- **Runs:** in Claude Code, your AI runs commands on the computer it works on. It creates your app's files, installs
  your app's own dependencies with your OK, starts the app and tests it (in a browser with Playwright, installed only
  with your OK), and uses the small Python 3 helpers that come with the skill. In a chat app it only writes code and
  files.
- **Sends:** nothing to us. App Cloning has no server, no account, no analytics and no tracking. What you type goes
  only to the AI app you use, as it always does.
- **Fetches:** when you start it from the link, your AI app opens this repository's files on GitHub. Asked to
  study an app, it reads that app's public pages. The install script downloads the release from GitHub. The skill's
  own helper scripts make no network requests.

## Free and open source

Built by **[Brian MacDonald](https://github.com/bmacbuilds)**. [MIT license](https://github.com/bmacbuilds/app-cloning-skill/blob/v1.4.1/LICENSE) · [Third-party notices](https://github.com/bmacbuilds/app-cloning-skill/blob/v1.4.1/NOTICE)

App Cloning is free. Any usage limits or plan requirements are those of the AI app you use. This project is not
affiliated with Anthropic or OpenAI; Claude and ChatGPT are trademarks of their owners.
