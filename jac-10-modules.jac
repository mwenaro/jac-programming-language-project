# Modules and Code Organization in Jac
def modules_demo() -> None {
    print("=== CODE ORGANIZATION CONCEPTS ===");
    
    # Simulating module-like organization with functions
    print("In a real Jac project, you would organize code into separate files:");
    print("- math_utils.jac (mathematical functions)");
    print("- string_utils.jac (string manipulation functions)");
    print("- data_utils.jac (data processing functions)");
    print("- main.jac (main application logic)");
    
    print("\n=== MATH UTILITIES SIMULATION ===");
    
    # Functions that would be in math_utils.jac
    def add(a: int, b: int) -> int {
        return a + b;
    }
    
    def multiply(a: int, b: int) -> int {
        return a * b;
    }
    
    def factorial(n: int) -> int {
        if n <= 1 {
            return 1;
        }
        return n * factorial(n - 1);
    }
    
    def is_prime(n: int) -> bool {
        if n < 2 {
            return False;
        }
        for i in range(2, int(n ** 0.5) + 1) {
            if n % i == 0 {
                return False;
            }
        }
        return True;
    }
    
    print("Math utilities:");
    print(f"add(5, 3) = {add(5, 3)}");
    print(f"multiply(4, 7) = {multiply(4, 7)}");
    print(f"factorial(5) = {factorial(5)}");
    print(f"is_prime(17) = {is_prime(17)}");
    print(f"is_prime(18) = {is_prime(18)}");
    
    print("\n=== STRING UTILITIES SIMULATION ===");
    
    # Functions that would be in string_utils.jac
    def capitalize_words(text: str) -> str {
        words = text.split();
        capitalized = [];
        for word in words {
            if word {
                capitalized.append(word[0].upper() + word[1:].lower());
            }
        }
        return " ".join(capitalized);
    }
    
    def count_vowels(text: str) -> int {
        vowels = "aeiouAEIOU";
        count = 0;
        for char in text {
            if char in vowels {
                count += 1;
            }
        }
        return count;
    }
    
    def reverse_string(text: str) -> str {
        return text[::-1];
    }
    
    def is_palindrome(text: str) -> bool {
        cleaned = text.lower().replace(" ", "");
        return cleaned == cleaned[::-1];
    }
    
    print("String utilities:");
    sample_text = "hello world programming";
    print(f"Original: '{sample_text}'");
    print(f"Capitalized: '{capitalize_words(sample_text)}'");
    print(f"Vowel count: {count_vowels(sample_text)}");
    print(f"Reversed: '{reverse_string(sample_text)}'");
    print(f"Is palindrome: {is_palindrome('racecar')}");
    
    print("\n=== DATA UTILITIES SIMULATION ===");
    
    # Functions that would be in data_utils.jac
    def find_max_in_list(numbers: list[int]) -> int {
        if not numbers {
            return 0;
        }
        max_val = numbers[0];
        for num in numbers {
            if num > max_val {
                max_val = num;
            }
        }
        return max_val;
    }
    
    def filter_even_numbers(numbers: list[int]) -> list[int] {
        evens = [];
        for num in numbers {
            if num % 2 == 0 {
                evens.append(num);
            }
        }
        return evens;
    }
    
    def calculate_statistics(numbers: list[int]) -> dict {
        if not numbers {
            return {"count": 0, "sum": 0, "average": 0, "min": 0, "max": 0};
        }
        
        total = sum(numbers);
        count = len(numbers);
        
        return {
            "count": count,
            "sum": total,
            "average": total / count,
            "min": min(numbers),
            "max": max(numbers)
        };
    }
    
    def group_by_category(items: list[dict], category_key: str) -> dict {
        groups = {};
        for item in items {
            if category_key in item {
                category = item[category_key];
                if category not in groups {
                    groups[category] = [];
                }
                groups[category].append(item);
            }
        }
        return groups;
    }
    
    print("Data utilities:");
    test_numbers = [12, 7, 23, 4, 19, 8, 15];
    print(f"Numbers: {test_numbers}");
    print(f"Max: {find_max_in_list(test_numbers)}");
    print(f"Even numbers: {filter_even_numbers(test_numbers)}");
    
    stats = calculate_statistics(test_numbers);
    print(f"Statistics: {stats}");
    
    # Test grouping
    test_items = [
        {"name": "Apple", "category": "Fruit", "price": 1.2},
        {"name": "Banana", "category": "Fruit", "price": 0.8},
        {"name": "Carrot", "category": "Vegetable", "price": 0.5},
        {"name": "Broccoli", "category": "Vegetable", "price": 1.5}
    ];
    
    grouped = group_by_category(test_items, "category");
    print("\nGrouped items:");
    for category in grouped {
        items = grouped[category];
        print(f"{category}: {len(items)} items");
        for item in items {
            print(f"  - {item['name']}: ${item['price']}");
        }
    }
    
    print("\n=== CONFIGURATION MANAGEMENT ===");
    
    # Simulating configuration handling
    def load_config() -> dict {
        # In a real application, this might read from a file
        return {
            "app_name": "Jac Learning App",
            "version": "1.0.0",
            "debug": True,
            "database": {
                "host": "localhost",
                "port": 5432,
                "name": "learning_db"
            },
            "features": ["logging", "caching", "analytics"]
        };
    }
    
    def get_config_value(config: dict, key: str, default_value: any = None) -> any {
        if key in config {
            return config[key];
        }
        return default_value;
    }
    
    config = load_config();
    print("Application Configuration:");
    print(f"App Name: {get_config_value(config, 'app_name')}");
    print(f"Version: {get_config_value(config, 'version')}");
    print(f"Debug Mode: {get_config_value(config, 'debug')}");
    print(f"Database Host: {config['database']['host']}");
    print(f"Features: {config['features']}");
    
    print("\n=== BEST PRACTICES FOR CODE ORGANIZATION ===");
    
    print("1. Separate concerns into different files:");
    print("   - Keep related functions together");
    print("   - Use descriptive file names");
    print("   - Avoid circular dependencies");
    
    print("\n2. Use consistent naming conventions:");
    print("   - snake_case for functions and variables");
    print("   - PascalCase for classes (when available)");
    print("   - UPPERCASE for constants");
    
    print("\n3. Document your modules:");
    print("   - Add comments explaining module purpose");
    print("   - Document function parameters and return values");
    print("   - Provide usage examples");
    
    print("\n4. Structure your project:");
    print("   project/");
    print("   ├── main.jac           # Entry point");
    print("   ├── utils/");
    print("   │   ├── math_utils.jac");
    print("   │   ├── string_utils.jac");
    print("   │   └── data_utils.jac");
    print("   ├── models/");
    print("   │   ├── user.jac");
    print("   │   └── product.jac");
    print("   └── config/");
    print("       └── settings.jac");
    
    print("\n=== SIMULATED MODULE USAGE ===");
    
    # Demonstrate how modules would be used together
    def process_user_data(raw_data: str) -> dict {
        # Clean the data (string_utils)
        cleaned = capitalize_words(raw_data.strip());
        
        # Parse into components
        parts = cleaned.split(",");
        if len(parts) >= 2 {
            name = parts[0].strip();
            age_str = parts[1].strip();
            
            # Convert age (with error handling)
            age = 0;
            if age_str.isdigit() {
                age = int(age_str);
            }
            
            # Generate user ID (math_utils)
            user_id = add(age, len(name));
            
            return {
                "name": name,
                "age": age,
                "user_id": user_id,
                "name_length": len(name),
                "vowel_count": count_vowels(name)
            };
        }
        
        return {};
    }
    
    # Test the integrated functionality
    test_users = [
        "alice smith, 25",
        "bob johnson, 30",
        "charlie brown, 22"
    ];
    
    print("Processing user data:");
    processed_users = [];
    for user_data in test_users {
        user = process_user_data(user_data);
        if user {
            processed_users.append(user);
            print(f"- {user}");
        }
    }
    
    # Calculate stats on processed data
    ages = [user["age"] for user in processed_users];
    age_stats = calculate_statistics(ages);
    print(f"\nAge statistics: {age_stats}");
}

with entry {
    modules_demo();
}
