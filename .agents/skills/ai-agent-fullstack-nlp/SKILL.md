---
name: ai-agent-fullstack-nlp
description: Best practices for Autonomous AI Agents, LiteLLM routing, RAG pipelines, PDF/Resume Extraction, FastAPI/Streamlit backends, and Code Review assistants.
---

# AI Agents, Fullstack Apps & NLP Skill

Apply this skill when working on conversational AI, autonomous agents, PDF parsing, fullstack web interfaces, or code review assistants (`Tech-Resume-Parser`, `JARVIS`, `study-assistant-app`, `CodeReview AI Assistant`, `AI Agent`).

## 1. Multi-Model Agent Architecture & Fallbacks
* **Router Protocol:** Route light tasks (summaries, text classification) to fast models (`Gemini 2.5 Flash`) and complex tasks (code generation, architectural diffs) to reasoning models (`Gemini 2.5 Pro`).
* **Tool Calling & Structured Outputs:** Use Pydantic schemas or JSON schema mode to guarantee deterministic output parsing from LLMs.

## 2. Document & Resume Parsing Best Practices
* **PDF Extraction Pipeline:** Combine `pdfplumber` (for table & bounding box extraction) with `PyPDF2`/`pypdf` for fast plain-text extraction.
* **Entity Extraction:** Use regex + NLP/LLM zero-shot extraction for structured schemas (Contact Info, Work History, Skills taxonomy, Education).
* **Chunking Strategy:** When chunking text for embeddings/RAG, use recursive character splitting with a chunk size of `500-1000` tokens and `10-20%` overlap.

## 3. Fullstack API & Web Integration (FastAPI & Streamlit)
* **Async Endpoints:** Always use `async def` and `StreamingResponse` for LLM chat generation in FastAPI to deliver smooth word-by-word streaming to clients.
* **CORS & Middleware:** Configure `CORSMiddleware` properly for local frontend development (React, Vue, or Streamlit).
* **Environment Hygiene:** Always load API keys from `.env` via `python-dotenv` and never hardcode keys in client-side code or public repos.
