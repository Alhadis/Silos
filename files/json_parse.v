/*
    File reading and parsing json
*/

import json
import os


const (
    filename = 'test_data.json'
)

struct Name{
    first string
    last string
}

struct User{
    _id         string
    index       int
    guid        string
    isActive    bool
    balance     string
    picture     string
    age         int
    eyeColor    string
    name        Name
}

fn (u User) str() string{
    return '<User $u.name.first $u.name.last> age : $u.age balance: $u.balance'
}

fn (us []User) str() string{
    mut ret := ''
    for u in us{
        ret += u.str() +'\n'
    }
    return ret
}

fn main(){
    contents := os.read_file(filename) or {
        eprintln('failed to open $filename')
        return
    }
    json_o := json.decode([]User, contents) or {
        eprintln('Failed to parse json')
        return
    }
    println(json_o)
    // for user in json_o{
    //     println(user)
    // }
}
