.PHONY: _pwd_prompt install install_decrypt mutt nano vim zsh decrypt encrypt offlineimap imapfilter

OIMAP_FILE=offlineimaprc
IMAPF_FILE=imapfilter/config.lua
MUTT_FILE=mutt/comprofix


# 'private' task for echoing instructions
_pwd_prompt:
	@echo "Contact mmckinnon@comprofix.com for the password."

install: _pwd_prompt mutt nano vim zsh
	@echo "Installing dotfiles"

install_decrypt: _pwd_prompt install decrypt
	@echo "Installation with decrypt"

offlineimap:
	@echo "Configuring with offlineimap settings"
	@cp `pwd`/offlineimaprc.sample ~/.dotfiles/offlineimaprc
	@ln -s `pwd`/offlineimaprc ~/.offlineimaprc

imapfilter:
	@echo "Configuring imapfilter settings"
	@ln -s `pwd`/imapfilter ~/.imapfilter
	@cp `pwd`/imapfilter/config.lua.sample ~/.imapfilter/config.lua

mutt:
	@echo "Configuring mutt settings"
	@rm -fr ~/.mutt
	@ln -s `pwd`/mutt/ ~/.mutt
	@cp ~/.mutt/comprofix.sample ~/.mutt/comprofix

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
	@ln -s `pwd`/oh-my-zsh ~/.oh-my-zsh
	@ln -s `pwd`/zshrc ~/.zshrc
	@ln -s `pwd`/zshrc_aliases ~/.zshrc_aliases

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
