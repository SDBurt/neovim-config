# Vim Motions Guide: Efficient Movement

This guide covers the most efficient ways to move horizontally and vertically in Neovim, including both native Vim motions and enhanced plugin motions.

## 🏃 Horizontal Movement

### Basic Character Movement
```
h/l           - Left/right by character (slow, avoid for long distances)
```

### Word Movement (Most Important)
```
w             - Next word start
b             - Previous word start  
e             - End of current word
ge            - End of previous word

W/B/E         - Same as above but treat punctuation as part of word
```

**Examples:**
```javascript
// Cursor on 'f' in 'function'
function getName() { return user.name; }
         ^
w        // → moves to 'g' in 'getName'
e        // → moves to 'n' (end of 'function')
3w       // → moves to 'r' in 'return' (3 words forward)
```

### Character Search (Super Efficient)
```
f{char}       - Find next occurrence of character
F{char}       - Find previous occurrence of character
t{char}       - Till next character (stops before)
T{char}       - Till previous character (stops before)
;             - Repeat last f/F/t/T
,             - Repeat last f/F/t/T in opposite direction
```

**Examples:**
```javascript
// Move to specific characters quickly
const user = { name: "John", age: 30 };
      ^
f"      // → jumps to first quote mark
;       // → jumps to second quote mark  
F{      // → jumps back to opening brace
t,      // → jumps till comma (stops before it)
```

**Scenario: Quick Edits**
```javascript
// Change "John" to "Jane" efficiently
const user = { name: "John", age: 30 };
                     ^
f"      // Jump to opening quote
ci"     // Change inside quotes → type "Jane"
```

### Line Movement
```
0             - Beginning of line
^             - First non-whitespace character
$             - End of line
g_            - Last non-whitespace character
```

**Examples:**
```javascript
    const x = 42;  // cursor anywhere on line
    ^              // Jump to 'c' in 'const'
    0              // Jump to very beginning (before indentation)
    $              // Jump to semicolon
    g_             // Jump to '2' (last non-whitespace)
```

## ⬆️⬇️ Vertical Movement

### Basic Line Movement
```
j/k           - Down/up by line (avoid for long distances)
gj/gk         - Down/up by visual line (for wrapped lines)
```

### Efficient Vertical Movement
```
{/}           - Previous/next blank line (paragraph movement)
H/M/L         - High/Middle/Low of screen
gg/G          - Top/bottom of file
<number>G     - Go to specific line number
<number>gg    - Go to specific line number
```

**Examples:**
```python
# Jump between functions efficiently
def function1():
    pass

def function2():    ← cursor here
    pass

}               # Jump to next blank line (after function2)
{               # Jump to previous blank line (before function2)  
gg              # Jump to top of file
G               # Jump to bottom of file
15G             # Jump to line 15
```

### Screen-Relative Movement
```
<C-u>         - Half page up
<C-d>         - Half page down  
<C-b>         - Full page up
<C-f>         - Full page down
<C-y>         - Scroll up one line (cursor stays)
<C-e>         - Scroll down one line (cursor stays)
```

**Configured in your setup:**
```
<C-d>         - Half page down + center cursor (zz)
<C-u>         - Half page up + center cursor (zz)
```

### Search-Based Movement
```
/pattern      - Search forward
?pattern      - Search backward  
n             - Next search result (centered with zz)
N             - Previous search result (centered with zz)
*             - Search for word under cursor forward
#             - Search for word under cursor backward
```

## ⚡ Plugin-Enhanced Movement

### Flash.nvim (Replaces f/t/search)
```
s             - Flash jump (type 2 chars + label)
S             - Flash treesitter (jump to code structures)
```

**Most Efficient Long-Distance Movement:**
```javascript
// Instead of multiple w/b or f commands:
function calculateTotal(items) {
  return items.reduce((sum, item) => {
    return sum + item.price * item.quantity;
  }, 0);
}

// To jump to "quantity" quickly:
s qu a        // 's' + 'qu' + label 'a' → instant jump
```

**Flash vs Traditional:**
- Traditional: `6w` or `f*` then `;` multiple times
- Flash: `s qu a` → instant, precise jump

### Treesitter Movement (Flash S)
```
S             - Jump to code structures (functions, classes, etc.)
```

**Examples:**
```python
class User:
    def __init__(self):
        pass
    
    def get_name(self):  ← want to jump here
        return self.name
        
# Press 'S' then select the label for get_name function
# Much faster than scrolling or searching
```

### Harpoon (File-Level Movement)
```
<C-h/j/k/l>   - Jump to marked files 1/2/3/4
<leader>a     - Mark current file
<C-e>         - Show marked files
```

## 📊 Movement Efficiency Scenarios

### Scenario 1: Navigate to Function Parameter
```javascript
function updateUser(id, name, email, address) {
                ^                   
// Goal: Change 'email' to 'emailAddress'
```

**Options:**
- **Basic**: `3w` (3 words forward)
- **Character**: `f,2l` (find comma, 2 chars right) 
- **Flash**: `s em a` (flash to 'em', select label)
- **Best**: Flash for precision, f, for nearby targets

### Scenario 2: Jump Between Function Definitions
```python
def process_data():
    pass

def validate_input():  ← cursor here
    pass

def save_to_db():      ← want to go here
    pass
```

**Options:**
- **Basic**: `j` multiple times (slow)
- **Paragraph**: `}` (jump to next blank line)
- **Flash Treesitter**: `S` (select function label)
- **Search**: `/save` (if you know the name)
- **Best**: Flash treesitter for code structures

### Scenario 3: Edit Specific Word in Long Line
```javascript
const config = { database: { host: "localhost", port: 5432, name: "myapp" }, cache: { enabled: true } };
                                                            ^                            
// Goal: Change 'myapp' to 'production'
```

**Options:**
- **Word movement**: `8w` (count words - error prone)
- **Character search**: `f"3;` (find quotes, repeat)
- **Flash**: `s my a` (instant)
- **Search**: `/myapp` (if unique)
- **Best**: Flash for precision

### Scenario 4: Navigate Large File
```python
# Line 1: imports
# Line 50: class definition    ← cursor here
# Line 150: function you need  ← want to go here
# Line 300: end of file
```

**Options:**
- **Line number**: `150G` (if you know line number)
- **Search**: `/function_name` (if you know name)
- **Screen jumps**: `<C-d>` repeatedly (slow)
- **Flash treesitter**: `S` (select function)
- **Best**: Combination - search if you know name, flash treesitter for exploration

## 🎯 Movement Best Practices

### Golden Rules:
1. **Never use h/j/k/l for long distances** - always use more efficient motions
2. **Learn to count** - `3w`, `5j` instead of repeating
3. **Use Flash for precision** - especially for long jumps
4. **Character search (f/t) for nearby targets** - within same line
5. **Search for unique strings** - when you know what you're looking for

### Efficiency Hierarchy (Fast → Slow):
1. **Harpoon** - Instant file switching
2. **Flash** - Instant precise jumps
3. **Search (/)** - When you know the target
4. **Character search (f/t)** - For nearby targets
5. **Word movement (w/b)** - Short-medium distances
6. **Paragraph movement ({/})** - Logical boundaries
7. **Screen jumps (C-d/C-u)** - Medium distances
8. **Line numbers (G)** - When you know exact line
9. **j/k** - Only for 1-3 lines
10. **h/l** - Only for 1-2 characters

### Muscle Memory Training:

**Week 1: Master Word Movement**
- Practice `w`, `b`, `e` constantly
- Count words: `3w`, `2b`
- Never use `l` for more than 2 characters

**Week 2: Add Character Search**
- Use `f{char}` for targets in same line
- Practice `;` and `,` for repetition
- Combine with operators: `df,` (delete to comma)

**Week 3: Flash Integration**
- Replace long-distance movement with Flash
- Use `s` for anything more than 3-4 words away
- Practice Flash treesitter for code navigation

**Week 4: Advanced Combinations**
- Combine motions with operators: `c3w`, `d$`, `y}`
- Use text objects with Flash: Flash to function, then `daf`
- Master vertical movement: `{}`, `<C-d/u>`

### Common Anti-Patterns to Avoid:
```
❌ hjkl spam          → Use w/b/f/Flash
❌ Scrolling to find  → Use search or Flash
❌ Visual line select → Use text objects
❌ Arrow keys         → Train hjkl first, then better motions
❌ Mouse clicking     → Everything should be keyboard
```

### Pro Movement Combinations:
```
ci"           - Change inside quotes (wherever cursor is in quotes)
da(           - Delete around parentheses  
<Flash>daf    - Flash to function, delete entire function
f,ct;         - Find comma, change till semicolon
<Flash>yi}    - Flash to opening brace, yank inside block
```

## 🏆 Movement Mastery Goals

**Beginner**: Stop using h/j/k/l for long distances
**Intermediate**: Use w/b/f/search for all movement  
**Advanced**: Flash + text objects for surgical editing
**Expert**: Never think about movement - it's automatic

Remember: **Efficient movement is the foundation of Vim mastery**. Every second spent moving inefficiently compounds over time. Invest in learning these patterns - they'll save hours daily.