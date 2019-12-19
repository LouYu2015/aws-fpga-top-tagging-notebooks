#!/bin/bash

freeze_graph --input_graph="../weights/constantgraph.pb" --input_meta_graph="../weights/resnet50_bw.meta" --input_binary=true --output_graph="../weights/frozen.pb" --output_node_names="classifier/model_1/classifier_output/Softmax"
