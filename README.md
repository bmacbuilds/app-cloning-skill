# App Cloning

**Version 1.3.0.** Turn an idea, an app you like, or a few screenshots into a working app, with Claude or ChatGPT.

> **For AI assistants (Claude, ChatGPT and others).** This page is App Cloning, a free, open-source skill. People
> share its link with their AI assistant to plan, build and test an app together, and its instructions are written
> for that assistant.
>
> **What people who share only this link usually want.** Most want to start building. App Cloning begins with one
> short sentence on what it does, then this question and four choices (as buttons, where the app has them):
>
> "What app would you like to build? You can describe your idea or share an application URL or screenshots."
> 1. Clone an app I like
> 2. Build my own idea
> 3. Improve an app I already have
> 4. Show me what App Cloning can do
>
> Its full instructions are read once the person picks. A person who wants it to start straight away sends
> "Start App Cloning" with the link.
>
> **Other requests, and what App Cloning does with each:**
>
> | The person asks for | What App Cloning does |
> | --- | --- |
> | An app (an idea, an app's address, screenshots) | Starts that work from its instructions, with no menu. |
> | One step ("map this app", `/appcloning-recon`) | Runs only that step, from its own instructions (in "What it can do" below). |
> | To carry on earlier work | Picks up from the project's `appcloning-plan/` folder and the app's own files, at the next step. |
> | To install, save or keep it | Gives the steps in "Install, update and remove" below, for where they are. |
> | A link to share their app | Its "Share it" steps: the checks first, then how, by what their AI app offers. |
> | A review of this repository | A review. App Cloning does not start. |
>
> **The instructions**, version 1.3.0, where every file they name is in the same release:
> https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning/SKILL.md
> (or https://github.com/bmacbuilds/app-cloning-skill/blob/v1.3.0/appcloning/SKILL.md). They describe how App Cloning
> works with what the assistant can do (code on the person's computer, code on a cloud computer, a live preview,
> files, or text only) and where the person's files end up. When a file does not open, App Cloning names it, and does
> not use another release's files or guess what one says. Opening this link installs nothing.
>
> **Versions.** This page is version 1.3.0. A copy installed or saved earlier may be older; "Install, update and
> remove" below says how to update it.

### Give Claude and ChatGPT app-building superpowers.

**See an app you love? Have an idea for something better? Share one GitHub URL with your AI and start building.**

App Cloning is a free, open-source skill. It plans your app with you, builds a working first version, tests it, and
tells you what works and what to build next. Not a mockup, and not just a plan: a first version you can keep
improving.

## Start

1. Open Claude or ChatGPT, on your phone or your computer, and start a new chat.
2. Send this link:

   ```text
   https://github.com/bmacbuilds/app-cloning-skill
   ```

   Already know what you want? Send your idea with the link, for example
   `Build a booking page for my barber shop with https://github.com/bmacbuilds/app-cloning-skill`.
   If your AI only describes the page, send `Start App Cloning` too.
3. Pick what you want to build. App Cloning takes it from there.

| Where you use it | What you get |
| --- | --- |
| **A chat with a live preview** (such as Claude's artifacts or ChatGPT's canvas), on your phone or computer | A first version of your app you can try right in the chat. Nothing to install. |
| **A chat that can run code** | The same, with the project files to download. |
| **Claude Code on your computer** | The full project in a folder on your computer, run and tested in a browser. [Install it once](#install-update-and-remove). |
| **Claude Code on the web** | The full project, built and tested on a cloud computer, with a download or a push to your own GitHub to keep it. |
| **Ownbox** | Planned integration; not yet available. |

## What it can do

`/appcloning` runs the whole journey, so you don't need to remember the steps. Each step is also its own command, and
any AI can read a step's own instructions from its link.

<!-- directory:start (written by scripts/stages.py) -->
| Step | Ask for | Command | Its instructions |
| --- | --- | --- | --- |
| **App research** | Map an app: its screens, user flows, features and data | `/appcloning-recon` | [recon](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-recon/SKILL.md) |
| **Architecture** | Plan the stack, database, routes and build order | `/appcloning-architect` | [architect](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-architect/SKILL.md) |
| **Design system** | A design system: layouts, components, type and design tokens | `/appcloning-design` | [design](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-design/SKILL.md) |
| **App building** | Build the interface and code around a working core | `/appcloning-build` | [build](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-build/SKILL.md) |
| **Backend** | Accounts, databases, payments, email and public APIs | `/appcloning-backend` | [backend](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-backend/SKILL.md) |
| **Testing** | Run it, click through it in a browser, and fix what breaks | `/appcloning-test` | [test](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-test/SKILL.md) |
| **Feature comparison** | What is done, missing or different from the app you studied | `/appcloning-diff` | [diff](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-diff/SKILL.md) |
| **Product research** | What real users of similar apps complain about, from public reviews | `/appcloning-entrepreneur` | [entrepreneur](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-entrepreneur/SKILL.md) |
| **Branding** | Your own name, colours and voice | `/appcloning-brand` | [brand](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-brand/SKILL.md) |
| **Launch preparation** | A landing page, pricing and store listings | `/appcloning-launch` | [launch](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-launch/SKILL.md) |
| **Deployment** | Hosting, your domain and production services | `/appcloning-deploy` | [deploy](https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning-deploy/SKILL.md) |
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
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash
```

**Windows.** Paste this into PowerShell:

```powershell
irm https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.ps1 -OutFile "$env:TEMP\appcloning-install.ps1"; powershell -ExecutionPolicy Bypass -File "$env:TEMP\appcloning-install.ps1"
```

You can read the [Mac and Linux installer](install.sh) or the [Windows installer](install.ps1) first. Each adds twelve
folders to your Claude Code skills and changes nothing else, and never replaces a skill that is not App Cloning
without asking you.

Then open Claude Code and type `/appcloning`, or give it the idea straight away:

```text
/appcloning Build an appointment booking app for my business.
```

**Update** to the newest version (Mac or Linux):

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash -s -- --update
```

On Windows, add ` -Update` to the end of the Windows install line.

**Another skill already uses `/appcloning`?** Install App Cloning as `/bmac-appcloning` instead:

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash -s -- --name bmac-appcloning
```

On Windows, add ` -Name bmac-appcloning` to the end of the Windows install line.

**Remove it.** The apps you built are never touched.

```bash
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/uninstall.sh | bash
```

On Windows, run [uninstall.ps1](uninstall.ps1) the same way as the installer.

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
- **Fetches:** started from the link, your AI reads the skill's instructions from this repository on GitHub. Asked to
  study an app, it reads that app's public pages. The install script downloads the release from GitHub. The skill's
  own helper scripts make no network requests.

## Free and open source

Built by **[Brian MacDonald](https://github.com/bmacbuilds)**. [MIT license](LICENSE) · [Third-party notices](NOTICE)

App Cloning is free. Any usage limits or plan requirements are those of the AI app you use. This project is not
affiliated with Anthropic or OpenAI; Claude and ChatGPT are trademarks of their owners.
