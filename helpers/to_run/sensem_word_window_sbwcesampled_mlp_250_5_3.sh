#!/usr/bin/env bash
set -e
cd ..

cd ..

python -m thesis.classification \
    ../resources/word_window/sensem/train_dataset.npz \
    ../resources/word_window/sensem/test_dataset.npz \
    ../results/semisupervised/sensem_mlp_word_window_250_sbwcesampled.csv \
    --classifier mlp \
    --layers 250 \
    --word_vectors_model_path ../resources/word_vectors/sbwcesampled.bin.gz \
    --vector_domain sbwcesampled \
    --min_count 2 \
    --corpus_name sensem \
    --representation word_window

python -m thesis.classification \
    ../resources/word_window/sensem/train_dataset.npz \
    ../resources/word_window/sensem/test_dataset.npz \
    ../results/semisupervised/sensem_mlp_word_window_250_sbwcesampled_5_3.csv \
    --classifier mlp \
    --layers 250 \
    --splits 5 \
    --folds 3 \
    --word_vectors_model_path ../resources/word_vectors/sbwcesampled.bin.gz \
    --vector_domain sbwcesampled \
    --min_count 2 \
    --corpus_name sensem \
    --representation word_window
