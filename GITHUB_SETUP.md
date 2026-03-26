# GitHub Repository Setup Guide

Follow these steps in order to create and publish the City Jail Database project on GitHub.

---

## Step 1 — Create the repository on GitHub

1. Go to [https://github.com/new](https://github.com/new)
2. Fill in the following settings:

| Field | Value |
|---|---|
| **Repository name** | `city-jail-db` |
| **Description** | Relational database project modeling a city jail system — CSC4710 Database Management Systems, Winter 2023 |
| **Visibility** | Public *(so it shows on your profile as a portfolio project)* |
| **Initialize with README** | ❌ No — you already have one locally |
| **Add .gitignore** | ❌ No — you already have one locally |
| **Choose a license** | MIT *(optional, but good practice for academic projects)* |

3. Click **Create repository**

---

## Step 2 — Add repository topics (tags)

Topics make your repo searchable on GitHub. After creating the repo:

1. On your repo page, click the ⚙️ gear icon next to **About** (top right of the page)
2. Add these topics one by one:

```
sql
mysql
database
relational-database
erd
academic-project
database-design
csc4710
```

3. Click **Save changes**

---

## Step 3 — Push your local files to GitHub

Open your terminal, navigate to the project folder, and run:

```bash
# Initialize git in your project folder
cd city-jail-db
git init

# Stage all files
git add .

# First commit
git commit -m "Initial commit: City Jail Database — CSC4710 Winter 2023"

# Set the default branch name to main
git branch -M main

# Connect to your GitHub repo (replace YOUR-USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR-USERNAME/city-jail-db.git

# Push to GitHub
git push -u origin main
```

After this, refresh your GitHub repo page — all files should be visible.

---

## Step 4 — Edit the About section

1. On your repo page, click the ⚙️ gear icon next to **About**
2. Fill in:

| Field | Value |
|---|---|
| **Description** | Relational database project modeling a city jail system — CSC4710 Winter 2023 |
| **Website** | *(leave blank)* |
| **Include in home page** | ✅ Releases, ✅ Packages if applicable |

3. Click **Save changes**

---

## Step 5 — Protect the main branch (optional but recommended)

This prevents accidentally force-pushing over your work.

1. Go to **Settings** → **Branches**
2. Click **Add branch protection rule**
3. Set **Branch name pattern** to `main`
4. Check:
   - ✅ **Require a pull request before merging**
   - ✅ **Do not allow bypassing the above settings**
5. Click **Create**

---

## Step 6 — Verify everything looks right

Go to your repo page and confirm:

- [ ] README displays correctly with all sections visible
- [ ] `sql/`, `queries/`, `schema/`, `docs/` folders are all present
- [ ] `schema/jail_project_erd.json` is in the schema folder
- [ ] The About section on the right shows the description and topics
- [ ] `.gitignore` is present (GitHub shows it in the file list)

---

## Step 7 — Add a README badge (optional)

You can add a language badge to the top of your README to make it look more polished. Open `README.md` and add this line right below the title:

```markdown
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-DDL%20%2B%20DML-informational)
![Status](https://img.shields.io/badge/status-complete-brightgreen)
```

Then commit and push:

```bash
git add README.md
git commit -m "Add README badges"
git push
```

---

## Future updates — how to push changes

Whenever you update any file (e.g. fix a query, update the ERD):

```bash
git add .
git commit -m "Brief description of what changed"
git push
```

Or for a specific file only:

```bash
git add schema/jail_project_erd.json
git commit -m "Update ERD: fix column names"
git push
```

---

## Viewing the ERD on GitHub

GitHub does **not** render the `.json` ERD file visually. To view it:

- **In VS Code:** Install the [ERD Editor extension](https://marketplace.visualstudio.com/items?itemName=dineug.vuerd-vscode) and open `schema/jail_project_erd.json`
- **On GitHub:** The file will appear as raw JSON — that is expected
- **Tip:** If you want a visual preview on GitHub, export a PNG from ERD Editor and commit it as `schema/jail_project_erd.png`, then add `![ERD](schema/jail_project_erd.png)` to your README

---

*This guide covers everything needed to publish and maintain the City Jail Database repo on GitHub.*
