#flag -lcrypto
#flag -lvpem

#include "pem.h"
#include <openssl/rsa.h>
#include <openssl/pem.h>

struct BigNum {
    data byteptr
}

struct RSAst {
    data byteptr
}

struct X509Req {
    data byteptr
}

struct X509Name {
    data byteptr
}

struct PubKey {
    data byteptr
}

struct User {
    country string
    province string
    city string
    organization string
    common string
}

fn C.BN_new() byteptr
fn C.BN_set_word(byteptr, int) int
fn C.RSA_new() byteptr
fn C.RSA_generate_key_ex(byteptr, byteptr) int
fn C.X509_REQ_new() byteptr
fn C.X509_REQ_set_version(byteptr, int) int
fn C.X509_NAME_add_entry_by_txt(byteptr, byteptr, int, byteptr, int, int) int
fn C.X509_REQ_get_subject_name(byteptr) byteptr
fn C.EVP_PKEY_new() byteptr
fn C.EVP_PKEY_assign_RSA(byteptr, byteptr) int
fn C.X509_REQ_set_pubkey(byteptr, byteptr) int
fn C.X509_REQ_sign(byteptr, byteptr, byteptr)
fn C.EVP_sha1() byteptr
fn C.X509_REQ_sign(byteptr, byteptr, byteptr)
fn C.PEM_generate_from_X509_REQ(byteptr) byteptr


fn new_bignum() ?BigNum {
    c_bignum := BN_new()

    if !c_bignum {
        return error('Bignum could\'t aligned.') 
    }

    bignum := BigNum {
        data: c_bignum
    }
    
    return bignum
}

fn (bignum BigNum)set_word(E int) bool {
    result := BN_set_word(bignum.data, E)
    return result != 1
}

fn new_rsa() ?RSAst {
    c_rsa := RSA_new()
    
    if !c_rsa {
        return error('RSA could\'t aligned.') 
    }

    rsa := RSAst {
        data: c_rsa
    }
    
    return rsa
}

fn (rsa RSAst)generate_rsa(bignum BigNum, bits int) bool {
    result := RSA_generate_key_ex(rsa.data, bits, bignum.data, 0)
    return result != 1
}

fn new_x509req() ?X509Req {
    c_req := X509_REQ_new()
    
    if !c_req {
        return error('X509Req could\'t aligned.') 
    }

    x509_req := X509Req {
        data: c_req
    }
    
    return x509_req
}

fn (x509_req X509Req)set_version(version int) bool {
    result := X509_REQ_set_version(x509_req.data, version)
    return result != 1
}

fn new_x509_name(x509_req X509Req) ?X509Name {
    c_name := X509_REQ_get_subject_name(x509_req.data)
    
    if !c_name {
        return error('X509Name could\'t aligned.') 
    }

    x509_name := X509Name {
        data: c_name
    }
    
    return x509_name
}

fn (x509_name X509Name)add_entries(user User) bool {
    _MBSTRING_ASC := 0x1001

    category := User {
        country: 'C'
        province: 'ST'
        city: 'L'
        organization: 'O'
        common: 'CN'
    }

    mut result := X509_NAME_add_entry_by_txt(x509_name.data, category.country.cstr(), _MBSTRING_ASC, user.country.cstr(), -1, -1, 0)
    if result != 1 {
        return true
    }
    
    X509_NAME_add_entry_by_txt(x509_name.data, category.province.cstr(), _MBSTRING_ASC, user.province.cstr(), -1, -1, 0)
    if result != 1 {
        return true
    }
    
    X509_NAME_add_entry_by_txt(x509_name.data, category.city.cstr(), _MBSTRING_ASC, user.city.cstr(), -1, -1, 0)
    if result != 1 {
        return true
    }
    
    X509_NAME_add_entry_by_txt(x509_name.data, category.organization.cstr(), _MBSTRING_ASC, user.organization.cstr(), -1, -1, 0)
    if result != 1 {
        return true
    }

    X509_NAME_add_entry_by_txt(x509_name.data, category.common.cstr(), _MBSTRING_ASC, user.common.cstr(), -1, -1, 0)
    if result != 1 {
        return true
    }

    return false
}

fn new_pubkey() ?PubKey {
    c_pkey := EVP_PKEY_new()
    
    if !c_pkey {
        return error('Pubkey could\'t aligned.') 
    }

    pubkey := PubKey {
        data: c_pkey
    }
    
    return pubkey
}

fn (pubkey PubKey)assign(rsa RSAst) bool {
    result := EVP_PKEY_assign_RSA(pubkey.data, rsa.data)
    return result != 1
}

fn (x509_req X509Req)set_pubkey(pubkey PubKey) bool {
    result := X509_REQ_set_pubkey(x509_req.data, pubkey.data)
    return result != 1
}

fn (x509_req X509Req)sign(pubkey PubKey) {
    evp_sha1 := EVP_sha1()
    X509_REQ_sign(x509_req.data, pubkey.data, evp_sha1)
}

fn (x509_req X509Req)generate_pem() string {
    _pem := PEM_generate_from_X509_REQ(x509_req.data)
    pem := tos2(_pem)
    return pem
}

fn main() {
    E := 0x10001 //C.RSA_F4
    
    BITS := 2048
    N_VERSION := 1

    // generate big number
    bignum := new_bignum() or {
        eprintln('bignum err')
        return
    }

    if bignum.set_word(E) {
        eprintln('bignum err')        
        return
    }


    // generate RSA
    rsa := new_rsa() or {
        eprintln('bignum err')
        return
    }

    if rsa.generate_rsa(bignum, BITS) {
        eprintln('rsa err')        
        return
    }

    // generate req
    x509_req := new_x509req() or {
        eprintln('X509Req could\'t aligned.')        
        return
    }

    if x509_req.set_version(N_VERSION) {
        eprintln('req err')        
        return
    }

    // generate name
    user := User {
        country: 'JA'
        province: 'Tokyo'
        city: 'Tokyo'
        organization: 'Tokyo'
        common: 'localhost'
    }


    x509_name := new_x509_name(x509_req) or {
        eprintln('name err')        
        return 
    }

    if x509_name.add_entries(user) {
        eprintln('req err')        
        return
    }

    // generate pubkey
    pubkey := new_pubkey() or {
        eprintln('name err')        
        return 
    }

    if pubkey.assign(rsa) {
        eprintln('name err')        
        return 

    }

   if x509_req.set_pubkey(pubkey) {
        eprintln('name pubkey')        
        return 
    }

    // sign
    x509_req.sign(pubkey)

    // geneate pem
    pem := x509_req.generate_pem()

    println(pem)
}
