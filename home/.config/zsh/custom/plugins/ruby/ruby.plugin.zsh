export GEM_PATH="$(gem env path)"
export PATH="${GEM_PATH%%:*}/bin:${PATH}"
