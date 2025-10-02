# Error Handling in Jac
def error_handling_demo() -> None {
    print("=== BASIC ERROR HANDLING ===");
    
    # Simple error checking with conditionals
    def safe_divide(a: int, b: int) -> float {
        if b == 0 {
            print("Error: Cannot divide by zero!");
            return 0.0;
        }
        return a / b;
    }
    
    print(f"10 / 2 = {safe_divide(10, 2)}");
    print(f"10 / 0 = {safe_divide(10, 0)}");
    
    print("\n=== INPUT VALIDATION ===");
    
    def validate_age(age: int) -> bool {
        if age < 0 {
            print("Error: Age cannot be negative");
            return False;
        }
        if age > 150 {
            print("Error: Age seems unrealistic");
            return False;
        }
        return True;
    }
    
    def create_person_safe(name: str, age: int) -> dict {
        if not name {
            print("Error: Name cannot be empty");
            return {};
        }
        
        if not validate_age(age) {
            return {};
        }
        
        return {"name": name, "age": age};
    }
    
    person1 = create_person_safe("Alice", 25);
    person2 = create_person_safe("", 30);  # Invalid name
    person3 = create_person_safe("Bob", -5);  # Invalid age
    
    print(f"Person 1: {person1}");
    print(f"Person 2: {person2}");
    print(f"Person 3: {person3}");
    
    print("\n=== LIST OPERATIONS WITH ERROR CHECKING ===");
    
    def safe_list_access(lst: list, index: int) -> any {
        if index < 0 or index >= len(lst) {
            print(f"Error: Index {index} is out of bounds for list of length {len(lst)}");
            return None;
        }
        return lst[index];
    }
    
    numbers = [10, 20, 30, 40, 50];
    print(f"List: {numbers}");
    
    # Valid access
    print(f"Element at index 2: {safe_list_access(numbers, 2)}");
    
    # Invalid access
    print(f"Element at index 10: {safe_list_access(numbers, 10)}");
    print(f"Element at index -1: {safe_list_access(numbers, -1)}");
    
    print("\n=== DICTIONARY OPERATIONS WITH ERROR CHECKING ===");
    
    def safe_dict_get(dictionary: dict, key: str, default_value: any = None) -> any {
        if key in dictionary {
            return dictionary[key];
        } else {
            print(f"Warning: Key '{key}' not found in dictionary");
            return default_value;
        }
    }
    
    student = {"name": "John", "age": 20, "major": "CS"};
    
    print(f"Name: {safe_dict_get(student, 'name')}");
    print(f"Grade: {safe_dict_get(student, 'grade', 'Not Available')}");
    
    print("\n=== FUNCTION ERROR HANDLING ===");
    
    def calculate_average(grades: list[int]) -> float {
        if not grades {
            print("Error: Cannot calculate average of empty list");
            return 0.0;
        }
        
        # Check for invalid grades
        for grade in grades {
            if grade < 0 or grade > 100 {
                print(f"Error: Invalid grade {grade}. Grades must be between 0 and 100");
                return 0.0;
            }
        }
        
        total = sum(grades);
        return total / len(grades);
    }
    
    valid_grades = [85, 92, 78, 88];
    invalid_grades = [85, 105, 78, -10];  # Contains invalid grades
    empty_grades = [];
    
    print(f"Average of {valid_grades}: {calculate_average(valid_grades)}");
    print(f"Average of {invalid_grades}: {calculate_average(invalid_grades)}");
    print(f"Average of {empty_grades}: {calculate_average(empty_grades)}");
    
    print("\n=== FILE OPERATIONS SIMULATION ===");
    
    def simulate_file_read(filename: str) -> str {
        # Simulate file existence check
        valid_files = ["config.txt", "data.txt", "users.txt"];
        
        if filename not in valid_files {
            print(f"Error: File '{filename}' not found");
            return "";
        }
        
        # Simulate file content
        file_contents = {
            "config.txt": "debug=true\nport=8080",
            "data.txt": "1,2,3,4,5",
            "users.txt": "alice,bob,charlie"
        };
        
        print(f"Successfully read file '{filename}'");
        return file_contents[filename];
    }
    
    # Try reading different files
    content1 = simulate_file_read("config.txt");
    content2 = simulate_file_read("missing.txt");
    
    print(f"Config content: {content1}");
    print(f"Missing file content: '{content2}'");
    
    print("\n=== COMPREHENSIVE ERROR HANDLING EXAMPLE ===");
    
    def process_student_grades(students: list[dict]) -> dict {
        results = {
            "processed": 0,
            "errors": 0,
            "total_average": 0.0
        };
        
        if not students {
            print("Error: No student data provided");
            return results;
        }
        
        total_sum = 0.0;
        processed_count = 0;
        
        for i in range(len(students)) {
            student = students[i];
            
            # Validate required fields
            if "name" not in student or not student["name"] {
                print(f"Student {i+1}: Missing or empty name");
                results["errors"] += 1;
                continue;
            }
            
            if "grades" not in student {
                print(f"Student {i+1}: Missing grades");
                results["errors"] += 1;
                continue;
            }
            
            grades = student["grades"];
            if not grades {
                print(f"Student {student['name']}: No grades provided");
                results["errors"] += 1;
                continue;
            }
            
            # Validate grades
            valid_grades = True;
            for grade in grades {
                if grade < 0 or grade > 100 {
                    print(f"Student {student['name']}: Invalid grade {grade}");
                    results["errors"] += 1;
                    valid_grades = False;
                    break;
                }
            }
            
            if valid_grades {
                avg = sum(grades) / len(grades);
                total_sum += avg;
                processed_count += 1;
                results["processed"] += 1;
                print(f"Processed {student['name']}: Average = {avg}");
            }
        }
        
        if processed_count > 0 {
            results["total_average"] = total_sum / processed_count;
        }
        
        return results;
    }
    
    # Test data with various errors
    test_students = [
        {"name": "Alice", "grades": [85, 92, 78]},
        {"name": "", "grades": [90, 88]},  # Empty name
        {"name": "Bob"},  # Missing grades
        {"name": "Charlie", "grades": []},  # Empty grades
        {"name": "Diana", "grades": [95, 105, 80]},  # Invalid grade
        {"name": "Eve", "grades": [88, 92, 85]}
    ];
    
    results = process_student_grades(test_students);
    
    print(f"\nProcessing Results:");
    print(f"Successfully processed: {results['processed']} students");
    print(f"Errors encountered: {results['errors']}");
    print(f"Overall class average: {results['total_average']}");
}

with entry {
    error_handling_demo();
}
