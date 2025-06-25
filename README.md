# nkf.fish

Fish shell completion for nkf (Network Kanji Filter) command.

## Overview

This project provides comprehensive tab completion for the `nkf` command in Fish shell. The `nkf` command is a popular tool for converting text encodings, particularly for Japanese text processing.

## Features

- Complete option coverage for all nkf flags and parameters
- Smart encoding suggestions for `--ic` and `--oc` options
- File completion support
- Descriptive help text for each option
- Support for complex options with parameters (e.g., `-w16B`, `-f60`)
- MIME encode/decode option completions
- Line ending conversion options

## Installation

### Using Fisher (Recommended)

```fish
fisher install mimikun/nkf.fish
```

### Manual Installation

1. Clone this repository:
```bash
git clone https://github.com/mimikun/nkf.fish.git
```

2. Copy the completion file to your Fish completions directory:
```fish
cp nkf.fish/completions/nkf.fish ~/.config/fish/completions/
```

3. Reload Fish shell or source the completion:
```fish
source ~/.config/fish/completions/nkf.fish
```

## Usage

After installation, you can use tab completion with the `nkf` command:

### Basic Examples

```fish
# Convert UTF-8 to Shift_JIS
nkf -s input.txt > output.txt

# Convert with long options (use TAB after --ic= and --oc=)
nkf --ic=UTF-8 --oc=Shift_JIS input.txt

# Guess input encoding
nkf -g input.txt

# Convert with line ending normalization
nkf -w -Lu input.txt
```

### Tab Completion Examples

- Type `nkf -` and press **TAB** to see all short options
- Type `nkf --` and press **TAB** to see all long options  
- Type `nkf --ic=` and press **TAB** to see encoding options
- Type `nkf --oc=` and press **TAB** to see encoding options
- Type `nkf -O ` and press **TAB** to complete output filenames

### Supported Encodings

The completion includes suggestions for these common encodings:
- UTF-8, UTF-16, UTF-16BE, UTF-16LE
- UTF-32, UTF-32BE, UTF-32LE  
- Shift_JIS, EUC-JP, ISO-2022-JP
- ISO-8859-1, ASCII

## Testing

### Prerequisites

Make sure you have `nkf` installed on your system:

```bash
# On Ubuntu/Debian
sudo apt install nkf

# On macOS with Homebrew
brew install nkf

# On Arch Linux
sudo pacman -S nkf
```

### Running Tests

1. Navigate to the project directory:
```fish
cd nkf.fish
```

2. Source the completion file:
```fish
source completions/nkf.fish
```

3. Test with the provided test files:
```fish
# Test basic conversion
nkf -j tests/utf8.txt

# Test encoding detection
nkf -g tests/shift_jis.txt

# Test MIME operations
nkf -mB tests/mixed.txt

# Test folding
nkf -f60 tests/mixed.txt
```

4. Test tab completion:
- `nkf -<TAB>` - Should show all short options with descriptions
- `nkf --<TAB>` - Should show all long options
- `nkf --ic=<TAB>` - Should show encoding suggestions
- `nkf -O <TAB>` - Should show file completions

### Test Files

The `tests/` directory contains various encoded files for testing:

- `utf8.txt` - UTF-8 encoded Japanese text
- `shift_jis.txt` - Shift_JIS encoded text
- `euc_jp.txt` - EUC-JP encoded text  
- `iso_2022_jp.txt` - ISO-2022-JP encoded text
- `mixed.txt` - Mixed content for testing various features

See `tests/README.md` for detailed testing instructions.

## Supported nkf Options

### Encoding Options
- **Input**: `-J`, `-S`, `-E`, `-W` (with variants like `-W16B`, `-W32L`)
- **Output**: `-j`, `-s`, `-e`, `-w` (with variants like `-w16`, `-w32B`)

### Text Processing
- **MIME**: `-m[BQSN0]`, `-M[BQ]` 
- **Folding**: `-f[N]`, `-F`
- **Conversion**: `-Z[0-4]`, `-X`, `-x`
- **Line endings**: `-Lu`, `-Lw`, `-Lm`

### Long Options
- `--ic=ENCODING`, `--oc=ENCODING`
- `--hiragana`, `--katakana`, `--katakana-hiragana`
- `--in-place`, `--overwrite`
- `--guess`, `--version`, `--help`

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Related Projects

- [nkf](https://osdn.net/projects/nkf/) - The original nkf command
- [Fish shell](https://fishshell.com/) - The friendly interactive shell