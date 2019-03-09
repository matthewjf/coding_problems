'''
DCP #84
Amazon

Given a matrix of 1s and 0s, return the number of "islands" in the matrix.
A 1 represents land and 0 represents water, so an island is a group of 1s
that are neighboring whose perimeter is surrounded by water.

For example, this matrix has 4 islands.

1 0 0 0 0
0 0 1 1 0
0 1 1 0 0
0 0 0 0 0
1 1 0 0 1
1 1 0 0 1
'''

def get_island(input_list, pos, visited):
  queue = [pos]
  while len(queue) > 0:
    x,y = queue.pop()
    visited.add((x,y))
    for dx,dy in [(0,-1), (0,1), (1,0), (-1,0)]:
      next_x = x + dx
      next_y = y + dy
      if next_x >= 0 and next_x < len(input_arr[y]) and next_y >= 0 and next_y < len(input_arr):
        if (next_x, next_y) not in visited and input_list[next_y][next_x] == 1:
          queue.append((x+dx, y+dy))

def count_islands(input_list):
  visited = set()
  island_count = 0
  for y, row in enumerate(input_list):
    for x, value in enumerate(row):
      if value == 1 and (x,y) not in visited:
        island_count += 1
        get_island(input_list, (x,y), visited)
  return island_count

input_arr = [
  [ 1, 0, 0, 0, 0 ],
  [ 0, 0, 1, 1, 0 ],
  [ 0, 1, 1, 0, 0 ],
  [ 0, 0, 0, 0, 0 ],
  [ 1, 1, 0, 0, 1 ],
  [ 1, 1, 0, 0, 1 ]
]

print(count_islands(input_arr))
