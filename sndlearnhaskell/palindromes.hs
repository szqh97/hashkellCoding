respondpalindromes contents = unlines (map (\xs ->
    if isPalindrome xs then "palindrome" else "not a palindrome") (lines contents))
        where isPalindrome xs = xs == reverse xs

respondpalindromes2 = unlines . map (\xs ->
    if isPalindrome xs then "palindrome" else "not a palindrome") . lines
        where isPalindrome xs = xs == reverse xs
