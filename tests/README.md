# Test Files for nkf Fish Completion

This directory contains test files for testing the nkf command with different encodings.

## Test Files

- `utf8.txt` - UTF-8 encoded file with Japanese text
- `shift_jis.txt` - Shift_JIS encoded file
- `euc_jp.txt` - EUC-JP encoded file
- `iso_2022_jp.txt` - ISO-2022-JP (JIS) encoded file
- `mixed.txt` - Mixed content file for various nkf features

## Usage Examples

Test the completion by trying these commands in fish shell:

```fish
# Source the completion
source ../completions/nkf.fish

# Test basic conversions
nkf -j utf8.txt
nkf -s utf8.txt
nkf -e utf8.txt
nkf -w shift_jis.txt

# Test with long options
nkf --ic=UTF-8 --oc=Shift_JIS utf8.txt
nkf --ic=Shift_JIS --oc=UTF-8 shift_jis.txt

# Test MIME features
nkf -mB mixed.txt
nkf -MB mixed.txt

# Test folding
nkf -f60 mixed.txt
nkf -F mixed.txt

# Test line ending conversion
nkf -Lu mixed.txt
nkf -Lw mixed.txt

# Test encoding detection
nkf -g shift_jis.txt
nkf -g euc_jp.txt
```

## Completion Testing

To test the completion features:

1. Type `nkf -` and press TAB to see all short options
2. Type `nkf --` and press TAB to see all long options
3. Type `nkf --ic=` and press TAB to see encoding options
4. Type `nkf --oc=` and press TAB to see encoding options
5. Type `nkf -O ` and press TAB to see file completion