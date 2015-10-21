def sum_pairs(ints, s)
   winner = []
   first = 0
   second = 1
   until first == ints.length - 1
      if (ints[first] + ints[second]) == s
        winner << ints[first]
        winner << ints[second]
      else
        second += 1
        if second == ints.length
           first += 1
           second = first + 1
        end
      end
   end
   p winner
   p winner
 end

sum_pairs([10, 5, 2, 3, 7, 5], 10)