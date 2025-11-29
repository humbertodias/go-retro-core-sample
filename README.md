# Hello World Libretro Core (Go)

A simple "Hello World" libretro core written in Go. This core demonstrates how to create a basic libretro-compatible core using Go and CGO.

## Features

- Displays "HELLO WORLD" text on a colorful animated gradient background
- Runs at 60 FPS with 320x240 resolution
- Implements the complete libretro API
- Cross-platform (Linux, macOS, Windows)

## Requirements

- Go 1.25 or later
- GCC or compatible C compiler (for CGO)
- Make (optional, for using the Makefile)

## Building

### Using Make

```bash
make build
```

### Manual Build

```bash
CGO_ENABLED=1 go build -buildmode=c-shared -o helloworld_libretro.so .
```

On macOS, the output will be `helloworld_libretro.dylib`, and on Windows, it will be `helloworld_libretro.dll`.

## Usage

### Via RetroArch GUI

1. Build the core as described above
2. Copy the resulting `.so`/`.dylib`/`.dll` file to your RetroArch cores directory:
   - Linux: `~/.config/retroarch/cores/`
   - macOS: `~/Library/Application Support/RetroArch/cores/`
   - Windows: `%APPDATA%\RetroArch\cores\`
3. Launch RetroArch and select the "Hello World Go" core
4. No ROM is required - just "Start Core" to see the Hello World display

### Via Command Line

```bash
# Linux
retroarch -L helloworld_libretro.so

# macOS
/Applications/RetroArch.app/Contents/MacOS/RetroArch -L helloworld_libretro.dylib

# Windows
retroarch.exe -L helloworld_libretro.dll
```

No content/ROM file is needed as this core supports running without content.

<img width="1072" height="860" alt="Screenshot 2025-11-28 at 11 57 48 PM" src="https://github.com/user-attachments/assets/1edd9ea2-667d-407e-b5c2-5dfbd701a78a" />


## Technical Details

The core implements all required libretro API functions:

- `retro_api_version()` - Returns API version 1
- `retro_init()` / `retro_deinit()` - Core initialization/cleanup
- `retro_get_system_info()` - Returns core name and version
- `retro_get_system_av_info()` - Returns video (320x240@60fps) and audio settings
- `retro_run()` - Main loop that renders each frame
- `retro_load_game()` / `retro_unload_game()` - Game loading (accepts any input)
- And other required callbacks for input, serialization, memory, etc.

## License

This project is provided as a sample/demo implementation for educational purposes.

## Author

Created as a demonstration of libretro core development in Go.
