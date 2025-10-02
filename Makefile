SUBDIRS := $(wildcard src/*/.)

.PHONY: $(SUBDIRS) create-repo
all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

create-repo:
	termux-apt-repo input output
