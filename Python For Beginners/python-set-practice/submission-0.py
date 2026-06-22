from typing import List

def contains_duplicate(words: List[str]) -> bool:
    word_set = set(words)
    for word in words:
            try:
                word_set.remove(word)
            except:
                return True        
    return False



# do not modify code below this line
print(contains_duplicate(["hello", "world", "hello"]))
print(contains_duplicate(["hello", "world", "i", "am", "great"]))
print(contains_duplicate(["hello", "hello", "hello"]))
print(contains_duplicate(["Hello", "hellooo", "hello"]))
