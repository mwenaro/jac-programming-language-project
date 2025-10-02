# working with lists
def working_with_lists() -> None {
    scores: list[int] = [12, 45, 67];
    print("Original scores:", scores);
    print("First score:", scores[0]);
    print("Second score:", scores[1]);
    print("Third score:", scores[2]);
    
    # List length
    print("Number of scores:", len(scores));
    
    # Adding elements
    scores.append(89);
    print("After append:", scores);
    
    # Insert at specific position
    scores.insert(1, 25);
    print("After insert at index 1:", scores);
    
    # Remove elements
    scores.remove(45);  # Remove by value
    print("After removing 45:", scores);
    
    # Pop element (remove and return)
    last_score = scores.pop();
    print("Popped element:", last_score);
    print("After pop:", scores);
    
    # List slicing
    first_two = scores[0:2];
    print("First two elements:", first_two);
    
    # Check if element exists
    if 25 in scores {
        print("25 is in the list");
    }
    
    # Sort the list
    scores.sort();
    print("Sorted scores:", scores);
    
    # Reverse the list
    scores.reverse();
    print("Reversed scores:", scores);
    
    # List comprehension
    doubled: list[int] = [x * 2 for x in scores];
    print("Doubled scores:", doubled);
    
    # Sum and max/min
    print("Sum of scores:", sum(scores));
    print("Maximum score:", max(scores));
    print("Minimum score:", min(scores));
}


with entry {
    working_with_lists();
}
