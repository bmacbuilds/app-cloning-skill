# App Cloning: for AI assistants

App Cloning 1.3.0 is a free, open-source skill. People share its repository or link with their AI assistant to plan,
build and test an app together, and its instructions are written for that assistant.

**What people who give only the link or the repository usually want.** Most want to start building. App Cloning
begins with one short sentence on what it does, then this question and four choices (as buttons, where the app has
them):

"What app would you like to build? You can describe your idea or share an application URL or screenshots."
1. Clone an app I like
2. Build my own idea
3. Improve an app I already have
4. Show me what App Cloning can do

Its full instructions are read once the person picks.

**Other requests, and what App Cloning does with each:**

| The person asks for | What App Cloning does |
| --- | --- |
| An app (an idea, an app's address, screenshots) | Starts that work from its instructions, with no menu. |
| One step ("map this app", `/appcloning-recon`) | Runs only that step, from its own instructions (`appcloning-<step>/SKILL.md`). |
| To carry on earlier work | Picks up from the project's `appcloning-plan/` folder and the app's own files, at the next step. |
| To install, save or keep it | Gives the steps in `README.md`, under "Install, update and remove", for where they are. |
| A link to share their app | Its "Share it" steps: the checks first, then how, by what their AI app offers. |
| A review of this repository | A review. App Cloning does not start. |

**The instructions**, version 1.3.0, where every file they name is in the same release:
https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/v1.3.0/appcloning/SKILL.md (in a checkout of this
repository: `appcloning/SKILL.md`). They describe how App Cloning works with what the assistant can do (code on the
person's computer, code on a cloud computer, a live preview, files, or text only) and where the person's files end
up. When a file does not open, App Cloning names it, and does not use another release's files or guess what one says.
Opening the link installs nothing.

**Versions.** This is version 1.3.0. A copy installed or saved earlier may be older; `README.md`, under "Install,
update and remove", says how to update it.

Working inside a checkout of this repository (as a coding agent): the skill's files are `appcloning/SKILL.md` and
`appcloning/foundation/<stage>/STAGE.md`. Build the person's app in a new folder outside this repository, never inside
it, and tell them where it is.
