# frozen_string_literal: true

class ListAccuracy
  def accuracy_test(origin, sorted)
    copy = sorted.clone
    cnt = 0

    (0..origin.length - 1).each do |i|
      (0..copy.length - 1).each do |j|
        next unless origin[i] == copy[j]

        # puts "origin[#{i}]: #{origin[i]}, copy[#{j}]: #{copy[j]}"
        i += 1 if i < origin.length - 1
        copy.delete_at(j)
        cnt += 1
        break
      end
    end
    puts "Maching rate: #{cnt / origin.length * 100}%"
  end
end
