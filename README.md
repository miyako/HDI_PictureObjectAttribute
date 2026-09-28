# HDI_PictureObjectAttribute

A 4D **HDI** ("How Do I") example demonstrating how to store, read, and write a **picture value inside an object (JSON) field attribute**, instead of a dedicated Picture field.

## Overview

The `Children` table has a single `Obj` field of type Object. Alongside plain
`firstname`/`lastname` attributes, the demo stores an `avatar` attribute whose
value is a `Picture` — proving that 4D object fields can hold picture data
just like any other scalar attribute, and that pictures round-trip correctly
through `OB SET`/`OB Get` and disk storage.

## Features demonstrated

- Storing a `Picture` value as an attribute of an Object (JSON) field with `OB SET`.
- Reading a picture attribute back out of an object field for display in a form.
- Loading a picture from disk into a `Picture` variable with `READ PICTURE FILE`, then assigning it to an object attribute (`Select document` -> `READ PICTURE FILE` -> `OB SET`).
- A master/detail UI: a listbox (`ALL RECORDS`, `LISTBOX SELECT ROW`, `LISTBOX GET CELL POSITION`) driving a detail form that reads/writes the same record's object field.
- Standard record navigation and CRUD (`CREATE RECORD`, `SAVE RECORD`, `Is new record`) wired to toolbar-style icon buttons.

## Project structure

| Path | Purpose |
|------|---------|
| `Project/Sources/Methods/00_Start.4dm` | Entry point; opens the splash window and imports sample data on first run. |
| `Project/Sources/Forms/HDI` | Splash screen shown on startup (title, description, version/plugin checks). |
| `Project/Sources/Forms/HDI2` | Main demo form: listbox + detail area where the avatar picture is set. |
| `Project/Sources/TableForms/1` (`Children`) | Default input/output forms for the table holding the `Obj` field. |
| `Project/Sources/TableForms/4` (`SAMPLES`) | Default input/output forms for a secondary sample-data table. |
| `Resources/{lang}.lproj` | XLIFF translations (`en`, `ja`) for all UI text. |

## Points of interest for developers browsing this codebase

This project was originally a binary `.4DB` database converted to 4D's
project architecture, then modernized with the help of **GitHub Copilot**.
A few things worth looking at beyond the core picture-in-object feature:

- **Object (JSON) field access** — `Project/Sources/Forms/HDI2/ObjectMethods/detail_ChooseAvatar.4dm` and `Button3.4dm` show the minimal `OB SET`/`OB Get` pattern for reading and writing typed attributes (including `Picture`) on an Object field.
- **XLIFF localisation** — every user-facing string (menus, form labels, tooltips, alert text) is resolved via `:xliff:ID` references or `Localized string(...)`, backed by purpose-grouped `.xlf` files under `Resources/en.lproj` and `Resources/ja.lproj` (`menu*`, `HDI*`, `HDI2*`, `tableForms*`, `tips*`, `messages*`).
- **Dark mode & Liquid Glass** — `Project/Sources/styleSheets.css` and `styleSheets_mac.css` use `prefers-color-scheme` and `form-theme` media queries so the UI adapts automatically to light/dark mode and to macOS Tahoe's Liquid Glass button rendering, rather than hardcoding colors or control heights in the form JSON.
- **Modern startup pattern** — `00_Start.4dm` uses `#DECLARE`, `CALL WORKER` (instead of spawning a process), and a non-blocking `DIALOG(...; *)` with window-reuse detection, so re-running the demo brings the existing splash window forward instead of opening a duplicate.
- **Modern variable syntax** — all method code uses `var`/`#DECLARE` rather than the deprecated `C_*` declaration commands.
- **Listbox display defaults** — the record listbox disables ellipsis truncation (`truncateMode: "none"`) and uses legacy (last-column-grows) resizing, so column content is never silently hidden.

## Requirements

- 4D 21 or later (project format `.4DProject`).

## References

- **Blog post:** https://blog.4d.com/support-of-pictures-in-objects/
- **Original download:** https://download.4d.com/Demos/4D_v16_R4/HDI_PictureObjectAttribute.zip
