CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -pedantic
TARGET := des
SRC := des.cpp

.PHONY: all clean run test

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

# Sửa lại phần test để chạy toàn bộ các bài kiểm tra trong thư mục tests
test: $(TARGET)
	@for file in tests/*.sh; do \
		echo "Running $$file..."; \
		bash $$file; \
	done

clean:
	rm -f $(TARGET)
	rm -rf build logs/*.log
// hi
