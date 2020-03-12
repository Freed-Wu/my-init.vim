CC := g++
FLAGS := -std=c++11 -w
RM := -rm -rf
INC_DIR := include
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin
INCLUDE := -I./$(INC_DIR)

.PHONY: clean, cleanall

$(BIN_DIR)/main: $(BUILD_DIR)/.o
	@mkdir -p $(BIN_DIR)
	$(CC) $(FLAGS) $(INCLUDE) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c$5
	@mkdir -p $(BUILD_DIR)
	$(CC) $(FLAGS) $(INCLUDE) -c -o $@ $<

clean:
	@$(RM) $(BUILD_DIR)

cleanall:
	@$(RM) $(BUILD_DIR)
	@$(RM) $(BIN_DIR)

