export GEM_PATH="$(gem env path)"
export PATH="${gempath%%:*}/bin:${PATH}"
