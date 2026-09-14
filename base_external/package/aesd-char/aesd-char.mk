
##############################################################
#
# AESD-char
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_CHAR_VERSION = 'aa88c836545d36abe2fbe1de22e21f3525177b58'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-ridhaos-student.git'
AESD_CHAR_SITE_METHOD = git
AESD_CHAR_GIT_SUBMODULES = YES

AESD_CHAR_MODULE_SUBDIRS = aesd-char-driver

AESD_CHAR_DEPENDENCIES = linux

define AESD_CHAR_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define AESD_CHAR_INSTALL_TARGET_CMDS

    # install aesdsocket binary
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
 
    # install drivertest binary
    $(INSTALL) -D -m 0755 $(@D)/assignment-autotest/test/assignment8/drivertest.sh $(TARGET_DIR)/usr/bin/
 
    # install driver init script
    $(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/init.d/S98aesdchar

    # install socket init script  
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	
endef

$(eval $(kernel-module))
$(eval $(generic-package))
