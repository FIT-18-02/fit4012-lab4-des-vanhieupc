#!/usr/bin/env bash
# Test case cho trường hợp DES mẫu
set -euo pipefail
//hi
echo "Running DES sample test..."

# Kiểm tra xem file thực thi des đã tồn tại chưa, nếu chưa thì biên dịch
if [ ! -f "./des" ]; then
    make || g++ -std=c++17 des.cpp -o des
fi

# Chạy test với dữ liệu mẫu (Mode 1: Encrypt)
# Input: 1 (Mode), Plaintext (Hex), Key (Hex)
echo -e "1\n0123456789ABCDEF\n133457799BBCDFF1" | ./des

echo "DES sample test completed successfully!"
exit 0
