#########################################################################
# Autonomous Intelligent System, University of Bonn, LaTeX Beamer theme
#
# Copyright (c) 2010-2013 Dirk Holz, dirk.holz@ieee.org
#
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
#    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
#    CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
#    INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
#    BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
#    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
#    TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
#    ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#    OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#    POSSIBILITY OF SUCH DAMAGE.
#
#    The views and conclusions contained in the software and
#    documentation are those of the authors and should not be
#    interpreted as representing official policies, either expressed
#    or implied, of the FreeBSD Project.

#!/usr/bin/make -f

MAINSRC = presentation

all:	
	rubber --pdf -I . -I style --force $(MAINSRC)

clean:	
	rm -f *.aux *.bbl *.blg *.log *.lof *.log *.lot *.out *.toc *.synctex.gz *.snm *.nav *~ $(MAINSRC).dvi $(MAINSRC).ps $(MAINSRC).pdf

tarball: clean
	tar czvf ../$(MAINSRC).tgz --exclude-vcs --exclude-backups --exclude=$(MAINSRC).tgz .

gitignore:
	@echo "*.aux\n*.bbl\n*.blg\n*.log\n*.lof\n*.log\n*.lot\n*.out\n*.toc\n*.synctex.gz\n*.snm\n*.nav\n*~\n$(MAINSRC).dvi\n$(MAINSRC).ps\n$(MAINSRC).pdf" >> .gitignore
	git add .gitignore

svnignore:
	@echo "*.aux\n*.bbl\n*.blg\n*.log\n*.lof\n*.log\n*.lot\n*.out\n*.toc\n*.synctex.gz\n*.snm\n*.nav\n*~\n$(MAINSRC).dvi\n$(MAINSRC).ps\n$(MAINSRC).pdf" | svn propset svn:ignore . -RF -
