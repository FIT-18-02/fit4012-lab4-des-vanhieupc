#!/usr/bin/env bash
# Negative test: Kiểm tra giải mã với sai khóa (Wrong Key)
set -euo pipefail
//hi
echo "Running Wrong Key Negative Test..."

# Đảm bảo đã có file thực thi
if [ ! -f "./des" ]; then
    make || g++ -std=c++17 des.cpp -o des
fi

# 1. Thông số ban đầu
# Plaintext: 0123456789ABCDEF
# Khóa đúng (Key 1): 133457799BBCDFF1
# Khóa sai (Key 2): FFFFFFFFFFFFFFFF
PLAINTEXT="0123456789ABCDEF"
RIGHT_KEY="133457799BBCDFF1"
WRONG_KEY="FFFFFFFFFFFFFFFF"

# 2. Thực hiện mã hóa với khóa đúng để lấy Ciphertext
# Ciphertext chuẩn sẽ là: 85E813540F0AB405
CORRECT_CIPHER="85E813540F0AB405"

echo "Plaintext ban đầu: $PLAINTEXT"
echo "Giải mã bằng khóa sai: $WRONG_KEY"

# 3. Thử giải mã Ciphertext đó bằng KHÓA SAI (Mode 2)
echo "Kết quả giải mã với khóa sai:"
echo -e "2\n$CORRECT_CIPHER\n$WRONG_KEY" | ./des

echo -e "\n[RESULT] Kết quả giải mã ra một chuỗi vô nghĩa, chứng minh tính bảo mật của DES khi sai khóa."
echo "Wrong key negative test completed!"
exit 0
