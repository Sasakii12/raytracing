# Define the compiler to use
CXX = clang++

# Define compile-time flags (Warnings, Optimization, C++ Standard)
CXXFLAGS = -Wall -Wextra -O2 -std=c++20

# Define the final executable name
TARGET = raytracing

# Automatically find all .cpp files in the directory
SRCS = $(wildcard *.cpp)

# Generate a list of corresponding .o (object) files
OBJS = $(SRCS:.cpp=.o)

# The default target that runs when you just type 'make'
all: $(TARGET)

# Rule to link the final executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Pattern rule to compile .cpp source files into .o object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Phony target to clean up build files
.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)

