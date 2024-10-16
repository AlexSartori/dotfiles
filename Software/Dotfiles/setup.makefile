BOLD=$(shell tput bold)
RST=$(shell tput sgr0)

.PHONY: all hosts-file fonts gimp-brushes dnf-software other-software snap-software finalize

all: hosts-file fonts dnf-software other-software gimp-brushes snap-software finalize


hosts-file:
	@echo -e "\n\n$(BOLD)### HOSTS-FILE$(RST)"
	wget -q https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	sudo mv /etc/hosts /etc/hosts.old
	sudo mv hosts /etc/hosts
	sudo systemctl restart NetworkManager # Empty DNS cache
	sleep 5 # Wait for nm to restart

fonts:
	@echo -e "\n\n$(BOLD)### FONTS$(RST)"
	sudo cp -r fonts/* /usr/share/fonts/
	fc-cache -f -v > /dev/null # Refresh font cache

gimp-brushes:
	@echo -e "\n\n$(BOLD)### GIMP-BRUSHES$(RST)"
	cp -r gimp_brushes/* ~/.config/GIMP/2.10/brushes/

dnf-software:
	@echo -e "\n\n$(BOLD)### DNF-SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "dnf-software" /tmp/dnfsoft
	vi /tmp/dnfsoft
	xargs --arg-file="/tmp/dnfsoft" sudo dnf install

other-software:
	@echo -e "\n\n$(BOLD)### OTHER SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "other-software" /tmp/othsoft
	vi /tmp/othsoft
	sh /tmp/othsoft

snap-software:
	@echo -e "\n\n$(BOLD)### SNAP SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "snap-software" /tmp/snapw
	vi /tmp/snapsw
	sh /tmp/snapsw

finalize:
	@echo -e "\n\n$(BOLD)### FINALIZING$(RST)"
	# @echo "Extra configuration files to copy/use can be found in: $(PWD)/extra_files"
	@echo -e "\n\n$(BOLD)### END$(RST)"

