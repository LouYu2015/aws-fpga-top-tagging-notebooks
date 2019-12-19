#!/bin/bash

MODEL_PATH="../weights/constantgraph.pb" # Path to frozen graph

decent_q inspect --input_frozen_graph $MODEL_PATH
