#
# Makefile for Sheller
#

NAME=sheller
VERSION=0.1
FULLNAME=$(NAME)-$(VERSION)

PREFIX=/usr

DESTBIN=$(PREFIX)/bin
DESTLIBEXEC=$(PREFIX)/libexec/$(NAME)

defualt: exec

# TODO: Remove this:
hole:
	$(MAKE) PREFIX=$(HOME)/hole/sheller install


exec::
	chmod +x bin/*


install: exec clean
	mkdir -p $(DESTBIN)
	sed -e 's|__VERSION__|$(VERSION)|g' bin/$(NAME) \
		> $(DESTBIN)/$(NAME)
	chmod 755 $(DESTBIN)/$(NAME)
	mkdir -p $(DESTLIBEXEC)
	cp -rp libexec/$(NAME)/* $(DESTLIBEXEC)
	chmod -R go-ws $(DESTLIBEXEC)/*
	chmod 755 $(DESTLIBEXEC)
	sed -i -e 's|__PREFIX__|$(PREFIX)|g' $(DESTLIBEXEC)/init

uninstall::
	rm -f $(DESTBIN)/$(NAME)
	rm -rf $(DESTLIBEXEC)


reinstall: uninstall install



TARBALL=$(FULLNAME).tar.gz
TARBALLDIR=.tarball
TARBALLFULL=$(TARBALLDIR)/$(FULLNAME)
$(TARBALL): clean
	mkdir -p $(TARBALLFULL)
	cp -r * $(TARBALLFULL)
	(cd $(TARBALLDIR) && tar cf - $(FULLNAME)) \
		| gzip - \
		> $@
	rm -rf $(TARBALLDIR)
TO_CLEAN += $(TARBALLDIR) $(TARBALL)

tar: $(TARBALL)


# TODO: MAF has a nicer version of this somewhere.
todo:
	@egrep -r -e 'T[O]DO:' . \
	| fgrep -v "Binary file" \
	| sed -e 's/:.*T[O]DO: /:\t/g'


clean:
	rm -rf $(TO_CLEAN)
	find . -name "*~" -print | xargs rm -f
