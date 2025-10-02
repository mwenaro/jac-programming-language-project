# Dictionaries (Maps) in Jac
def dictionaries_demo() -> None {
    print("=== BASIC DICTIONARIES ===");
    
    # Creating dictionaries
    person: dict[str, str] = {"name": "John", "city": "New York", "job": "Engineer"};
    print(f"Person: {person}");
    
    # Accessing values
    print(f"Name: {person['name']}");
    print(f"City: {person['city']}");
    print(f"Job: {person['job']}");
    
    # Adding new key-value pairs
    person["age"] = "30";
    person["email"] = "john@example.com";
    print(f"Updated person: {person}");
    
    print("\n=== DICTIONARY OPERATIONS ===");
    
    # Dictionary with different value types
    student: dict = {
        "name": "Alice",
        "age": 22,
        "grades": [85, 92, 78, 95],
        "is_enrolled": True
    };
    
    print(f"Student: {student}");
    print(f"Student name: {student['name']}");
    print(f"Student age: {student['age']}");
    print(f"Student grades: {student['grades']}");
    
    # Modifying values
    student["age"] = 23;
    student["grades"].append(88);
    print(f"Modified student: {student}");
    
    print("\n=== DICTIONARY METHODS ===");
    
    inventory: dict[str, int] = {
        "apples": 50,
        "bananas": 30,
        "oranges": 25,
        "grapes": 40
    };
    
    print(f"Inventory: {inventory}");
    
    # Get all keys
    keys = list(inventory.keys());
    print(f"Items available: {keys}");
    
    # Get all values
    values = list(inventory.values());
    print(f"Quantities: {values}");
    
    # Check if key exists
    if "apples" in inventory {
        print("We have apples in stock");
    }
    
    if "mangoes" not in inventory {
        print("We don't have mangoes");
    }
    
    # Get with default value
    apple_count = inventory.get("apples", 0);
    mango_count = inventory.get("mangoes", 0);
    print(f"Apples: {apple_count}, Mangoes: {mango_count}");
    
    print("\n=== ITERATING OVER DICTIONARIES ===");
    
    # Iterate over keys
    print("Items in inventory:");
    for item in inventory {
        print(f"- {item}");
    }
    
    # Iterate over key-value pairs
    print("\nInventory details:");
    for item in inventory {
        quantity = inventory[item];
        print(f"- {item}: {quantity} units");
    }
    
    print("\n=== NESTED DICTIONARIES ===");
    
    # Dictionary containing other dictionaries
    employees: dict = {
        "emp001": {
            "name": "John Smith",
            "department": "Engineering",
            "salary": 75000,
            "skills": ["Python", "Java", "SQL"]
        },
        "emp002": {
            "name": "Sarah Johnson",
            "department": "Marketing",
            "salary": 65000,
            "skills": ["Social Media", "Content Writing", "Analytics"]
        }
    };
    
    print("Employee Database:");
    for emp_id in employees {
        emp = employees[emp_id];
        print(f"ID: {emp_id}");
        print(f"  Name: {emp['name']}");
        print(f"  Department: {emp['department']}");
        print(f"  Salary: ${emp['salary']}");
        print(f"  Skills: {emp['skills']}");
        print();
    }
    
    print("\n=== DICTIONARY COMPREHENSIONS ===");
    
    # Create dictionary from lists
    fruits = ["apple", "banana", "orange"];
    prices = [1.2, 0.8, 1.5];
    
    fruit_prices: dict[str, float] = {};
    for i in range(len(fruits)) {
        fruit_prices[fruits[i]] = prices[i];
    }
    print(f"Fruit prices: {fruit_prices}");
    
    # Square numbers dictionary
    squares: dict[int, int] = {};
    for i in range(1, 6) {
        squares[i] = i * i;
    }
    print(f"Squares: {squares}");
    
    print("\n=== PRACTICAL DICTIONARY USAGE ===");
    
    # Word frequency counter
    def count_words(text: str) -> dict[str, int] {
        words = text.lower().split();
        word_count: dict[str, int] = {};
        
        for word in words {
            if word in word_count {
                word_count[word] += 1;
            } else {
                word_count[word] = 1;
            }
        }
        return word_count;
    }
    
    sample_text = "the quick brown fox jumps over the lazy dog the fox is quick";
    word_frequencies = count_words(sample_text);
    print("Word frequencies:");
    for word in word_frequencies {
        count = word_frequencies[word];
        print(f"  '{word}': {count}");
    }
    
    # Configuration settings
    config: dict[str, any] = {
        "database_host": "localhost",
        "database_port": 5432,
        "debug_mode": True,
        "max_connections": 100,
        "timeout_seconds": 30,
        "allowed_extensions": [".jpg", ".png", ".gif"]
    };
    
    print(f"\nApplication Configuration:");
    for setting in config {
        value = config[setting];
        print(f"  {setting}: {value}");
    }
    
    print("\n=== DICTIONARY COPYING ===");
    
    original: dict[str, int] = {"a": 1, "b": 2, "c": 3};
    
    # Shallow copy
    copy_dict = original.copy();
    copy_dict["d"] = 4;
    
    print(f"Original: {original}");
    print(f"Copy: {copy_dict}");
    
    # Modifying original doesn't affect copy
    original["a"] = 10;
    print(f"After modifying original:");
    print(f"Original: {original}");
    print(f"Copy: {copy_dict}");
}

with entry {
    dictionaries_demo();
}
