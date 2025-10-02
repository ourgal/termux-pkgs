VERSION := 0.17.2

all: install create-package clean

install:
	curl -o package.tar.gz -L https://github.com/google/yamlfmt/releases/download/v$(VERSION)/yamlfmt_$(VERSION)_Linux_arm64.tar.gz
	tar -zxvf temp.tar.gz yamlfmt

create-package:
	termux-create-package package.json

clean:
	rm yamlfmt temp.tar.gz

