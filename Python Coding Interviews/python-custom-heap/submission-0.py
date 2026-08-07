import heapq
from typing import List


def get_reverse_sorted(nums: List[int]) -> List[int]:
    max_heap = []
    sorted = []
    for i in range(len(nums)):
        pair = (-nums[i],nums[i])
        heapq.heappush(max_heap,pair)
    for i in range(len(max_heap)):
        number = heapq.heappop(max_heap)[1]
        sorted.append(number)
    return sorted



# do not modify below this line
print(get_reverse_sorted([1, 2, 3]))
print(get_reverse_sorted([5, 6, 4, 2, 7, 3, 1]))
print(get_reverse_sorted([5, 6, -4, 2, 4, 7, -3, -1]))
