# Django Project with Pre-commit Hooks

This project uses `pre-commit` hooks to enforce code quality and consistency. The configured hooks include `black`, `pyupgrade`, `flake8`, `reorder-python-imports`, `setup-cfg-fmt`, and `mypy`.

## Pre-commit Hooks

- **black**: A code formatter that enforces style consistency.
- **pyupgrade**: A tool that upgrades syntax for newer versions of Python.
- **flake8**: A tool for checking the style and quality of Python code.
- **reorder-python-imports**: Automatically sorts and organizes Python imports.
- **setup-cfg-fmt**: Formats the `setup.cfg` file.
- **mypy**: A static type checker for Python.

## Conditional Hooks

The `black` and `pyupgrade` hooks are configured to run conditionally based on an environment variable `RUN_TOOLS`.

## Installation

1. **Clone the repository**:

   git clone <your-repo-url>
   cd <your-repo-directory>
   

2. **Install pre-commit**:

   pip install pre-commit

3. **Install the pre-commit hooks**:

   pre-commit install

4. **Make the custom script executable**:

   chmod +x run_tools.sh
   

## Usage

### Running All Hooks

The following hooks will run automatically on commit:

- `flake8`
- `reorder-python-imports`
- `setup-cfg-fmt`
- `mypy`

### Conditional Hooks

To run the `black` and `pyupgrade` hooks, set the environment variable `RUN_TOOLS` to `true`:

export RUN_TOOLS=true
git add .
git commit -m "My commit message"

If the `RUN_TOOLS` environment variable is not set or is set to any value other than `true`, the `black` and `pyupgrade` hooks will be skipped.

## Configuration

### `.pre-commit-config.yaml`

This is the configuration file for pre-commit hooks:

repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.1.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

  - repo: https://github.com/pycqa/flake8
    rev: 6.0.0
    hooks:
      - id: flake8

  - repo: https://github.com/asottile/reorder_python_imports
    rev: v2.8.0
    hooks:
      - id: reorder-python-imports

  - repo: https://github.com/cobrateam/setup-cfg-fmt
    rev: v1.20.0
    hooks:
      - id: setup-cfg-fmt

  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v0.812
    hooks:
      - id: mypy

  - repo: local
    hooks:
      - id: run-tools
        name: Run black and pyupgrade
        entry: ./run_tools.sh
        language: script
        types: [python]
        files: .*


### `run_tools.sh`

This is the custom script to conditionally run `black` and `pyupgrade`:

#!/bin/bash

if [[ "$RUN_TOOLS" == "true" ]]; then
    echo "Running black and pyupgrade..."
    black "$@"
    pyupgrade "$@"
else
    echo "Skipping black and pyupgrade..."
    exit 0
fi


## Troubleshooting

If you encounter issues with the pre-commit hooks, you can check the log file located at:


~/.cache/pre-commit/pre-commit.log


For further assistance, consult the documentation of each tool:

- [pre-commit](https://pre-commit.com/)
- [black](https://black.readthedocs.io/en/stable/)
- [pyupgrade](https://github.com/asottile/pyupgrade)
- [flake8](https://flake8.pycqa.org/en/latest/)
- [reorder-python-imports](https://github.com/asottile/reorder_python_imports)
- [setup-cfg-fmt](https://github.com/cobrateam/setup-cfg-fmt)
- [mypy](http://mypy-lang.org/)



By following the instructions in this README, you will be able to set up and use pre-commit hooks effectively to maintain code quality and consistency in your Django project.


