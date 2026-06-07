class Alphabet:
    def __init__(self, lang, letters):
        self.language = lang
        self.letters = letters
    def print(self):
        print(f"Letters {self.language}`s alphabet: {', '.join(self.letters)}")
    def letters_num(self):
        return len(self.letters)

class EngAlphabet(Alphabet):
    _letters_num = 26

    def __init__(self):
        eng_letters = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        super().__init__(lang = "EN", letters=eng_letters)

    def s_en_letter(self, letter):
        return letter.upper() in self.letters

    def letters_num(self):
        return self._letters_num

    def example():
        return "Grait Britan is the capital of London!"
    
# 1
eng_alphabet = EngAlphabet()

# 2
eng_alphabet.print()
    
# 3
print(f"Numbers letters in EN alphabet : {eng_alphabet.letters_num()}")
    
# 4
letter_check = input("Enter EN letter for check - ")
if eng_alphabet.s_en_letter(letter_check):
    print(f"Letter '{letter_check}' is EN alphabet")
else:
    print(f"Letter '{letter_check}' is not EN alphabet.")
          
# 6
print(f"Example EN text: {EngAlphabet.example()}")