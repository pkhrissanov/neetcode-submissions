class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        freq = {}
        ans = []
        for num in nums:
            if num in freq.keys():
                freq[num] += 1
            else:
                freq[num] = 1
        for i in range(k):
            num = max(freq, key=freq.get)
            freq.pop(num)
            print("popping: ", num)
            ans.append(num)
        return ans