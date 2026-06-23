class Solution:
    def hasDuplicate(self, nums: List[int]) -> bool:
        nums_set = set(nums)
        for num in nums:
            try:
                nums_set.remove(num)
            except:
                return True
        return False
