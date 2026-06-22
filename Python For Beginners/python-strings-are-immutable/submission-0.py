def remove_fourth_character(word: str) -> str:
    x = word[:3]
    y = word[4:]
    return x+y


# do not modify below this line
print(remove_fourth_character("NeetCode"))
print(remove_fourth_character("Hello"))
