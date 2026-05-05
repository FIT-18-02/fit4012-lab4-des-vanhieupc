#!/usr/bin/env bash
set -euo pipefail

# Dữ liệu mong đợi (Chuỗi Hex sau khi mã hóa mẫu 1 block)
EXPECTED="85E813540F0AB405"
//hi
# Biên dịch chương trình des.cpp
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test

# Chạy chương trình với dữ liệu mẫu qua stdin
# Mode 1 (DES Encrypt), Plaintext, Key
OUTPUT=$(echo -e "1\n0123456789ABCDEF\n133457799BBCDFF1" | ./des_test)

# Lấy dòng cuối cùng chứa kết quả Hex
LAST_LINE=$(printf "%s\n" "$OUTPUT" | tail -n 1)

# Kiểm tra kết quả
if [[ "$LAST_LINE" != "$EXPECTED" ]]; then
  echo "[FAIL] Unexpected ciphertext output"
  echo "Expected: $EXPECTED"
  echo "Actual:   $LAST_LINE"
  exit 1
fi

echo "[PASS] Sample DES program produced the expected ciphertext."
rm -f des_test
