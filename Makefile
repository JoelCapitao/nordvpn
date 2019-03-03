# nordvpn

include config.mk
install:
	test -d $(VIRTUALENV) || virtualenv -p /usr/bin/python3.5 $(VIRTUALENV)
	. $(VIRTUALENV)/bin/activate && pip install --upgrade pip && pip install -Ur requirements
	chmod 755 $(VIRTUALENV)/bin/openpyn $(VIRTUALENV)/bin/openpyn-management
	test -f $(PREFIX)/bin/openpyn || ln -s $(VIRTUALENV)/bin/openpyn $(PREFIX)/bin/openpyn
	test -f $(PREFIX)/bin/openpyn-management || ln -s $(VIRTUALENV)/bin/openpyn-management $(PREFIX)/bin/openpyn-management
	test -f $(VIRTUALENV)/lib/python3.5/site-packages/openpyn/credentials || sudo openpyn --init

uninstall:
	rm -rf $(PREFIX)/bin/openpyn-management\
		$(PREFIX)/bin/openpyn\
		$(VIRTUALENV)\

.PHONY: install uninstall
