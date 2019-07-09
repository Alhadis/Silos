
import http
import os
import fetchbaidu
fn main() {
    names := ['Sam', 'Peter']
    printnames(names)
    printenv()
    fetchbaidu()
}

// for each demo

fn printnames(n []string) {
     for item in n {
         println(item)
     }
}


// os env

fn printenv(){
    println(os.getenv('USERNAME'))
}

// http demo


fn fetchbaidu() {
    resp := http.get('https://www.baidu.com')
    println(resp)
}

// function demo
fn printusername(n string) {
    println(n)
}