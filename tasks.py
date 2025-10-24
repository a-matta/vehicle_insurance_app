import pathlib
import subprocess
from importlib.metadata import version

from invoke import task

ROOT = pathlib.Path(__file__).parent.resolve().as_posix()
VERSION = version("vehicle_insurance_app")


@task
def clean(context):
    """Clean the root folder. Remove all generated files/directories"""
    cmd = [
        "rm",
        "-rf",
        f"{ROOT}/output",
    ]
    subprocess.run(" ".join(cmd), shell=True, check=False)


@task(pre=[clean])
def tests(context):
    """Run the tests in 'tests' directory."""
    cmd = [
        "robot",
        "-d",
        f"{ROOT}/output/",
        f"{ROOT}/tests",
    ]
    subprocess.run(" ".join(cmd), shell=True, check=True)
