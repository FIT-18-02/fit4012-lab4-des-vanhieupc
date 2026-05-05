#!/usr/bin/env bash
set -euo pipefail

PLAINTEXT="0001001000110100010101100111100010011010101111001101111011110001"
K1="0001001100110100010101110111100110011011101111001101111111110001"
K2="1111000011001100101010101111010101010110011001111000111100001111"
K3="0000111100001111000011110000111100001111000011110000111100001111"
EXPECTED="0000100111010100110001011011100101000001100001100000010111111010"

g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test
ENC_OUTPUT=$(printf "3\n%s\n%s\n%s\n%s\n" "$PLAINTEXT" "$K1" "$K2" "$K3" | ./des_test | tail -n 1)

if [[ "$ENC_OUTPUT" != "$EXPECTED" ]]; then
  echo "[FAIL] Unexpected TripleDES encrypt output"
  echo "Expected: $EXPECTED"
  echo "Actual:   $ENC_OUTPUT"
  rm -f des_test
  exit 1
fi

DEC_OUTPUT=$(printf "4\n%s\n%s\n%s\n%s\n" "$ENC_OUTPUT" "$K1" "$K2" "$K3" | ./des_test | tail -n 1)

if [[ "$DEC_OUTPUT" != "$PLAINTEXT" ]]; then
  echo "[FAIL] TripleDES decrypt did not recover original plaintext"
  echo "Expected: $PLAINTEXT"
  echo "Actual:   $DEC_OUTPUT"
  rm -f des_test
  exit 1
fi

echo "[PASS] TripleDES encrypt/decrypt round-trip is correct."
rm -f des_test
