VERSION := 0.5.1

all: install create-package clean

install:
	go install github.com/caarlos0/jsonfmt@v$(VERSION)

create-package:
	termux-create-package package.json

clean:
	rm ~/go/bin/jsonfmt
