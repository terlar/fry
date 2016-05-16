function fry-installers --description 'List available installers'
    functions | grep fry-installer- | sed 's/fry-installer-//'
end
