# create_hf_dataset_script.py
import argparse
import os
from huggingface_hub import HfApi, Repository, login

# Arguments
parser = argparse.ArgumentParser()
parser.add_argument("--dataset", required=True, help="Dataset name")
parser.add_argument("--username", required=True, help="Hugging Face username")
parser.add_argument("--token_path", required=True, help="Path to HF token text file")
args = parser.parse_args()

# Read token
with open(args.token_path, "r") as f:
    hf_token = f.read().strip()

# Login programmatically
login(token=hf_token)

# Create repo
api = HfApi()
full_repo_name = f"{args.username}/{args.dataset}"
api.create_repo(repo_id=full_repo_name, repo_type="dataset", exist_ok=True)

# Clone it locally
local_dir = f"./{args.dataset}"
repo = Repository(local_dir=local_dir, clone_from=full_repo_name, repo_type="dataset")

# Create directories
folders = ["raw", "train", "test", "valid", "references"]
for folder in folders:
    os.makedirs(folder, exist_ok=True)
    with open(os.path.join(folder, ".gitkeep"), "w") as f:
        pass


# Optional README
readme_path = os.path.join(local_dir, "README.md")
if not os.path.exists(readme_path):
    with open(readme_path, "w") as f:
        f.write(f"# {args.dataset}\n\nDataset structure:\n\n" + "\n".join([f"- `{f}/`" for f in folders]))

# Commit & push
repo.git_add()
repo.git_commit("Initial commit with dataset folder structure")
repo.git_push()
