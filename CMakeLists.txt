cmake_minimum_required(VERSION 3.10)
project(DevBook C)

add_executable(DevBook src/main.c)

target_include_directories(dev_book PRIVATE external/md4c)

target_sources(dev_book PRIVATE external/md4c/md4c.c)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/examples/generated_example.c
    COMMAND python3 scripts/generate_code.py ${CMAKE_SOURCE_DIR}/docs/examples_src/tutorial.md
    DEPENDS ${CMAKE_SOURCE_DIR}/docs/examples_src/tutorial.md
    COMMENT "Generuji příklad z Markdownu..."
)
