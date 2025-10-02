SUBDIRS := $(wildcard src/*)
CURRENT_DIR = $(notdir $@)

.PHONY: $(SUBDIRS) create-repo
all: $(SUBDIRS) create-repo

$(SUBDIRS):
	jq '.data_files."bin/$(CURRENT_DIR)".source = "result/bin/$(CURRENT_DIR)" | .deb_dir = "../../input"' src/$(CURRENT_DIR)/package.json | sponge src/$(CURRENT_DIR)/package.json
	$(MAKE) -C $@

create-repo:
	termux-apt-repo input output
