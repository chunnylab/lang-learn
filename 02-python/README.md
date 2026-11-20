# Phase 2: Python for Cloud and DevOps

A focused Python track for infrastructure work and technical interviews. Heavy OOP patterns and web frameworks are left out so you get fluent in the parts used every day.

## Lesson Order (Weeks 3 to 7)

Split into small steps so no single file dumps too many concepts at once:

1. **`01_variables_flow.py`**: variables, f-strings, `if/elif/else`, `for`/`while`, and `None`.
2. **`02_collections.py`**: `list`, `dict`, and `set`, with extra practice on nested `dict` structures (the shape of JSON and AWS responses).
3. **`03_functions_errors.py`**: `def`, return values, `try/except`, `raise`, and the `logging` module instead of bare `print`.
4. **`04_files_json_yaml.py`**: `pathlib`, reading and writing files, `json`, `yaml`, and `csv`.
5. **`05_shell_and_http.py`**: running Linux commands safely with `subprocess.run`, reading `os.environ`, and calling HTTP APIs with timeouts.
6. **`06_cli_and_tests/`**: `venv`, `argparse` for CLI flags, and writing small unit tests with `pytest`.
7. **`07_aws_boto3/`**: read-only AWS scripts using `boto3` (caller identity, listing running EC2 instances, checking S3 buckets) so nothing creates cost or modifies production.
8. **`08_project/` (Capstone)**: a small CLI tool that audits cloud resources or service endpoints, backed by `pytest` tests.
