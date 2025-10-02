all: create-repo

create-repo:
	termux-apt-repo input output

jsonfmt:
	make -C src/jsonfmt/

yamlfmt:
	make -C src/yamlfmt/
