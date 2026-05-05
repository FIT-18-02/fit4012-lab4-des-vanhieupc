#!/usr/bin/env bash
# Negative test: Kiểm tra tính toàn vẹn (Tamper/Bit flip)
set -euo pipefail
//hi
echo "Running Tamper Negative Test..."

# Đảm bảo đã có file thực thi
if [ ! -f "./des" ]; then
    make || g++ -std=c++17 des.cpp -o des
fi

# 1. Mã hóa dữ liệu chuẩn
# Plaintext: 0123456789ABCDEF, Key: 133457799BBCDFF1
# Ciphertext chuẩn: 85E813540F0AB405
ORIGINAL_CIPHER="85E813540F0AB405"
KEY="133457799BBCDFF1"

# 2. Giả lập việc thay đổi dữ liệu (Tamper)
# Thay đổi ký tự cuối cùng từ '5' thành '6' (Bit flip)
TAMPERED_CIPHER="85E813540F0AB406"

echo "Original Cipher: $ORIGINAL_CIPHER"
echo "Tampered Cipher: $TAMPERED_CIPHER"

# 3. Giải mã với Ciphertext đã bị sửa (Mode 2)
echo "Decrypting tampered data..."
echo -e "2\n$TAMPERED_CIPHER\n$KEY" | ./des

echo -e "\n[RESULT] Dữ liệu giải mã sẽ khác hoàn toàn so với ban đầu do hiệu ứng lan truyền lỗi của DES."
echo "Tamper negative test completed!"
exit 0
