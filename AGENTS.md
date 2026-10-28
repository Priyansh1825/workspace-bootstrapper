# Multi-Project Workspace Memory & Agent Guide (D:\Projects)

This file is automatically loaded by Antigravity on every session across any machine or laptop. It records the complete architecture, workspace memory, environment setup, and active projects in this directory.

---

## 💻 Environment & CLI Setup (Portable)

- **Root Directory**: `D:\Projects` (or `<current-drive>:\Projects`)
- **CLI Commands Configured**:
  - `agy` / `antigravity` / `antigravity-ide`: Opens projects, files, and visual diffs.
  - `python git_all.py <command>` or `git-all <command>`: Executes Git commands across all sub-repositories simultaneously.
- **GitHub Account**: `Priyansh1825` (HTTPS authentication via `gh auth login`).

---

## 🧠 Workspace Skills (`.agents/skills/`)

1. **`ai-agent-fullstack-nlp`**: Autonomous agents, LiteLLM routing, RAG pipelines, FastAPI/Streamlit, Code Review AI.
2. **`applied-ml-diagnostics`**: Image classification (Medical & Agricultural), Transfer Learning, Imbalanced data handling.
3. **`computer-vision-tracking`**: OpenCV, YOLOv8, MediaPipe, Multi-camera re-ID, ByteTrack, low-latency video pipelines.
4. **`pytorch-gan-genai`**: CycleGAN, DCGAN, PyTorch adversarial loss balancing, GPU training stability.
5. **`quant-trading-rl`**: Technical indicators, Backtesting, Risk management, Gymnasium RL (PPO, DQN, Policy Gradient).

---

## 📂 Project Directory Map & Status

| Project Directory | GitHub Repository | Domain / Description | Key Tech Stack |
|---|---|---|---|
| **`AI_DCGAN`** | `Priyansh1825/AI-DCGAN` | Deep Convolutional GAN | PyTorch, CUDA, Computer Vision |
| **`CycleGAN_Project`** | `Priyansh1825/CycleGAN_Project` | Image-to-Image Translation with CycleGAN | PyTorch, Torchvision |
| **`Final year project`** | `Priyansh1825/MLOps-Tooling` | Microservices, API Gateway, Docker architecture | Node.js, Express, Docker |
| **`JARVIS`** | `Priyansh1825/jarvis-agent` | Desktop AI Voice & Tool Assistant with HUD | Python, FastAPI, WebSockets, Speech, PWA |
| **`Sign_Language_Translator`** | `Priyansh1825/Sign_Language_Translator` | Hand gesture recording & sign recognition | OpenCV, MediaPipe, Python |
| **`Tech-Resume-Parser`** | `Priyansh1825/Tech-Resume-Parser` | ATS resume parsing & job-role classification | Python, NLP, SQLite, Streamlit/FastAPI |
| **`agriculture-disease-detector`** | `Priyansh1825/agriculture-disease-detector` | Plant leaf disease classification | TensorFlow / Keras, CNNs |
| **`face-recognition-system`** | `Priyansh1825/face-recognition-system` | Face detection & recognition pipelines | OpenCV, Face Recognition |
| **`predictive-maintenance`** | `Priyansh1825/Predictive-Maintenance` | Machine sensor anomaly detection | Machine Learning, Time-Series |
| **`study-assistant-app`** | `Priyansh1825/study-assistant-app` | Academic study planner & assistant | Web / React, Node.js |
| **`tactical_physics_engine`** | `Priyansh1825/tactical_physics_engine` | 2D Raycaster, boundary collisions & AI harness | Python, Pygame/Custom Engine |
| **`Industrial_MultiCamera_Tracking`** | `Priyansh1825/Industrial_MultiCamera_Tracking` | Multi-camera tracking & surveillance | YOLOv8, ByteTrack, Multi-camera re-ID |
| **`Trading Bot`** | `Priyansh1825/Trading-Bot` | Quantitative Trading Bot & Backtester | Python, Financial Indicators |
| **`strategic_rl_project`** | `Priyansh1825/strategic_rl_project` | Reinforcement Learning trading agent | Gymnasium, PPO |
| **`CodeReview AI Assistant`** | `Priyansh1825/code-review-ai` | Autonomous code review & quality scoring | LLMs, AST, Python |
| **`v2x-anomaly-detection`** | `Priyansh1825/v2x-anomaly-detection` | Vehicle-to-everything anomaly detection | Machine Learning, Sensor Telemetry |
| **`amazon_recommender`** | `Priyansh1825/amazon_recommender` | Product recommendation engine | Python, ML |
| **`hand-tracked-builder`** | `Priyansh1825/hand-tracked-builder` | MediaPipe hand tracking builder | Node.js, JavaScript, MediaPipe |
| **`Skin disease`** | `Priyansh1825/Skin-Disease-Detector` | Skin disease classification CNN | PyTorch / TensorFlow, CNNs |
| **`AI Agent`** | `Priyansh1825/AI-Agent-CLI` | Multi-agent CLI orchestration tool | Python, Gemini API |
| **`AI/intelligent_document_analyzer`** | `Priyansh1825/Intelligent-document-analyzer` | AI document analyzer (PDF/DOCX) | Python, NLP |
| **`AI/smart-shop-accounting`** | `Priyansh1825/smart-shop-accounting` | AI-assisted shop billing & accounting | Python, SQLite, Tkinter/Web |
| **`workspace-mcp-server`** | `Priyansh1825/workspace-mcp-server` | Workspace Intelligence MCP Server | Python, FastMCP, Stdio |
| **`RootCare_CDR`** | - | Vector & CorelDRAW assets for RootCare Endodontics | CorelDRAW, SVG, PDF, Python |
| **`tactical-combat-ai`** | `Priyansh1825/tactical-combat-ai` | Real-time Tactical Combat & CQB Decision Copilot | Python, PyTorch, RL, OpenCV, FastAPI |
| **`person-replacer-ai`** | `Priyansh1825/person-replacer-ai` | Full-body inpainting & subject replacement beside celebrities | Python, OpenCV, dlib, FastAPI, GrabCut |
| **`LLM`** | `Priyansh1825/LLM` | 100% Offline Custom Transformer Engine & Training Studio | Python, PyTorch, RoPE, GQA, FastAPI, SSE |

---

## ⚡ Multi-Repo Management Rules

1. **Avoid Committing Huge Model Checkpoints**:
   - Always ensure `.gitignore` excludes `.pth`, `.h5`, `.pkl` (unless model weights are explicitly required in git-lfs) and `__pycache__/`.
2. **Batch Operations**:
   - Run `git-all status` to view changes across all 13+ sub-projects.
   - Run `git-all push` or `python git_all.py push` to synchronize all repositories.
