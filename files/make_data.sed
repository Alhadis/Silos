1,/^END/ {
  s/[']/\\\'/g 
  s/.*/handle('&');/g
}
