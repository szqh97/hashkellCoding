main = do
    _ <- putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn $ "Read this carefully , beacause this is your future: "  ++ name
