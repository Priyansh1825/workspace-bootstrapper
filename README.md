# Antigravity Multi-Project Workspace Bootstrapper

This repository is a portable **Workspace Bootstrapper** for managing 24 interconnected AI, Computer Vision, MLOps, NLP, and Fullstack projects.

Clone this single repository onto any new laptop or development environment to autonomously hydrate all projects, configure environments, and link your multi-root IDE.

---

## 🚀 Quick Setup on a New Laptop

### Option 1: AI Agent Autonomous Setup (Recommended)
1. Clone this repository into a folder named `MY project`:
   ```bash
   git clone https://github.com/Priyansh1825/workspace-bootstrapper.git "MY project"
   cd "MY project"
   ```
2. Open the folder in **Google Antigravity**, **Cursor**, or **VS Code**.
3. Prompt your AI Agent:
   > *"Read AGENT_SETUP.md and bootstrap my workspace."*
4. The agent will read [`repos.json`](file:///repos.json), clone all 24 sub-repositories into their exact folder hierarchy, and generate [`workspace.code-workspace`](file:///workspace.code-workspace).

### Option 2: One-Click Script Setup
Run the automated bootstrapper directly from PowerShell / CMD:
```bash
python -c "import json, subprocess, os; from pathlib import Path; r=Path('.'); manifest=json.load(open(r/'repos.json')); [subprocess.run(['git', 'clone', '-b', p.get('branch','main'), p['git_url'], p['local_path']], check=True) for p in manifest['repositories'] if not (r/p['local_path']/'.git').exists()]"
```

---

## 🛠️ Multi-Repo Git Operations

This workspace provides unified Git management across all 24 sub-projects simultaneously:

```bash
# Check status across all 24 repositories
python git_all.py status

# Push all commits across all 24 repositories
python git_all.py push

# Pull latest changes across all 24 repositories
python git_all.py pull
```

---

## 📁 Repository Directory Map (24 Projects)

All sub-repositories are declared in [`repos.json`](file:///repos.json):

| Sub-Project | Local Path | Domain / Description |
|---|---|---|
| **AI Agent** | `AI Agent` | Multi-agent CLI orchestration tool |
| **intelligent_document_analyzer** | `AI/intelligent_document_analyzer` | AI document analyzer (PDF/DOCX) |
| **smart-shop-accounting** | `AI/smart-shop-accounting` | AI shop billing & accounting |
| **AI_DCGAN** | `AI_DCGAN` | Deep Convolutional GAN in PyTorch |
| **code-review-ai** | `CodeReview AI Assistant/code-review-ai` | Autonomous code review & quality scoring |
| **CycleGAN_Project** | `CycleGAN_Project` | Image-to-Image Translation with CycleGAN |
| **Final year project** | `Final year project` | Microservices, API Gateway, Docker MLOps |
| **Industrial_MultiCamera_Tracking** | `Industrial_MultiCamera_Tracking` | Multi-camera ByteTrack & Re-ID tracking |
| **ISKCON** | `ISKCON` | Community application platform |
| **JARVIS** | `JARVIS` | Desktop AI Voice & Tool Assistant with HUD |
| **Sign_Language_Translator** | `Sign_Language_Translator` | MediaPipe hand gesture translator |
| **Skin disease** | `Skin disease` | Skin disease CNN classifier |
| **Tech-Resume-Parser** | `Tech-Resume-Parser` | NLP ATS resume parser & job classifier |
| **Trading Bot** | `Trading Bot` | Quantitative trading bot & backtester |
| **agriculture-disease-detector** | `agriculture-disease-detector` | Plant leaf disease classification |
| **amazon_recommender** | `amazon_recommender` | Product recommendation engine |
| **face-recognition-system** | `face-recognition-system` | Face detection & recognition pipelines |
| **hand-tracked-builder** | `hand-tracked-builder` | MediaPipe hand tracking builder |
| **predictive-maintenance** | `predictive-maintenance` | Machine sensor anomaly detection |
| **strategic_rl_project** | `strategic_rl_project` | Gymnasium RL PPO trading agent |
| **study-assistant-app** | `study-assistant-app` | Academic study planner & assistant |
| **tactical_physics_engine** | `tactical_physics_engine` | 2D Raycaster, collisions & AI engine |
| **v2x-anomaly-detection** | `v2x-anomaly-detection` | V2X sensor telemetry anomaly detection |
| **workspace-mcp-server** | `workspace-mcp-server` | FastMCP Workspace Intelligence server |
