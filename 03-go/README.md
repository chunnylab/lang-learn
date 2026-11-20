# Phase 3: Minimal Go for Infra Tools

Go powers Docker, Kubernetes, Terraform, and Prometheus. The goal here is not backend architecture, but writing clean small CLIs and reading Cloud Native code without guessing.

## Lesson Order (Weeks 8 to 10)

Concurrency and pointers are introduced only after the basics feel comfortable:

1. **`01_basics/`**: packages, variables, types, `if`, `for`, multiple return values, and the `if err != nil` pattern.
2. **`02_data/`**: `slice`, `map`, `struct`, and decoding JSON with `encoding/json`.
3. **`03_pointers_plain/`**: one short, concrete example of passing by value (`val`) vs pointer (`*val`) and avoiding nil pointer panics.
4. **`04_cli_http/`**: `flag`, `os.Getenv`, and `net/http` client calls with explicit timeouts.
5. **`05_project_healthcheck/` (Capstone)**:
   - Step A: build a sequential URL health checker compiled to a single binary (`go build`).
   - Step B: upgrade the same tool with `goroutine` and `sync.WaitGroup` so you can see the speed difference directly.
