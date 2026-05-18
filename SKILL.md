---
name: agent-mem
description: Multi-Agent Memory + Dispatch System. 4-tier memory (HOT/WARM/COLD/ARCHIVE), cross-channel sharing, dispatch loop with auto-learning. The only open-source solution managing both WHAT agents remember and WHO should handle the task.
emoji: 🧠🔄
metadata:
  openclaw:
    requires: {}
    install:
      - pip install -e .
---

# AgentMem

Multi-Agent Memory + Dispatch System

## Core Capabilities

### 1. Four-Tier Memory (HOT → WARM → COLD → ARCHIVE)
Memories decay naturally over time instead of being treated equally.
- **HOT**: Real-time session cache (2h TTL), cross-channel sharing
- **WARM**: Recent summaries (24h), quick retrieval
- **COLD**: Permanent storage (important facts, user preferences)
- **ARCHIVE**: Historical archive (30 days), searchable

### 2. Cross-Channel Memory Sharing
Same agent shares memory across different channels (webchat/Feishu/Slack/Telegram).
What users discuss on one channel is immediately available on another.

### 3. Dispatch + Memory Loop
```
User request → Intent recognition → Agent dispatch → Execution → Auto-log → Optimize next dispatch
```
Every dispatch automatically logs the full chain: who requested what on which channel,
which agent was assigned, what the result was, and how long it took.

### 4. 17 Memory Modules
Including: fact extraction, BM25+vector fusion search, contradiction detection,
knowledge graph, forgetting mechanism, active recall, memory feedback, self-review.

## Quick Start

```bash
pip install .

# Write a memory
python -m agent_mem.core.hot_cache write --agent main --channel webchat --text "User prefers concise answers" --importance 7

# Cross-channel query (all channels)
python -m agent_mem.core.hot_cache query --agent main --limit 5

# Dispatch stats
python -m agent_mem.core.dispatch_logger stats

# Run memory engine
python -m agent_mem.core.engine_v2 --mode daily
```

## Requirements
- Python 3.10+
- chromadb (single dependency)
- Zero external API dependencies, fully local

## Links
- GitHub: https://github.com/wenshuangl/agent-mem
- License: MIT
