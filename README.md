# lang-learn

A practical, minimal programming curriculum for Cloud, DevOps, and SysAdmin roles.

This repository brings together my existing Bash exercises (`bash-script-learning` and `bash-practice`) and builds a step-by-step path into Production Bash, Python, Go, and core Ops concepts. Every lesson stays short, runnable, and tied to real infrastructure tasks instead of textbook algorithms.

## Language Scope: What to Learn and What to Skip

| Language | Target Level | Why for Cloud / DevOps / SysAdmin |
| :--- | :--- | :--- |
| **Bash** | ✅ Write comfortably | Daily tool on Linux servers, CI/CD pipelines, and quick troubleshooting |
| **Python** | ✅ Write comfortably (primary) | Standard for automation, AWS (`boto3`), HTTP APIs, Lambda, and technical interviews |
| **Go** | ✅ Write small CLIs and read code | Core language of Docker, Kubernetes, and Terraform; small syntax and single-binary deploys |
| **SQL / YAML / JSON / Regex** | ✅ Use comfortably | Shows up daily in logs, configs, databases, and Infrastructure as Code |
| **JS / TypeScript / Java** | ⚠️ Read and make small edits | Existing concepts are enough to read stack traces, tune JVM memory, or edit Cloudflare Workers |
| **Rust** | ❌ Skip for now (use AI when needed) | Steep learning curve (ownership, borrow checker) and rarely required for junior-to-mid Ops roles |
| **C / C++** | ❌ Do not learn to write from scratch | Ops work does not require writing kernels or drivers; focus on Linux OS concepts instead |

### Why Rust and C/C++ Are Out of Scope

Rust is built for low-level systems with strict memory control. Learning it well takes far more time than getting productive in Python or Go, and hiring pipelines for Cloud, DevOps, and SysAdmin roles almost never test Rust. If a task ever needs a Rust tool, using AI with tests is enough.

For C and C++, the useful part for Ops is not writing C syntax. It is understanding how Linux runs programs: processes, signals, exit codes, file descriptors, Out of Memory (OOM) kills, and building from source when a package is missing. Those topics live in Phase 4.

---

## Core Mental Model: 7 Building Blocks Across Languages

Most scripting and automation languages share the same 7 parts. Mapping Python and Go back to Bash makes the transition faster.

| Concept | Bash | Python | Go |
| :--- | :--- | :--- | :--- |
| Variable | `name="web"` | `name = "web"` | `name := "web"` |
| Condition | `if [ "$a" -eq 1 ]; then` | `if a == 1:` | `if a == 1 {` |
| Loop | `for x in "${arr[@]}"; do` | `for x in arr:` | `for _, x := range arr {` |
| Function | `check() { ... }` | `def check():` | `func check() error {` |
| Data | Array `("a" "b")` | `list`, `dict`, `set` | `slice`, `map`, `struct` |
| Error handling | `set -e`, `$?` | `try / except` | `if err != nil` |
| Execution | Shell interpreter | Python runtime | Single compiled binary |

Rule of thumb on the job:
- Short Linux glue and shell pipes (under ~50 lines): **Bash**
- JSON/YAML parsing, API calls, AWS/Cloudflare automation, CI scripts: **Python**
- Standalone CLI tools that run on any server with no runtime dependencies, or concurrent checks: **Go**

---

## Repository Layout and 4-Phase Roadmap (10 to 12 Weeks)

Paced for roughly 1 hour per day. Each phase ends with one small working tool.

```text
lang-learn/
├── README.md                  # Master plan (this file)
├── 01-bash/
│   ├── README.md              # Phase 1 plan and imported lab index
│   ├── basics/                # Imported from bash-script-learning (01 to 08)
│   ├── labs/                  # Imported from bash-practice (awk, lab-01 to lab-04)
│   └── ops/                   # Phase 1: Production Bash lessons
├── 02-python/                 # Phase 2: Python for Cloud and DevOps
├── 03-go/                     # Phase 3: Minimal Go for Infra CLIs
└── 04-ops-concepts/           # Phase 4: SQL, Linux OS concepts, AI code review
```

### Phase 1: Production Bash (`01-bash/`, Weeks 1 to 2)

Bridge from basic scripts to safe server automation:
- Finish the open TODO (`report_error_urls`) in `01-bash/labs/lab-04-logs/analyze.sh`
- Strict mode, quoting, exit codes, and `trap` cleanup
- Log filtering with `grep`, `awk`, `sed`, `sort`, `uniq`
- HTTP and JSON in the terminal with `curl` and `jq`
- Capstone: a server health-check script (disk + HTTP endpoint) ready to run under `cron` or `systemd`

### Phase 2: Python for Cloud and DevOps (`02-python/`, Weeks 3 to 7)

Split into small steps so each file introduces only a few ideas:
- Variables, strings, control flow, and `None`
- `list`, `dict`, and `set` (focusing on `dict` for JSON and cloud APIs)
- Functions, `try/except`, and `logging`
- Files, `pathlib`, `json`, `yaml`, `csv`
- Running shell commands (`subprocess`), environment variables, and HTTP requests
- CLI arguments (`argparse`), `venv`, and basic `pytest`
- Read-only AWS automation with `boto3` (STS identity, EC2, S3)
- Capstone: a small CLI that checks running/idle cloud resources, with unit tests

### Phase 3: Minimal Go for Infra Tools (`03-go/`, Weeks 8 to 10)

Enough Go to write small CLIs and read Cloud Native codebases without getting lost:
- Variables, types, loops, functions, and `if err != nil`
- `slice`, `map`, `struct`, and JSON decoding
- Plain pointers (value vs `*pointer` in one concrete example)
- CLI flags (`flag`), `os.Getenv`, and `net/http` with timeouts
- Capstone: a single-binary URL health checker, built sequentially first and then upgraded with `goroutine` and `sync.WaitGroup`

### Phase 4: Ops and Interview Essentials (`04-ops-concepts/`, Weeks 11 to 12)

Hands-on drills for troubleshooting and code review:
- SQL basics on SQLite/PostgreSQL (`SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `EXPLAIN`, dump/restore)
- Linux OS concepts (`SIGTERM` vs `SIGKILL`, exit codes, OOM killer, file descriptors, listening sockets)
- Reviewing AI-generated code (spotting hardcoded secrets, command injection, swallowed errors, missing timeouts)

---

## Study Rules

1. **Write before asking AI**: Try each exercise yourself until it runs or you hit a real blocker, then ask AI to explain the specific gap.
2. **Explain your code out loud**: After finishing a script, walk through what each block does and how it fails. This mirrors technical interviews.
3. **Read your own production repos**: After Phase 2, read through your existing projects (such as `chunnylab-music-studio` and `a440`) without AI assistance to confirm you follow the code.
