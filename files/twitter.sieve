# compile with `sievec` when done

if anyof (header :is "Subject" "Popular in your network",
          header :is "Subject" "Beliebt in Deinem Netzwerk") {
    discard;
    stop;
}
