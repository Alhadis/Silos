import os

fn main() {
    for file in os.ls('.') {
	    if check(file) {
            os.mv(file, './build/$file')
        }
    }
}

fn check(filename string) bool {
    mut state := true
    switch true {
        case filename.starts_with('.'): 
            state = false
        
        case filename.ends_with('.v'):
            state = false
        
        default:
            state = true
        
    }
    return state
}