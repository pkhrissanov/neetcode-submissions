class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        my_list = {}
        def make_count(word):
            count = [0] * 26
            for char in word:
                index = ord(char) - ord('a')
                count[index] += 1 
            return tuple(count)

        for word in strs:
            word_key = make_count(word)
            if word_key not in my_list:
                my_list[word_key] = [word]
            else:
                my_list[word_key].append(word)
        answer = []
        for ana in my_list.values():
            answer.append(ana)
        return answer