from setuptools import setup, find_packages

"""
Get Parameters
"""
with open("requirements.txt") as f:
    required_dependencies = f.read().splitlines()

setup(
    name="apitools",
    version="0.0.2",
    description="demo project",
    python_requires=">3.5.2",
    author="DW",
    author_email="example@gmail.com",
    url="example.com",
    packages=find_packages(),
    install_requires=required_dependencies
)
