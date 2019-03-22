=begin
We're given a hashmap associating each courseId key with a list of courseIds values,
which represents that the prerequisites of courseId are courseIds. Return a sorted
ordering of courses such that we can finish all courses.

Return null if there is no such ordering.

For example:
given {'CSC300': ['CSC100', 'CSC200'], 'CSC200': ['CSC100'], 'CSC100': []}
return ['CSC100', 'CSC200', 'CSC300']
=end

# Kahn's algorithm

def sort_courses(prereqs)
  course_count = prereqs.length

  prereq_counts = prereqs.reduce({}) do |acc, (key, value)|
    acc[key] ||= 0
    acc[key] += value.length
    acc
  end

  out_edges = prereqs.reduce({}) do |acc, (key, value)|
    value.each do |course|
      acc[course] ||= []
      acc[course] << key
    end
    acc
  end

  result = []

  queue = prereq_counts.select {|course, prereq_count| prereq_count == 0}.map { |k, v| k }
  while queue.length > 0
    curr_course = queue.shift
    result << curr_course

    neighbors = out_edges[curr_course]

    next if neighbors.nil?

    neighbors.each do |neighbor|
      prereq_counts[neighbor] -= 1
      queue << neighbor if prereq_counts[neighbor] == 0
    end
  end

  return nil if result.length != course_count # not possible
  result
end


prereqs = {'CSC300' => ['CSC100', 'CSC200'], 'CSC200' => ['CSC100'], 'CSC100' => []}
puts "Result: #{sort_courses(prereqs).inspect}"
puts "Matches expected value: #{sort_courses(prereqs) == ['CSC100', 'CSC200', 'CSC300']}"
