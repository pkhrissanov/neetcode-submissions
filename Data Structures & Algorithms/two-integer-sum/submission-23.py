class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        my_dict = {}
        i = 0
        for num in nums:
            diff = target - num 
            if diff not in my_dict.keys():
                my_dict.update({num: i})
            elif diff in my_dict.keys():
                j = my_dict.get(diff)
                return sorted([j, i ]) 
            i += 1
