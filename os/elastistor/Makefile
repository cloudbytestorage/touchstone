#
#	Makefile
#

PREFIX?= /usr/local

BINDIR=$(PREFIX)/sbin
FILESDIR=$(PREFIX)/lib/escli
MANDIR=$(PREFIX)/man/man8
MKDIR=mkdir
COPY=cp

SCRIPTS=escli
SCRIPTSDIR=${PREFIX}/BINDIR
MAN=$(SCRIPTS).8

${SCRIPTS}:
	@echo Nothing needs to be done for touchstone.

install:: all
	$(MKDIR) -p $(BINDIR)
	$(MKDIR) -p $(FILESDIR)
	$(INSTALL) -c -m $(BINMODE) ${.OBJDIR}/$(SCRIPTS) $(BINDIR)/
	$(COPY) -r ${.OBJDIR}/lib/* $(FILESDIR)/
	$(INSTALL) -c $(MAN).gz $(MANDIR)/

.include <bsd.prog.mk>
