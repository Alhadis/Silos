import os
import json

struct BuildFileSource {
    directory string
    entry string
}

struct BuildFileBinaries {
    target string
    output string
}

struct BuildFileEnvironment {
    version []string
    compiler string
}

struct BuildFile {
    // Source
    source BuildFileSource
    binaries BuildFileBinaries
    environment BuildFileEnvironment
}

fn read_build_file() ?BuildFile {
    s := os.read_file('Voracer') or {
        return error('Voracer not found')
    }
    mut build := json.decode(BuildFile, s) or {
        eprintln('[ERROR] Could not parse JSON')
        exit(1)
        return error('Could not parse JSON')
    }
    return build
}

fn main() {
    if !os.file_exists('Voracer') {
        eprintln('[ERROR] Could not find \'Voracer\'')
        exit(1)
    }
    println('[VORAC] Parsing \'Voracer\'')
    mut build := read_build_file() or {
        return
    }
    println('[VORAC] Building \'' + build.source.directory + '\'..')
    println('        Compiler: ' + build.environment.compiler)
    
    if build.environment.compiler == 'vc' {
        println('[VORAC] Building ' + build.source.entry + '..')
        cmd := 'v -o ' + build.binaries.target + '/' + build.binaries.output + ' ' + build.source.directory + '/' + build.source.entry
        println(cmd)
        out := os.exec(cmd)
        println(out)
    } else {
        eprintln('[ERROR] Unknown compiler ' + build.environment.compiler)
        exit(1)
    }
}
