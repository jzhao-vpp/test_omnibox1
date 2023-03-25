# Data & Analytics Project Template

This is a repository that can be used as a template for Data & Analytics projects at VPP. Depending on project specifics, directories or files could still need to be added, removed, or changed. To create a repository using this as a template, you can use the green `Use this template` button on the repository's UI. Detailed directions are [here](https://docs.github.com/en/repositories/creating-a-repository-from-a-template).

## Setup

### Pre-commit Checks

We have two pre-commit checks that happen when you try to run `git commit`. These are:
- [`black`](https://black.readthedocs.io/en/stable/): This is an opinionated python code formatter. 
- [`flake8`](https://flake8.pycqa.org/en/latest/): This is a python code linter.
- [`sqlfluff`](https://docs.sqlfluff.com/en/stable/index.html): This a SQL linter.

Together, these two tools should help us write consistent, well-formatted code across all of our projects. Before doing so however, you need to install `pre-commit` and then install the pre-commit hooks,

```
pip install pre-commit
pre-commit install
```

After doing so, when you try to commit code, the code will be autoformatted and linted. If there are issues, then your commit will be rejected locally. You'll need to fix the given errors, add the changes (`git add`), and _then_ run `git commit`.

#### Tips
- You can skip running the pre-commit hooks if you append `--no-verify` to your commit command (e.g., `git commit -m "changes stuff" --no-verify`). Generally, we should do this, and instead we should modify the rules that we're checking in one of the ways described below.
- If there are specific rules that you want to globally ignore, then they can be added to the `.flake8` file. A common one we might want to ignore is the PEP8 rule E231, which suggests that line lengths shouldn't be more than 79 characters. This was a rule created before the advent of larger, higher-resolution screens, so it isn't necessarily useful anymore.
- You can specify certain files to ignore as well. This is also in `.flake8`. `__init__.py` files are ignored in the template by default. 