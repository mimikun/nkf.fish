# nkf Fish Completion Implementation Plan

## Overview
This document outlines the implementation plan for creating a comprehensive fish shell completion for the nkf (Network Kanji Filter) command.

## nkf Command Analysis

### Basic Usage Pattern
```
nkf -[flags] [--] [in file] .. [out file for -O flag]
```

### Option Categories

#### 1. Output Encoding Options
- `-j`: ISO-2022-JP
- `-s`: Shift_JIS
- `-e`: EUC-JP
- `-w[8[0],{16,32}[{B,L}[0]]]`: UTF options

#### 2. Input Encoding Options
- `-J`: ISO-2022-JP
- `-S`: Shift_JIS
- `-E`: EUC-JP
- `-W[8,[16,32][B,L]]`: UTF options

#### 3. MIME Options
- `-m[BQSN0]`: MIME decode
  - `B`: base64
  - `Q`: quoted
  - `S`: strict
  - `N`: nonstrict
  - `0`: no decode
- `-M[BQ]`: MIME encode
  - `B`: base64
  - `Q`: quoted

#### 4. Text Processing Options
- `-f[60]` or `-f60-10`: Folding with optional margin
- `-F`: Folding that preserves newlines
- `-Z[0-4]`: Various conversion options
- `-X`: Convert Halfwidth Katakana to Fullwidth
- `-x`: Preserve Halfwidth Katakana
- `-O`: Output to file (default: 'nkf.out')
- `-L[uwm]`: Line ending mode
  - `u`: LF
  - `w`: CRLF
  - `m`: CR

#### 5. Long Options
- `--ic=<encoding>`: Input encoding
- `--oc=<encoding>`: Output encoding
- `--hiragana`: Hiragana conversion
- `--katakana`: Katakana conversion
- `--katakana-hiragana`: Mutual conversion
- `--cap-input`, `--url-input`: Hex conversion
- `--numchar-input`: Unicode Character Reference
- `--fb-{skip,html,xml,perl,java,subchar}`: Unassigned character replacement
- `--in-place[=SUF]`: Overwrite original
- `--overwrite[=SUF]`: Preserve timestamp
- `-g`, `--guess`: Guess input encoding
- `-v`, `--version`: Version info
- `--help`, `-V`: Help/configuration

## Implementation Strategy

### 1. File Structure
Create a single completion file: `completions/nkf.fish`

### 2. Completion Features to Implement

#### Basic Options
- Simple flag completions for all single-letter options
- Description for each option based on help text

#### Complex Options
- Handle options with optional parameters (e.g., `-w[8[0]]`)
- Handle options with required parameters (e.g., `--ic=<encoding>`)
- Handle mutually exclusive options (encoding selections)

#### File Completions
- Enable file completion for input files
- Special handling for `-O` flag output file

#### Encoding Lists
- Create completion lists for common encodings for `--ic` and `--oc` options
- Include: UTF-8, UTF-16, UTF-32, Shift_JIS, EUC-JP, ISO-2022-JP, etc.

### 3. Special Considerations

#### Option Grouping
- Group related options visually in completions
- Indicate which options are mutually exclusive

#### Parameter Handling
- Options like `-f60` need special handling for numeric parameters
- Options like `-m[BQSN0]` need to show available sub-options

#### Context-Aware Completions
- After `-O`, suggest output filename
- After `--ic=` or `--oc=`, suggest encoding names

### 4. Testing Plan
1. Test basic flag completions
2. Test file path completions
3. Test parameter completions for complex options
4. Test long option completions
5. Verify descriptions are helpful and accurate

## Implementation Order
1. Create basic structure with simple flags
2. Add long options
3. Implement complex parameter handling
4. Add encoding lists
5. Implement context-aware completions
6. Add comprehensive descriptions
7. Test and refine