class Shortlink < ApplicationRecord
    def generateString()
        finalString = ''
        for i in 1..6
          randomizer = rand(1..3)
          if randomizer == 1
            finalString = finalString + i.to_s
          elsif randomizer == 2
            randNo = rand(97..122)
            finalString = finalString + randNo.chr
          else
            randNo = rand(65..90)
            finalString = finalString + randNo.chr
          end
        end
       return finalString
      end
end
