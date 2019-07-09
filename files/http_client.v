import http

fn main(){
    urls := []string{
        'https://od-api-demo.oxforddictionaries.com:443/api/v1/languages'
    }

    for url in urls{
        mut resp := http.get(url)
        println(resp)
    }
}
