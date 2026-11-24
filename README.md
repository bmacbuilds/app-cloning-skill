# App Cloning

Turn an idea, or an app you are allowed to study, into a working app of your own, with one command in Claude Code.

Built by [Brian MacDonald](https://github.com/bmacbuilds).

## Install

You need [Claude Code](https://code.claude.com). Then install App Cloning once.

**Mac or Linux:** paste this into Terminal and press Enter.

```
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash
```

**Windows:** paste this into PowerShell and press Enter.

```
irm https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.ps1 -OutFile "$env:TEMP\appcloning-install.ps1"; powershell -ExecutionPolicy Bypass -File "$env:TEMP\appcloning-install.ps1"
```

Then open Claude Code and type **`/appcloning`**.

The installer adds one folder to your Claude Code skills and changes nothing else. It never replaces a skill that is not
App Cloning without asking you first. If you use a coding assistant, you can ask it to run the line for your computer;
reading this page installs nothing.

## What it does

1. You type `/appcloning`, and Claude asks what you would like to build: an idea, a link or screenshots.
2. Claude plans the smallest useful version.
3. Claude builds it in a new folder on your computer, runs it, and checks every page in a browser.
4. Claude tells you how to start it, what works, and what you can ask for next.

For example: `/appcloning Build me a simple appointment booking app where customers can choose available times.`

The first version runs on your own computer, with no accounts and no keys. When you want more, ask: research, a full
design system, accounts and payments, how complete it is against the app you are rebuilding, your own name and brand,
a landing page and store listings, or putting it live on your own domain.

**The rules it follows:**
- It rebuilds what an app does, and never copies its code, images, design files or words.
- It uses public sources and your own account only, and never scrapes or calls private APIs.
- You create every account and key; it never types a password or a card.
- It never uses the original app's name for yours.

**What it does not do:** it does not put anything online by itself, and it does not promise a finished product in one
step. Some of its checks use Python 3; without it, App Cloning still works and skips them.

Not affiliated with Anthropic. Claude and Claude Code are trademarks of their owner.

## Update or remove it

**Update** to the newest version:

```
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash -s -- --update
```

On Windows, add ` -Update` to the end of the Windows install line.

**Another skill already uses `/appcloning`:** install App Cloning as `/bmac-appcloning` instead.

```
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/install.sh | bash -s -- --name bmac-appcloning
```

On Windows, add ` -Name bmac-appcloning` to the end of the Windows install line.

**Remove it.** The apps you built are never touched.

```
curl -fsSL https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/uninstall.sh | bash
```

On Windows, run [uninstall.ps1](uninstall.ps1) the same way as the installer.

## Credits and licenses

MIT: [LICENSE](LICENSE). Third-party licenses: [NOTICE](NOTICE).

---

Ownbox Ready. Need a persistent database, dashboard, mobile app, or team collaboration? Take this skill further with Ownbox.
