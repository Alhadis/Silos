import http
import json


struct CA {
    url string
}

struct User {
    name string
    sex string
    address string
}

struct Keys {
    pubkey string
    prikey string
}

struct Info {
    keys Keys
    user User
    cert string
}

struct CAReq {
    pubkey string
    cert string
    user User
}

struct CAResp {
    status string
    message string
}

fn new_careq(info Info) CAReq {
    return CAReq {
        pubkey: info.keys.pubkey
        cert: info.cert
        user: info.user
    } 
}

fn new_caresp(data string) CAResp {
    resp := json.decode(CAResp, data) or {
        return CAResp {
            status: 'failed'
            message: 'json decode error'
        }
    }

    if (resp.status == '') {
        return CAResp {
            status: 'failed',
            message: 'status not found'
        }
    }

    return resp
}

fn (ca CA) register(info Info) CAResp {
    req := new_careq(info)

    payload := json.encode(req)

    data := http.post(ca.url, payload)    
    return new_caresp(data)
}

fn main() {
    ca := CA {
        url: 'http://localhost'
    }

    user := User {
        name: 'akakou'
        sex: 'man'
        address: 'cyber world'
    }

    keys := Keys {
        pubkey: 'this is public key'
        prikey: 'this is private key'
    }

    info := Info {
        keys: keys
        user: user
        cert: 'this is certificate'
    }

    resp := ca.register(info)

    println('status:')
    println(resp.status)
    println('')
    println('message:')
    println(resp.message)
}
