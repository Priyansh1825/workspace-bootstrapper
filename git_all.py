#!/usr/bin/env python3
"""
Multi-Repo Git Manager for D:\\Projects
"""

import os
import sys
import subprocess

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

def run_git_manager(command="status"):
    print("\n================================================================")
    print("              MULTI-REPO GIT MANAGER (D:\\Projects)              ")
    print("================================================================")
    print(f"Action: git {command} across all sub-projects...\n")

    found_repos = 0
    all_repo_paths = []

    # Discover repos (top-level and 1-level nested)
    for item in sorted(os.listdir(ROOT_DIR)):
        if item.startswith('.') or item == "CampusRoots":
            continue
        item_path = os.path.join(ROOT_DIR, item)
        if os.path.isdir(item_path):
            if os.path.exists(os.path.join(item_path, ".git")):
                all_repo_paths.append((item, item_path))
            else:
                # Check nested children
                for sub in sorted(os.listdir(item_path)):
                    sub_path = os.path.join(item_path, sub)
                    if os.path.isdir(sub_path) and os.path.exists(os.path.join(sub_path, ".git")):
                        all_repo_paths.append((f"{item}/{sub}", sub_path))

    for display_name, repo_path in all_repo_paths:
        found_repos += 1
        print(f"[REPO] {display_name}")
        try:
            if command == "status":
                res = subprocess.run(
                    ["git", "status", "--short"],
                    cwd=repo_path,
                    capture_output=True,
                    text=True,
                    timeout=10
                )
                output = res.stdout.strip()
                if output:
                    print(f"{output}\n")
                else:
                    print("   [Clean] No uncommitted changes\n")
            else:
                res = subprocess.run(
                    ["git"] + command.split(),
                    cwd=repo_path,
                    capture_output=True,
                    text=True,
                    timeout=30
                )
                print(res.stdout or res.stderr or "   [Done]\n")
        except Exception as e:
            print(f"   [Error: {e}]\n")

    print("================================================================")
    print(f"Scanned {found_repos} active Git repositories in D:\\Projects.\n")

if __name__ == "__main__":
    action = " ".join(sys.argv[1:]) if len(sys.argv) > 1 else "status"
    run_git_manager(action)
