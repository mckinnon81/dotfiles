.PHONY: _pwd_prompt install mutt nano vim zsh git

OIMAP_FILE=offlineimap/offlineimaprc
IMAPF_FILE=imapfilter/config.lua
MUTT_FILE=mutt/comprofix


# 'private' task for echoing instructions
_pwd_prompt:
	@echo "Contact mmckinnon@comprofix.com for the password."

install: _pwd_prompt mutt nano vim zsh git weechat
	@echo "Installing dotfiles"

installzsh: _pwd_prompt nano vim git zsh
	@echo "Installing zsh shell"

mutt:
	@echo "Configuring mutt settings"
	@rm -fr ~/.mutt
	@ln -s `pwd`/mutt/ ~/.mutt
	@cp `pwd`/mutt/comprofix.sample ~/.mutt/comprofix

nano:
	@echo "Install nano"
	@rm -fr ~/.nano*
	@ln -s `pwd`/nano/nanorc ~/.nanorc
	@ln -s `pwd`/nano ~/.nano

vim:
	@echo "Install Vim Settings"
	@rm -fr ~/.vim*
	@ln -s `pwd`/vim ~/.vim

zsh:
	@echo "Setup zsh"
	@rm -fr ~/.oh-my-zsh
	@rm -fr ~/.zsh*
	@git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	@ln -s `pwd`/oh-my-zsh/moe.zsh-theme ~/.oh-my-zsh/themes/moe.zsh-theme
	@ln -s `pwd`/zsh/zshrc ~/.zshrc

git:
	@echo "Setup git"
	@rm -fr ~/.gitconfig
	@ln -s `pwd`/git/gitconfig ~/.gitconfig
