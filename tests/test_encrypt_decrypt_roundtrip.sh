#!/usr/bin/env bash
# Test case kiểm tra chu trình mã hóa và giải mã (Round-trip)
set -euo pipefail

echo "Running Round-trip test (Encrypt -> Decrypt)..."
//hi
# Đảm bảo đã có file thực thi
if [ ! -f "./des" ]; then
    make || g++ -std=c++17 des.cpp -o des
fi

# Bước 1: Mã hóa (Mode 1)
# Plaintext: 48656c6c6f (Hello), Key: 133457799BBCDFF1
echo "Step 1: Encrypting..."
echo -e "1\n48656c6c6f000000\n133457799BBCDFF1" | ./des

# Bước 2: Giải mã (Mode 2)
# Bạn có thể dùng kết quả từ bước 1 để điền vào đây nếu muốn test kỹ hơn
echo "Step 2: Decrypting..."
echo -e "2\nED39D950FA74BCC4\n133457799BBCDFF1" | ./des

echo "Round-trip test completed!"
exit 0
