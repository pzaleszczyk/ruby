class OcrNumbers
    def self.convert(text)
        text = text.split("\n")
        a = text.length/4
        if text.length%4 != 0 
            raise ArgumentError.new("messed up")
        end
        if text[0].length%3 != 0
            raise ArgumentError.new("messed up")
        end
        #j = 0
        i = 0
        output = ""
        if a == 1
           output = OcrNumbers.findmatch(text)
        else
            text1 = []
            b = text.length
            while i < b 
                if text[i] == "         "
                   text1.push(text[i-3],text[i-2],text[i-1],text[i])
                   output = output + OcrNumbers.findmatch(text1) +  (i+1!=b ? "," : "")
                   text1 = []
                end
                i += 1
            end
        end
        return output
    end
    def self.findmatch(text) 
        output = ""
        input = "" 
        j = 0
        while j < text[0].length 
            input = text[0][j] + text[0][j+1] + text[0][j+2] + "\n" +
                    text[1][j] + text[1][j+1] + text[1][j+2] + "\n" +
                    text[2][j] + text[2][j+1] + text[2][j+2] + "\n" +
                    text[3][j] + text[3][j+1] + text[3][j+2] 
            if input == " _ \n _|\n|_ \n   "
                output += "2"
            elsif input == " _ \n| |\n|_|\n   "
                output += "0"
            elsif input == "   \n  |\n  |\n   "
                output += "1"
            elsif input == " _ \n _|\n _|\n   "
                output += "3"
            elsif input == "   \n|_|\n  |\n   "
                output += "4"
            elsif input == " _ \n|_ \n _|\n   "
                output += "5"
            elsif input == " _ \n|_ \n|_|\n   "
                output += "6"
            elsif input == " _ \n  |\n  |\n   "
                output += "7" 
            elsif input == " _ \n|_|\n|_|\n   "
                output += "8"
            elsif input == " _ \n|_|\n _|\n   "
                output += "9"
            else
                output += "?"
            end 
        j += 3 
        end  
     return output
    end
end