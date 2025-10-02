# Operators in Jac
def operators_demo() -> None {
    print("=== ARITHMETIC OPERATORS ===");
    
    a: int = 10;
    b: int = 3;
    
    print(f"a = {a}, b = {b}");
    print(f"Addition: a + b = {a + b}");
    print(f"Subtraction: a - b = {a - b}");
    print(f"Multiplication: a * b = {a * b}");
    print(f"Division: a / b = {a / b}");
    print(f"Floor Division: a // b = {a // b}");
    print(f"Modulus: a % b = {a % b}");
    print(f"Exponentiation: a ** b = {a ** b}");
    
    print("\n=== COMPARISON OPERATORS ===");
    
    x: int = 15;
    y: int = 20;
    
    print(f"x = {x}, y = {y}");
    print(f"Equal: x == y = {x == y}");
    print(f"Not Equal: x != y = {x != y}");
    print(f"Greater than: x > y = {x > y}");
    print(f"Less than: x < y = {x < y}");
    print(f"Greater or equal: x >= y = {x >= y}");
    print(f"Less or equal: x <= y = {x <= y}");
    
    print("\n=== LOGICAL OPERATORS ===");
    
    p: bool = True;
    q: bool = False;
    
    print(f"p = {p}, q = {q}");
    print(f"AND: p and q = {p and q}");
    print(f"OR: p or q = {p or q}");
    print(f"NOT p: not p = {not p}");
    print(f"NOT q: not q = {not q}");
    
    # Complex logical expressions
    age: int = 25;
    has_license: bool = True;
    print(f"\nAge = {age}, Has License = {has_license}");
    print(f"Can drive: (age >= 18) and has_license = {(age >= 18) and has_license}");
    
    print("\n=== ASSIGNMENT OPERATORS ===");
    
    num: int = 10;
    print(f"Initial value: num = {num}");
    
    num += 5;  # num = num + 5
    print(f"After += 5: num = {num}");
    
    num -= 3;  # num = num - 3
    print(f"After -= 3: num = {num}");
    
    num *= 2;  # num = num * 2
    print(f"After *= 2: num = {num}");
    
    num //= 3;  # num = num // 3
    print(f"After //= 3: num = {num}");
    
    num %= 5;  # num = num % 5
    print(f"After %= 5: num = {num}");
    
    print("\n=== MEMBERSHIP OPERATORS ===");
    
    fruits: list[str] = ["apple", "banana", "orange"];
    print(f"Fruits list: {fruits}");
    print(f"'apple' in fruits = {'apple' in fruits}");
    print(f"'grape' in fruits = {'grape' in fruits}");
    print(f"'apple' not in fruits = {'apple' not in fruits}");
    
    # String membership
    text: str = "Hello World";
    print(f"\nText: '{text}'");
    print(f"'Hello' in text = {'Hello' in text}");
    print(f"'xyz' in text = {'xyz' in text}");
    
    print("\n=== IDENTITY OPERATORS ===");
    
    list1: list[int] = [1, 2, 3];
    list2: list[int] = [1, 2, 3];
    list3: list[int] = list1;
    
    print(f"list1 = {list1}");
    print(f"list2 = {list2}");
    print(f"list3 = list1 (same reference)");
    print(f"list1 == list2 = {list1 == list2}");  # Value comparison
    print(f"list1 is list2 = {list1 is list2}");  # Identity comparison
    print(f"list1 is list3 = {list1 is list3}");  # Same object
    print(f"list1 is not list2 = {list1 is not list2}");
    
    print("\n=== CONDITIONAL OPERATOR (TERNARY) ===");
    
    score: int = 85;
    result: str = "Pass" if score >= 60 else "Fail";
    print(f"Score: {score}, Result: {result}");
    
    # Nested conditional
    grade: str = "A" if score >= 90 else "B" if score >= 80 else "C" if score >= 70 else "F";
    print(f"Grade: {grade}");
    
    print("\n=== OPERATOR PRECEDENCE EXAMPLES ===");
    
    # Demonstrates operator precedence
    result1: int = 2 + 3 * 4;  # Multiplication first
    result2: int = (2 + 3) * 4;  # Parentheses first
    result3: bool = 5 > 3 and 2 < 4;  # Comparison first, then logical
    
    print(f"2 + 3 * 4 = {result1}");
    print(f"(2 + 3) * 4 = {result2}");
    print(f"5 > 3 and 2 < 4 = {result3}");
    
    print("\n=== STRING OPERATORS ===");
    
    first_name: str = "John";
    last_name: str = "Doe";
    
    # String concatenation
    full_name: str = first_name + " " + last_name;
    print(f"Full name: {full_name}");
    
    # String repetition
    separator: str = "-" * 20;
    print(f"Separator: {separator}");
    
    # String formatting with f-strings
    age_str: int = 30;
    message: str = f"Hello, I'm {first_name} and I'm {age_str} years old";
    print(f"Message: {message}");
}

with entry {
    operators_demo();
}
