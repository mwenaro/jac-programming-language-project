# Functions in Jac
def functions_demo() -> None {
    print("=== BASIC FUNCTIONS ===");
    
    # Function with no parameters and no return value
    def greet() -> None {
        print("Hello from a function!");
    }
    
    greet();
    
    # Function with parameters
    def greet_person(name: str) -> None {
        print(f"Hello, {name}!");
    }
    
    greet_person("Alice");
    greet_person("Bob");
    
    # Function with return value
    def add_numbers(a: int, b: int) -> int {
        return a + b;
    }
    
    result: int = add_numbers(5, 3);
    print(f"5 + 3 = {result}");
    
    print("\n=== FUNCTION PARAMETERS ===");
    
    # Function with default parameters
    def greet_with_title(name: str, title: str = "Mr.") -> str {
        return f"Hello, {title} {name}!";
    }
    
    print(greet_with_title("Smith"));
    print(greet_with_title("Johnson", "Dr."));
    
    print("\n=== MATHEMATICAL FUNCTIONS ===");
    
    def square(x: int) -> int {
        return x * x;
    }
    
    def cube(x: int) -> int {
        return x * x * x;
    }
    
    def is_even(n: int) -> bool {
        return n % 2 == 0;
    }
    
    print(f"Square of 5: {square(5)}");
    print(f"Cube of 3: {cube(3)}");
    print(f"Is 4 even? {is_even(4)}");
    print(f"Is 7 even? {is_even(7)}");
    
    print("\n=== RECURSIVE FUNCTIONS ===");
    
    def factorial(n: int) -> int {
        if n <= 1 {
            return 1;
        }
        return n * factorial(n - 1);
    }
    
    print(f"Factorial of 5: {factorial(5)}");
    print(f"Factorial of 0: {factorial(0)}");
    
    def fibonacci(n: int) -> int {
        if n <= 1 {
            return n;
        }
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
    
    print("Fibonacci sequence:");
    for i in range(6) {
        print(f"fib({i}) = {fibonacci(i)}");
    }
    
    print("\n=== FUNCTION WITH LISTS ===");
    
    def sum_list(numbers: list[int]) -> int {
        total: int = 0;
        for num in numbers {
            total += num;
        }
        return total;
    }
    
    def find_max(numbers: list[int]) -> int {
        if len(numbers) == 0 {
            return 0;
        }
        max_val: int = numbers[0];
        for num in numbers {
            if num > max_val {
                max_val = num;
            }
        }
        return max_val;
    }
    
    test_numbers: list[int] = [3, 7, 2, 9, 1, 5];
    print(f"Numbers: {test_numbers}");
    print(f"Sum: {sum_list(test_numbers)}");
    print(f"Maximum: {find_max(test_numbers)}");
    
    print("\n=== FUNCTION SCOPE ===");
    
    global_var: str = "I'm global";
    
    def scope_demo() -> None {
        local_var: str = "I'm local";
        print(f"Inside function - Global: {global_var}");
        print(f"Inside function - Local: {local_var}");
    }
    
    scope_demo();
    print(f"Outside function - Global: {global_var}");
}

with entry {
    functions_demo();
}

with entry {
    functions_demo();
}
