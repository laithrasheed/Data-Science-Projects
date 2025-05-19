import argparse
import os
import shutil
from huggingface_hub import HfApi, Repository, login

# Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument("--dataset", required=True, help="Dataset name on HF")
parser.add_argument("--username", required=True, help="HF username")
parser.add_argument("--token_path", required=True, help="Path to HF token file")
parser.add_argument("--data_path", required=True, help="Path to local folder with MP4 files")
args = parser.parse_args()

# Read token and login
with open(args.token_path, "r") as f:
    hf_token = f.read().strip()
login(token=hf_token)

# Prepare repo
api = HfApi()
full_repo_name = f"{args.username}/{args.dataset}"
local_repo_path = f"./{args.dataset}"
repo = Repository(local_dir=local_repo_path, clone_from=full_repo_name, repo_type="dataset")

# Destination: raw folder in repo
raw_repo_path = os.path.join(local_repo_path, "raw")
os.makedirs(raw_repo_path, exist_ok=True)

# Recursively find and copy .mp4 files
for root, dirs, files in os.walk(args.data_path):
    for file in files:
        if file.lower().endswith(".mp4"):
            source_path = os.path.join(root, file)
            dest_path = os.path.join(raw_repo_path, file)
            shutil.copy2(source_path, dest_path)
            print(f"Copied: {source_path} -> {dest_path}")

# Commit and push
repo.git_add()
repo.git_commit("Upload MP4 files to raw folder")
repo.git_push()
print("All .mp4 files uploaded successfully.")
