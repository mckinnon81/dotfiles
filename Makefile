.PHONY: _pwd_prompt install install_decrypt mutt nano vim zsh offlineimap imapfilter git decrypt encrypt weechat

OIMAP_FILE=offlineimap/offlineimaprc
IMAPF_FILE=imapfilter/config.lua
MUTT_FILE=mutt/comprofix


# 'private' task for echoing instructions
_pwd_prompt:
	@echo "Contact mmckinnon@comprofix.com for the password."

install: _pwd_prompt mutt nano vim zsh offlineimap imapfilter git weechat
	@echo "Installing dotfiles"

install_decrypt: _pwd_prompt install decrypt
	@echo "Installation with decrypt"

offlineimap:
	@echo "Configuring with offlineimap settings"
	@rm -fr ~/.offlineimaprc
	@cp `pwd`/offlineimap/offlineimaprc.sample ~/.dotfiles/offlineimap/offlineimaprc
	@ln -s `pwd`/offlineimap/offlineimaprc ~/.offlineimaprc

imapfilter:
	@echo "Configuring imapfilter settings"
	@rm -fr ~/.imapfilter
	@ln -s `pwd`/imapfilter ~/.imapfilter
	@cp `pwd`/imapfilter/config.lua.sample ~/.imapfilter/config.lua

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

weechat:
	@echo "Setup weechat"
	@rm -fr ~/.weechat
	@ln -s `pwd`/weechat ~/.weechat


# to create conf/settings.json
decrypt:
	@echo "Enter Passwrod to decrypt offlineimap"
	@openssl cast5-cbc -d -in ${OIMAP_FILE}.cast5 -out ${OIMAP_FILE}

	@echo "Enter Password to decrypt imapfilter"
	@openssl cast5-cbc -d -in ${IMAPF_FILE}.cast5 -out ${IMAPF_FILE}

	@echo "Enter Password to decrypt muttrc"
	@openssl cast5-cbc -d -in ${MUTT_FILE}.cast5 -out ${MUTT_FILE}

	@chmod 600 ${OIMAP_FILE}
	@chmod 600 ${IMAPF_FILE}
	@chmod 600 ${MUTT_FILE}

# for updating conf/settings.json
encrypt:
	@echo "Eneter Password to encrypt offlineimaprc"
	@openssl cast5-cbc -e -in ${OIMAP_FILE} -out ${OIMAP_FILE}.cast5

	@echo "Enter Password to encrypt imapfilter"
	@openssl cast5-cbc -e -in ${IMAPF_FILE} -out ${IMAPF_FILE}.cast5

	@echo "Enter Password to encrypt muttrc"
	@openssl cast5-cbc -e -in ${MUTT_FILE} -out ${MUTT_FILE}.cast5
