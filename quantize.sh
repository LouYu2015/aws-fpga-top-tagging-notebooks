#!/bin/bash

MODEL_PATH="../weights/constantgraph.pb" # Path to frozen graph
INPUT="Placeholder" # Name of input node in the graph
OUTPUT="classifier/model_1/classifier_output/Softmax" # Name of output node in the graph
SHAPE="?,224,224,3" # Shape of input node
RESULT_PATH="../quantized_model" # Path to result
CALIBRATION_INPUT_FUNCTION="calibration.read_image" # A function that can read the image
METHOD="1" # 0: non-overflow method. Makes sure no values are saturated during quantization; might get worse results in case of outliers; 1: min-diffs method. Allows saturation for quantization to get lower quantization difference; higher endurance to outliers. Usually ends with narrower ranges than non-overflow method.
NUM_ITERATION="100" # Number of iterations to run calibration

decent_q quantize --input_frozen_graph $MODEL_PATH --input_nodes $INPUT --output_nodes $OUTPUT --input_shapes $SHAPE --output_dir $RESULT_PATH --input_fn $CALIBRATION_INPUT_FUNCTION --method $METHOD --calib_iter $NUM_ITERATION
