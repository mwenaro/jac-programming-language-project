# Objects and Classes in Jac (Simplified)
def objects_demo() -> None {
    print("=== WORKING WITH OBJECT-LIKE STRUCTURES ===");
    
    # Using dictionaries as simple objects
    def create_person(name: str, age: int, email: str = "") -> dict {
        return {
            "name": name,
            "age": age,
            "email": email
        };
    }
    
    def person_introduce(person: dict) -> str {
        return f"Hi, I'm {person['name']} and I'm {person['age']} years old";
    }
    
    def person_get_info(person: dict) -> str {
        info = f"Name: {person['name']}, Age: {person['age']}";
        if person["email"] {
            info += f", Email: {person['email']}";
        }
        return info;
    }
    
    def person_have_birthday(person: dict) -> None {
        person["age"] += 1;
        print(f"Happy birthday {person['name']}! You are now {person['age']}");
    }
    
    # Creating person objects
    person1 = create_person("Alice", 25, "alice@example.com");
    person2 = create_person("Bob", 30);
    
    print(person_introduce(person1));
    print(person_introduce(person2));
    
    print(person_get_info(person1));
    print(person_get_info(person2));
    
    person_have_birthday(person1);
    
    print("\n=== BANK ACCOUNT SIMULATION ===");
    
    def create_bank_account(account_number: str, owner: str, initial_balance: float = 0.0) -> dict {
        return {
            "account_number": account_number,
            "owner": owner,
            "balance": initial_balance
        };
    }
    
    def account_deposit(account: dict, amount: float) -> None {
        if amount > 0 {
            account["balance"] += amount;
            print(f"Deposited ${amount}. New balance: ${account['balance']}");
        } else {
            print("Deposit amount must be positive");
        }
    }
    
    def account_withdraw(account: dict, amount: float) -> bool {
        if amount <= 0 {
            print("Withdrawal amount must be positive");
            return False;
        }
        
        if amount > account["balance"] {
            print("Insufficient funds");
            return False;
        }
        
        account["balance"] -= amount;
        print(f"Withdrew ${amount}. New balance: ${account['balance']}");
        return True;
    }
    
    def account_get_info(account: dict) -> str {
        return f"Account: {account['account_number']}, Owner: {account['owner']}, Balance: ${account['balance']}";
    }
    
    # Creating and using bank account
    account = create_bank_account("ACC123456", "John Doe", 1000.0);
    print(account_get_info(account));
    
    account_deposit(account, 500.0);
    account_withdraw(account, 200.0);
    account_withdraw(account, 1500.0);  # Should fail
    
    print(f"Final balance: ${account['balance']}");
    
    print("\n=== STUDENT MANAGEMENT SYSTEM ===");
    
    def create_student(name: str, student_id: str, major: str) -> dict {
        return {
            "name": name,
            "student_id": student_id,
            "major": major,
            "grades": []
        };
    }
    
    def student_add_grade(student: dict, grade: int) -> None {
        if grade >= 0 and grade <= 100 {
            student["grades"].append(grade);
            print(f"Added grade {grade} for {student['name']}");
        } else {
            print("Grade must be between 0 and 100");
        }
    }
    
    def student_get_average(student: dict) -> float {
        grades = student["grades"];
        if len(grades) == 0 {
            return 0.0;
        }
        total = sum(grades);
        return total / len(grades);
    }
    
    def student_get_letter_grade(student: dict) -> str {
        avg = student_get_average(student);
        if avg >= 90 {
            return "A";
        } elif avg >= 80 {
            return "B";
        } elif avg >= 70 {
            return "C";
        } elif avg >= 60 {
            return "D";
        } else {
            return "F";
        }
    }
    
    def student_get_info(student: dict) -> str {
        avg = student_get_average(student);
        letter = student_get_letter_grade(student);
        return f"Student: {student['name']} (ID: {student['student_id']}), Major: {student['major']}, Average: {avg} ({letter})";
    }
    
    # Creating and managing students
    student = create_student("Emma Wilson", "STU001", "Computer Science");
    
    student_add_grade(student, 85);
    student_add_grade(student, 92);
    student_add_grade(student, 78);
    student_add_grade(student, 88);
    student_add_grade(student, 95);
    
    print(student_get_info(student));
    
    student_add_grade(student, 105);  # Should fail
}

with entry {
    objects_demo();
}
