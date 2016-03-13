BEGIN {
    begin = ARGV[1]; delete ARGV[1]
    end = ARGV[2]; delete ARGV[2]
}

$0 == begin {
    print

    # Display stdin.
    while ((getline line < "-") > 0) {
      print line
    }

    # Hide original usage.
    silent = 1
}

$0 == end {
    silent = 0
}

!silent
