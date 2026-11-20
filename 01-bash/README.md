# Phase 1: Production Bash

This folder combines earlier Bash foundations and hands-on labs, then builds the habits needed for scripts that run on real Linux servers and CI pipelines.

## Imported Work

### `basics/` (from `bash-script-learning`)
Eight beginner lessons covering variables, input, conditions (`04-1_condition.sh`), loops, functions, arrays, and a backup script (`08_backup.sh`).

### `labs/` (from `bash-practice`)
Self-built practice labs:
- `fundamental/awk/`: intro `awk` exercises
- `lab-01-basic-create-remove-files/`: basic file creation and cleanup
- `lab-02-create-files-with-detail/`: creating files with generated content
- `lab-03-pipeline/`: create, run, and delete pipeline with configurable `sleep` delays
- `lab-04-logs/`: access log generator and `awk` analyzer (open TODO: `report_error_urls` in `analyze.sh`)

Note: `nightmare-code/` from `bash-practice` was intentionally excluded because it is an AI-generated case study, not hand-written lab work.

## Next Steps in `ops/` (Weeks 1 to 2)

Each script focuses on one habit at a time:

1. **Finish `labs/lab-04-logs/analyze.sh`**: complete `report_error_urls` (filter status `>= 400`, count by URL, print top N).
2. **`01_safe_scripts.sh`**: `set -euo pipefail`, safe quoting, explicit exit codes, and `trap` for cleaning up temp files.
3. **`02_text_pipes.sh`**: practical `grep`, `awk`, `sed`, `sort`, and `uniq` pipelines on log files.
4. **`03_http_json.sh`**: checking HTTP endpoints with `curl -fsS` and extracting fields with `jq`.
5. **`04_healthcheck.sh` (Capstone)**: check disk usage and an HTTP service, return clear exit codes (`0` ok, `1` alert), with a short note on scheduling via `cron` or `systemd`.
