#!/usr/bin/env bash
set -euo pipefail
//hi
# Di chuyển ra thư mục gốc để biên dịch nếu cần, hoặc dùng đường dẫn trực tiếp
# Biên dịch des.cpp và tạo file thực thi 'des'
g++ -std=c++17 -Wall -Wextra -pedantic ../des.cpp -o des

# Chạy file thực thi
./des
