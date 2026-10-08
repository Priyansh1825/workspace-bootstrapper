# AI Agent Workspace Bootstrapper Instructions (`AGENT_SETUP.md`)

This guide provides automated instructions for any AI coding agent (Antigravity, Cursor, Claude Code, Copilot) when hydrating this multi-project workspace on a **new laptop or fresh machine**.

---

## 🎯 The Goal

When a developer clones this bootstrap repository (`MY project`) onto a new laptop and opens the AI agent:
1. The AI agent reads this file (`AGENT_SETUP.md`) and [`repos.json`](file:///repos.json).
2. The AI agent autonomously inspects the filesystem and clones all **24 project repositories** into their exact relative folder structures.
3. The AI agent verifies branches and ensures each repository's Git history remains completely independent (no nested submodules).
4. The AI agent generates a unified multi-root VS Code workspace file (`workspace.code-workspace`) linking all sub-projects.
5. The workspace on the new laptop becomes **100% identical** to the development environment on the original machine.

---

## 📂 Managed Sub-Repositories (24 Total)

All managed sub-repositories are declared in [`repos.json`](file:///repos.json):

| Sub-Project | Local Path | Branch | Git Remote URL |
|---|---|---|---|
| **AI Agent** | `AI Agent` | `main` | `https://github.com/Priyansh1825/AI-Agent-CLI.git` |
| **intelligent_document_analyzer** | `AI/intelligent_document_analyzer` | `master` | `https://github.com/Priyansh1825/Intelligent-document-analyzer` |
| **smart-shop-accounting** | `AI/smart-shop-accounting` | `main` | `https://github.com/Priyansh1825/smart-shop-accounting.git` |
| **AI_DCGAN** | `AI_DCGAN` | `main` | `https://github.com/Priyansh1825/AI-DCGAN.git` |
| **code-review-ai** | `CodeReview AI Assistant/code-review-ai` | `main` | `https://github.com/Priyansh1825/code-review-ai.git` |
| **CycleGAN_Project** | `CycleGAN_Project` | `main` | `https://github.com/Priyansh1825/CycleGAN_Project.git` |
| **Final year project** | `Final year project` | `main` | `https://github.com/Priyansh1825/MLOps-Tooling.git` |
| **Industrial_MultiCamera_Tracking** | `Industrial_MultiCamera_Tracking` | `main` | `https://github.com/Priyansh1825/Industrial_MultiCamera_Tracking.git` |
| **ISKCON** | `ISKCON` | `main` | `https://github.com/Manav2304/ISKCON.git` |
| **JARVIS** | `JARVIS` | `main` | `https://github.com/Priyansh1825/jarvis-agent.git` |
| **Sign_Language_Translator** | `Sign_Language_Translator` | `main` | `https://github.com/Priyansh1825/Sign_Language_Translator.git` |
| **Skin disease** | `Skin disease` | `main` | `https://github.com/Priyansh1825/Skin-Disease-Detector.git` |
| **Tech-Resume-Parser** | `Tech-Resume-Parser` | `main` | `https://github.com/Priyansh1825/Tech-Resume-Parser.git` |
| **Trading Bot** | `Trading Bot` | `main` | `https://github.com/Priyansh1825/Trading-Bot.git` |
| **agriculture-disease-detector** | `agriculture-disease-detector` | `main` | `https://github.com/Priyansh1825/agriculture-disease-detector.git` |
| **amazon_recommender** | `amazon_recommender` | `main` | `https://github.com/Priyansh1825/amazon_recommender.git` |
| **face-recognition-system** | `face-recognition-system` | `main` | `https://github.com/Priyansh1825/face-recognition-system.git` |
| **hand-tracked-builder** | `hand-tracked-builder` | `main` | `https://github.com/Priyansh1825/hand-tracked-builder.git` |
| **predictive-maintenance** | `predictive-maintenance` | `main` | `https://github.com/Priyansh1825/Predictive-Maintenance.git` |
| **strategic_rl_project** | `strategic_rl_project` | `main` | `https://github.com/Priyansh1825/strategic_rl_project.git` |
| **study-assistant-app** | `study-assistant-app` | `main` | `https://github.com/Priyansh1825/study-assistant-app.git` |
| **tactical_physics_engine** | `tactical_physics_engine` | `main` | `https://github.com/Priyansh1825/tactical_physics_engine.git` |
| **v2x-anomaly-detection** | `v2x-anomaly-detection` | `main` | `https://github.com/Priyansh1825/v2x-anomaly-detection.git` |
| **workspace-mcp-server** | `workspace-mcp-server` | `main` | `https://github.com/Priyansh1825/workspace-mcp-server.git` |

---

## 🤖 Autonomous Agent Execution Plan

When an agent is asked to "set up", "hydrate", or "bootstrap" this workspace, the agent MUST execute the following sequence:

### Step 1: Read the Manifest
Load [`repos.json`](file:///repos.json) from the workspace root.

### Step 2: Validate & Clone
Iterate through each entry in `manifest["repositories"]`:
1. Check if `<workspace_root>/<local_path>` exists.
2. If the folder exists and has `.git`, run `git status` inside it to verify health.
3. If the folder does NOT exist:
   - Ensure the parent directory exists (e.g. `AI/` for `AI/intelligent_document_analyzer`).
   - Run:
     ```bash
     git clone -b <branch> <git_url> "<local_path>"
     ```
   - If branch-specific clone fails, fallback to:
     ```bash
     git clone <git_url> "<local_path>"
     git -C "<local_path>" checkout <branch>
     ```

### Step 3: Git Isolation Guarantee
Verify that the root [`.gitignore`](file:///d:/MY%20project/.gitignore) remains active:
- It uses `/*` to ignore all cloned sub-folders.
- Sub-repositories maintain independent `.git` directories.

### Step 4: Generate Multi-Root Workspace File
Create or update `workspace.code-workspace` in the root containing all 24 directories and IDE settings so VS Code / Antigravity displays all repositories in the unified sidebar.

### Step 5: Environment & Tools Validation
1. Verify Python/Miniconda: Run `python --version` and check interpreter configuration.
2. Verify batch management: Run `python git_all.py status` to ensure all 24 repositories report `[Clean] No uncommitted changes`.

---

## ⚡ One-Click Automated Python Runner

An agent or developer can run this single command to bootstrap all 24 repositories:

```python
import json
import os
import subprocess
from pathlib import Path

ROOT = Path(".").resolve()
with open(ROOT / "repos.json", "r", encoding="utf-8") as f:
    manifest = json.load(f)

repos = manifest.get("repositories", [])
print(f"[*] Bootstrapping {len(repos)} repositories across workspace...")

for r in repos:
    name = r["name"]
    rel_path = r["local_path"]
    url = r["git_url"]
    branch = r.get("branch", "main")
    target = ROOT / rel_path

    if (target / ".git").exists():
        print(f"[✓] {name} already hydrated ({rel_path})")
    else:
        print(f"[+] Cloning {name} ({branch}) -> {rel_path}...")
        target.parent.mkdir(parents=True, exist_ok=True)
        try:
            subprocess.run(["git", "clone", "-b", branch, url, str(target)], check=True)
        except Exception:
            subprocess.run(["git", "clone", url, str(target)], check=True)

# Generate workspace file
workspace_data = {
    "folders": [{"name": "Workspace Root", "path": "."}] + [
        {"name": r["name"], "path": r["local_path"]} for r in repos
    ],
    "settings": {
        "python.defaultInterpreterPath": "C:\\Users\\priya\\Miniconda3\\python.exe"
    }
}

with open(ROOT / "workspace.code-workspace", "w", encoding="utf-8") as f:
    json.dump(workspace_data, f, indent=2)

print("[✓] Multi-root workspace generated: workspace.code-workspace")
print("[*] All 24 repositories ready!")
```
