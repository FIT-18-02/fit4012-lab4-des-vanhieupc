#!/usr/bin/env bash
set -euo pipefail

PLAINTEXT="0000000100100011010001010110011110001001101010111100110111101111"
KEY="0001001100110100010101110111100110011011101111001101111111110001"
EXPECTED="1000010111101000000100110101010000001111000010101011010000000101"

g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test
OUTPUT=$(printf "1\n%s\n%s\n" "$PLAINTEXT" "$KEY" | ./des_test | tail -n 1)

if [[ "$OUTPUT" != "$EXPECTED" ]]; then
  echo "[FAIL] Unexpected ciphertext output"
  echo "Expected: $EXPECTED"
  echo "Actual:   $OUTPUT"
  rm -f des_test
  exit 1
fi

echo "[PASS] Sample DES program produced the expected ciphertext."
rm -f des_test
