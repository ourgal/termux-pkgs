SUBDIRS := $(wildcard src/*)
CURRENT_DIR = $(notdir $@)
CONF = src/$(CURRENT_DIR)/package.json

.PHONY: $(SUBDIRS) create-repo
all: $(SUBDIRS) create-repo

$(SUBDIRS):
	jq '.data_files."bin/$(CURRENT_DIR)".source = "result/bin/$(CURRENT_DIR)" | .deb_dir = "input"' $(CONF) | sponge $(CONF)
	nix build .#$(CURRENT_DIR)
	termux-create-package $(CONF)

src/nixfmt:
	jq '.data_files."bin/$(CURRENT_DIR)".source = "$(CURRENT_DIR)" | .deb_dir = "input"' $(CONF) | sponge $(CONF)
	termux-create-package $(CONF)

src/nil:
	jq '.data_files."bin/$(CURRENT_DIR)".source = "$(CURRENT_DIR)" | .deb_dir = "input"' $(CONF) | sponge $(CONF)
	termux-create-package $(CONF)

create-repo:
	termux-apt-repo input output
