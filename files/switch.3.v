fn compare(lang string) string {
    mut comparative := ''

    switch lang {
        case 'rust':
        	comparative = 'easier'
        case 'python':
        	comparative = 'faster'
        default:
        	comparative = 'better'
    }
    return 'v is $comparative than $lang'
}

println(compare('rust'))
println(compare('python'))
println(compare('php'))