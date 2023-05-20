split("\n")|map(split(","))|
    map(
        {"HeroinName":.[0],
        "RealName":.[1],
        "Title":.[2],
        }
    )