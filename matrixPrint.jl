# pretty printing for arrays and matrices:
function matprint(IN::Any)
    
    MAX_ROWS        = 8;
    MAX_COLS        = 8;
    FLAG_TRIM_ROWS  = false;
    FLAG_TRIM_COLS  = false;
    
    IN_SIZE = size(IN);
    IN_SIZE_s = length(IN_SIZE);
    if IN_SIZE_s == 1
        IN_SIZE = (IN_SIZE[1], 1);
    end
    IN_TYPE = typeof(IN);
    N_ROWS  = min(IN_SIZE[1], MAX_ROWS+1);
    N_COLS  = min(IN_SIZE[2], MAX_COLS+1);
        
    if IN_SIZE[1] > MAX_ROWS
        FLAG_TRIM_ROWS = true;
    end
    
    if IN_SIZE[2] > MAX_COLS
        FLAG_TRIM_COLS = true;
    end
    
    # print the type & size:
    print(IN_TYPE, " ")
    if FLAG_TRIM_ROWS || FLAG_TRIM_COLS
        print("showing ")
    end
    print("[1:", min(IN_SIZE[1], MAX_ROWS))
    if FLAG_TRIM_ROWS
        print("/", IN_SIZE[1])
    end
    print(", 1:", min(IN_SIZE[2], MAX_COLS))
    if FLAG_TRIM_COLS
        print("/", IN_SIZE[2])
    end
    println("]")
    # print the content:
    print("[\n")  
    for _i_ = 1:N_ROWS
        PRINT_DATA = [];
        if _i_ == N_ROWS && FLAG_TRIM_ROWS
            PRINT_DATA = repeat(["..."], outer = [1, IN_SIZE[2]]);
        else
            append!(PRINT_DATA, IN[_i_, 1:N_COLS-1]);
            if FLAG_TRIM_COLS
                append!(PRINT_DATA, ["..."]);
            else
                append!(PRINT_DATA, IN[_i_, N_COLS]);
            end
        end
        #print(PRINT_DATA)
        for _j_ = 1:N_COLS
            print("\t")
            if _i_ < MAX_ROWS && _j_ < MAX_COLS
                @printf("%.3f", PRINT_DATA[_j_])
            else
                print(PRINT_DATA[_j_])
            end
        end
        print("\n")
    end
    print("];\n")  
    
end