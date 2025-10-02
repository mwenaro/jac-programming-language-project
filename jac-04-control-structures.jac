# Control Structures in Jac
def control_structures_demo() -> None {
    print("=== IF-ELSE STATEMENTS ===");
    
    # Basic if-else
    age: int = 25;
    if age >= 18 {
        print("You are an adult");
    } else {
        print("You are a minor");
    }
    
    # Multiple conditions with elif
    score: int = 85;
    if score >= 90 {
        print("Grade: A");
    } elif score >= 80 {
        print("Grade: B");
    } elif score >= 70 {
        print("Grade: C");
    } elif score >= 60 {
        print("Grade: D");
    } else {
        print("Grade: F");
    }
    
    # Nested if statements
    weather: str = "sunny";
    temperature: int = 75;
    if weather == "sunny" {
        if temperature > 70 {
            print("Perfect day for outdoor activities!");
        } else {
            print("Sunny but a bit cold");
        }
    } else {
        print("Not a sunny day");
    }
    
    print("\n=== FOR LOOPS ===");
    
    # For loop with range
    print("Counting from 1 to 5:");
    for i in range(1, 6) {
        print(f"Count: {i}");
    }
    
    # For loop with list
    fruits: list[str] = ["apple", "banana", "orange"];
    print("Fruits:");
    for fruit in fruits {
        print(f"- {fruit}");
    }
    
    # For loop with manual indexing
    print("Indexed fruits:");
    for i in range(len(fruits)) {
        print(f"{i}: {fruits[i]}");
    }
    
    print("\n=== WHILE LOOPS ===");
    
    # Basic while loop
    counter: int = 0;
    print("While loop countdown:");
    while counter < 5 {
        print(f"Counter: {counter}");
        counter += 1;
    }
    
    # While with condition
    number: int = 1;
    print("Powers of 2 less than 100:");
    while number < 100 {
        print(number);
        number *= 2;
    }
    
    print("\n=== BREAK AND CONTINUE ===");
    
    # Break example
    print("Break example - finding first even number:");
    numbers: list[int] = [1, 3, 5, 8, 9, 12];
    for num in numbers {
        if num % 2 == 0 {
            print(f"First even number: {num}");
            break;
        }
    }
    
    # Continue example
    print("Continue example - only odd numbers:");
    for num in range(1, 11) {
        if num % 2 == 0 {
            continue;
        }
        print(f"Odd: {num}");
    }
    
    print("\n=== NESTED LOOPS ===");
    
    # Nested loops example
    print("2D pattern:");
    for i in range(3) {
        for j in range(3) {
            print(f"({i},{j})", end=" ");
        }
        print();  # New line after each row
    }
    
    # Another nested loop example
    print("\nMultiplication table (3x3):");
    for i in range(1, 4) {
        for j in range(1, 4) {
            product: int = i * j;
            print(f"{i}x{j}={product}", end="  ");
        }
        print();
    }
    
    print("\n=== MATCH STATEMENTS ===");
    
    # Match statement example
    day: int = 3;
    day_name: str;
    match day {
        case 1: day_name = "Monday";
        case 2: day_name = "Tuesday";
        case 3: day_name = "Wednesday";
        case 4: day_name = "Thursday";
        case 5: day_name = "Friday";
        case 6: day_name = "Saturday";
        case 7: day_name = "Sunday";
        default: day_name = "Invalid day";
    }
    print(f"Day {day} is: {day_name}");
    
    # Match with multiple values
    grade: str = "B";
    match grade {
        case "A": print("Excellent!");
        case "B": print("Good job!");
        case "C": print("Average");
        case "D": print("Below average");
        case "F": print("Failed");
        default: print("Invalid grade");
    }
    
    print("\n=== LOOP CONTROL WITH FLAGS ===");
    
    # Using flags to control nested loops
    found: bool = False;
    target: int = 7;
    matrix: list[list[int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    
    print(f"Searching for {target} in matrix:");
    for i in range(len(matrix)) {
        if found {
            break;
        }
        for j in range(len(matrix[i])) {
            if matrix[i][j] == target {
                print(f"Found {target} at position ({i}, {j})");
                found = True;
                break;
            }
        }
    }
}

with entry {
    control_structures_demo();
}
