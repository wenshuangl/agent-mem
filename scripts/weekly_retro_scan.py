#!/usr/bin/env python3
"""每周因果链回溯 — 用最新模式重新扫描所有已有节点"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent))
from knowledge_graph import KnowledgeGraph

kg = KnowledgeGraph(Path.home() / '.openclaw/workspace/memory')
before = len(kg.data['chains'])
result = kg.retro_scan()
print(f"📊 因果链回溯: 扫描 {result['scanned']}节点, 链: {before}→{result['new_chains']}条")
