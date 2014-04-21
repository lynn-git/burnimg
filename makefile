.PHONY :install uninstall clean

ROOT = $(realpath .)

CP = cp
RM = rm
RMFLAG = -rf
BIN = burnimg
MKDIR = mkdir
HELP = help
CONFIG = burnimg.conf
DIR_DOC = $(ROOT)/doc
DIR_BIN = /usr/bin/
DIR_HELP = /usr/share/burnimg/
DIR_CONF = /etc/burnimg/

DIRS = $(DIR_HELP) $(DIR_CONF)

install : $(DIRS)
	@$(CP) $(BIN) $(DIR_BIN)
	@$(CP) $(ROOT)/$(CONFIG) $(DIR_CONF)
	@$(CP) $(DIR_DOC)/$(HELP) $(DIR_HELP)
	@echo ""
	@echo ":-) Completed"
	@echo ""

$(DIRS) :
	@$(MKDIR) $@

uninstall :
	@$(RM) $(RMFLAG) $(DIRS)
	@$(RM) $(DIR_BIN)$(BIN)
	@echo ""
	@echo ":-) Completed"
	@echo ""

clean :
	@sed -i '/image_dir.*/d' $(ROOT)/$(CONFIG)
	@echo "image_dir:./" >> $(ROOT)/$(CONFIG)
	@echo ""
	@echo ":-) Completed"
	@echo ""
