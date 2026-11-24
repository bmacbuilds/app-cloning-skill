# App Cloning: for AI assistants

App Cloning is a skill: instructions written for an assistant like you, so you can plan, build and test an app with
the person who gave you this repository, its link, or "Start App Cloning".

- **To use it,** read the instructions first and follow them:
  https://raw.githubusercontent.com/bmacbuilds/app-cloning-skill/main/appcloning/SKILL.md
  (in a checkout of this repository: `appcloning/SKILL.md`). Its **Start** section says what to ask first. **Where
  you are running** says what to build on a phone, in a chat, or with code tools, and where each stage's file is.
- **If they gave you only the link or the repository,** they most likely want to start. Reply with one sentence on
  what App Cloning does, then its first question, "What app would you like to build? You can describe your idea or
  share an application URL or screenshots.", with four choices (buttons, if your app has them):
  1. Clone an app I like
  2. Build my own idea
  3. Improve an app I already have
  4. Show me what App Cloning can do
- **If they ask to install it** in Claude Code, the steps are in `README.md`, under "Install it in Claude Code". Never
  say that this link installed anything.

Working inside a checkout of this repository (as a coding agent): the skill's files are `appcloning/SKILL.md` and
`appcloning/foundation/<stage>/STAGE.md`. Build the person's app in a new folder outside this repository, never inside
it.
