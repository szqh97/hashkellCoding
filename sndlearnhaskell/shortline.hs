main = interact $ unline . filter ((<10) . length) . lines
