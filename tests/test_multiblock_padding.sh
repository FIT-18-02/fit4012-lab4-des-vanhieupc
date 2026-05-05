#!/usr/bin/env bash
# Test case kiểm tra tính năng Multi-block và Zero Padding
set -euo pipefail
//hi
echo "Running Multi-block and Padding test..."

# Đảm bảo đã có file thực thi
if [ ! -f "./des" ]; then
    make || g++ -std=c++17 des.cpp -o des
fi

# Dữ liệu thử nghiệm: 20 ký tự Hex (tương đương 80 bit)
# Khối 1: 16 ký tự đầu (64 bit)
# Khối 2: 4 ký tự còn lại -> Cần Zero Padding thêm 12 ký tự '0' để đủ 64 bit
PLAINTEXT="0123456789ABCDEFAABB"
KEY="133457799BBCDFF1"

echo "Input Plaintext: $PLAINTEXT"
echo "Input Key: $KEY"

# Thực thi Mode 1 (DES Encrypt)
echo -e "1\n$PLAINTEXT\n$KEY" | ./des

echo "Multi-block padding test completed!"
exit 0
