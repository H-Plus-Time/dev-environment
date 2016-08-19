#!/usr/bin/env python

from distutils.core import setup

setup(name='dev_environment',
    version='1.0',
    description='Custom dev environment',
    author='Nicholas Roberts',
    author_email='nicholas.roberts.au@gmail.com',
    packages=[],
    requires=[
        "notebook >= 4.1.0",
        "jupyter >= 1.0.0"
    ]
)

