# Makefile

CC=gcc
CFLAGS=-Wall -Werror
TEST_CFLAGS=-Wall -Werror -g
SRC_DIR=src
TEST_DIR=tests

# Cibles de compilation
TARGET=app
SOURCES=$(SRC_DIR)/main.c
OBJECTS=$(SOURCES:.c=.o)

# Cibles pour les tests
TEST_TARGET=test_app
TEST_SOURCES=$(TEST_DIR)/test.c
TEST_OBJECTS=$(TEST_SOURCES:.c=.o)

# Règles de compilation
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) -o $(TARGET) $(OBJECTS)

$(OBJECTS): $(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c $(CFLAGS) $< -o $@

# Règles de tests
$(TEST_TARGET): $(TEST_OBJECTS) $(OBJECTS)
	$(CC) -o $(TEST_TARGET) $(TEST_OBJECTS) $(OBJECTS) -lCUnit

$(TEST_OBJECTS): $(TEST_DIR)/%.o: $(TEST_DIR)/%.c
	$(CC) -c $(TEST_CFLAGS) $< -o $@

# Cible pour exécuter les tests
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Nettoyage des fichiers générés
clean:
	rm -f $(TARGET) $(TEST_TARGET) $(OBJECTS) $(TEST_OBJECTS)

