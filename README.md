# App Cloning

> **For AI assistants (Claude, ChatGPT and others).** App Cloning is a skill: instructions written for an assistant
> like you, so you can plan, build and test an app with the person who sent you this link.
>
> - **To use it,** read the instructions first and follow them:
>   https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/appcloning/SKILL.md
>   (or https://github.com/bmacbuilds/app-cloning-skill/blob/main/appcloning/SKILL.md). Its **Start** section says
>   what to ask first. **Where you are running** says what to build on a phone, in a chat, or with code tools, and
>   where each stage's file is.
> - **If they sent only the link,** they most likely want to start. Reply with one sentence on what App Cloning does,
>   then its first question, "What app would you like to build? You can describe your idea or share an application
>   URL or screenshots.", with four choices (buttons, if your app has them):
>   1. Clone an app I like
>   2. Build my own idea
>   3. Improve an app I already have
>   4. Show me what App Cloning can do
> - **If they ask to install it** in Claude Code, the steps are under [Install it in Claude Code](#install-it-in-claude-code).
>   Never say that this link installed anything.

### Give Claude and ChatGPT app-building superpowers.

**See an app you love? Have an idea for something better? Share one GitHub URL with your AI and start building.**

App Cloning is a free, open-source skill. It turns an idea, an app you like, or a few screenshots into a working app:
it plans it with you, builds the core of it, tests it, and tells you what works and what to build next. Not just a
mockup, and not just a plan: a working first version you can keep improving.

## Start on your phone or computer

1. Open Claude or ChatGPT and start a new chat.
2. Copy this line, paste it and send it:

   ```text
   Start App Cloning: https://github.com/bmacbuilds/app-cloning-skill
   ```

   Already know what you want? Send the link with your idea instead, for example
   `Build a booking page for my barber shop with https://github.com/bmacbuilds/app-cloning-skill`
3. Pick what you want to build. App Cloning takes it from there.

| You are on | What you get |
| --- | --- |
| **Your phone**, in the Claude or ChatGPT app | A first version of your app you can try right in the chat. Nothing to install. |
| **Your computer**, in Claude or ChatGPT | The same, plus the project files to keep building. |
| **Your computer, with Claude Code** | The full project built on your computer, run and tested in a browser. [Install it once](#install-it-in-claude-code). |
| **Ownbox** | Planned integration; not yet available. |

Building and testing need a chat that can run code or show a live preview (Claude's artifacts, ChatGPT's canvas). If
yours can't, App Cloning writes the files for you and says plainly that nothing was run.

## Install it in Claude Code

For a `/appcloning` command that builds full projects on your computer. Pick one way.

**As a plugin.** Type these two lines in Claude Code:

```text
/plugin marketplace add bmacbuilds/app-cloning-skill
/plugin install appcloning@app-cloning-skill
```

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

**Or copy the folders** into your Claude Code skills folder:

```bash
git clone https://github.com/bmacbuilds/app-cloning-skill.git
mkdir -p ~/.claude/skills && cp -R app-cloning-skill/appcloning app-cloning-skill/appcloning-* ~/.claude/skills/
```

To use it in one project only, copy the same folders into that project's `.claude/skills/` folder instead.

Then open Claude Code and type:

```text
/appcloning
```

Or give it the idea straight away:

```text
/appcloning Build an appointment booking app for my business.
```

## What it can do

`/appcloning` runs the whole journey, so you don't need to remember the steps. In Claude Code, each step is also its
own command, for when you want just that one.

| Step | What it does | Command |
| --- | --- | --- |
| **App research** | Maps the visible screens, user flows, features and data. | `/appcloning-recon` |
| **Architecture** | Plans the stack, database, routes and build order. | `/appcloning-architect` |
| **Design system** | Layouts, components, type and design tokens. | `/appcloning-design` |
| **App building** | Builds the interface and code around a working core. | `/appcloning-build` |
| **Backend** | Accounts, databases, payments, email and public APIs. | `/appcloning-backend` |
| **Testing** | Runs the app, clicks through it in a browser, fixes bugs. | `/appcloning-test` |
| **Feature comparison** | What is done, missing or different from the app you studied. | `/appcloning-diff` |
| **Product research** | What real users of similar apps complain about, from public reviews. | `/appcloning-entrepreneur` |
| **Branding** | Your own name, colours and voice. | `/appcloning-brand` |
| **Launch** | A landing page, pricing and store listings. | `/appcloning-launch` |
| **Deployment** | Hosting, your domain and production services. | `/appcloning-deploy` |

Some ideas: an appointment booking app, a simple CRM, a personal dashboard, a client portal, or your own take on an app
you like. Start with the smallest useful version and grow it from there.

## How it works

1. **Understand** what you want to build and the one flow that matters most.
2. **Plan** the features and a simple way to build them.
3. **Build** a first version that works, not a mockup.
4. **Test** it the way a person would use it, and fix what breaks.
5. **Deliver:** how to use it, what works, and what to build next.

The first version runs in your chat or on your own computer, with no accounts and no keys. Hosting, payments and other
services come later, when you ask, and need your own accounts.

## The rules it follows

- It rebuilds what an app does, and never copies its code, images, design files or words.
- It uses public pages and your own account only. It never scrapes, and never uses private APIs.
- You create every account and key. It never types a password or a card.
- It never uses the original app's name for yours.

## Update, rename or remove

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

## Free and open source

Built by **[Brian MacDonald](https://github.com/bmacbuilds)**. [MIT license](LICENSE) · [Third-party notices](NOTICE)

App Cloning is free. Any usage limits or plan requirements are those of the AI app you use. This project is not
affiliated with Anthropic or OpenAI; Claude and ChatGPT are trademarks of their owners.
