Why does `compile_commands.json` from `nix build ` and `nix build .#with-fetch-content.nix` not contain include directories from `nlohman_json`?

The bug is most likely `nix` related because I do get the correct include directories if I run the following

```bash
cmake -B build -G Ninja -S . -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DUSE_FETCH_CONTENT=ON && cmake --build build && ninja -C build -t compdb >build/ninja_compile_commands.json
```

Now the `nlohman_json` is included in both `build/compile_commands.json` as well as `build/ninja_compile_commands.json`
