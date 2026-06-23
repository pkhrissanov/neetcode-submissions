class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s_dict = {}
        t_dict = {}
        for char in s:
            if char not in s_dict.keys():
                s_dict.update({char:0})
            else:
                s_dict[char] = s_dict.get(char) + 1
        for char in t:
            if char not in t_dict.keys():
                t_dict.update({char:0})
            else:
                t_dict[char] = t_dict.get(char) + 1
        return s_dict == t_dict