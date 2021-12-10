autoload $DOTFILES/zsh_completion.d/deno.zsh

[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"  # This loads nvm

alias dotfiles="code $DOTFILES"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-gpu --remote-debugging-port=9222"
alias ftk="sudo killall VDCAssistant"
alias fresh="rm .npmrc package-lock.json && rm -rf node_modules && npm i --force --registry=https://registry.npmjs.org/"
alias deno-local="~/code/deno/target/debug/deno"

src $DOTFILES/partials/bindings.sh
src $DOTFILES/partials/auto-secrets.sh

src $HOME/.bashrc
src $HOME/.personal
src $HOME/.secrets

cd ~/code
