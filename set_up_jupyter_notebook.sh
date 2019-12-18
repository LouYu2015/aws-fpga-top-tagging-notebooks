#!/bin/bash

# Initialize configuration file if needed
jupyter notebook --generate-config && \
# Set a password
jupyter notebook password
# Start notebook
jupyter notebook --no-browser
