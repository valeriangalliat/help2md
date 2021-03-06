# Initialize usage section (and optional first usage line).
/^Usage:/ {
    usage = 1
    sub(/^Usage: +/, "\n```\n", $0)
    sub(/^Usage:$/, "\n```", $0)
    $0 = "Usage\n-----\n" $0
}

# Initialize section (close usage code if after usage).
/^[a-zA-Z_0-9]+:$/ {
    if (usage) {
      usage = 0
      prev = prev "```\n"
    }

    sub(/:$/, "", $0)
    $0 = "### " $0 "\n\nName | Description\n---- | -----------"
}

# Join continuation lines with previous line.
!usage && /^    / {
    sub(/^ */, " ", $0)
    prev = prev $0
    next
}

# Format arguments/options table.
!usage && /^  / {
    sub(/^  /, "`", $0)
    sub(/  +/, "` | ", $0)
}

# Format usage code.
usage && /^  / {
    sub(/^  /, "", $0)
}

# Initialize buffered line.
NR == 1 {
    prev = $0
}

# Print line (one line buffered).
NR > 1 {
    print prev
    prev = $0
}

END {
    print prev
}
