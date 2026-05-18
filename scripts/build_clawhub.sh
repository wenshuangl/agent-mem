#!/bin/bash
# 构建 ClawHub 上传包
# 用法: bash scripts/build_clawhub.sh

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT_DIR="/tmp/agent-mem-clawhub-upload"

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# 核心文件
cp "$PROJECT_DIR/SKILL.md" "$OUTPUT_DIR/"
cp "$PROJECT_DIR/README.md" "$OUTPUT_DIR/"
cp "$PROJECT_DIR/README.zh.md" "$OUTPUT_DIR/"
cp "$PROJECT_DIR/INTRO.md" "$OUTPUT_DIR/"
cp "$PROJECT_DIR/setup.py" "$OUTPUT_DIR/"
cp "$PROJECT_DIR/requirements.txt" "$OUTPUT_DIR/"

# 源码
cp "$PROJECT_DIR/agent_mem/core/"*.py "$OUTPUT_DIR/"
cp "$PROJECT_DIR/agent_mem/memory/"*.py "$OUTPUT_DIR/"
cp "$PROJECT_DIR/examples/quick_start.py" "$OUTPUT_DIR/"

echo "✅ 构建完成: $OUTPUT_DIR"
echo "共 $(ls "$OUTPUT_DIR" | wc -l) 个文件"
echo "拖到 ClawHub 上传即可"
