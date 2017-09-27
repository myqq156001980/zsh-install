sudo apt install zsh git -y
si=*******
if [ -d "$HOME/.oh-my-zsh" ]; then
 echo "$si rm .oh-my-sh $si"
 rm -rf "$HOME/.oh-my-zsh"
fi

if [ -d "$HOME/.zsh-syntax-highlighting" ]; then
 echo "$si rm .zsh-syntax-highlighting $si"
 rm -rf "$HOME/.zsh-syntax-highlighting"
fi

echo "$si clone .oh-my-zsh $si"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "$si clone zsh-syntax-highlighting $si"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting

if [ -f "$HOME/.zshrc" ]; then
 echo "$si backup .zshrc to .zshrc.orig $si"
 cp ~/.zshrc ~/.zshrc.orig
fi

echo "$si change shell to zsh $si"
chsh -s /bin/zsh

echo "$si cp .zshrc to ~/.zshrc $si"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "$si config zsh syntax $si"
echo "source ${ZDOTDIR:-$HOME}/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "$si input config $si"
cat config >> ~/.zshrc
echo "$si replace theme ys $si"
sed -i 's/ZSH_THEME=.*/ZSH_THEME="ys"/g' ~/.zshrc

echo "$si Done $si"
