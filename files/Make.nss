## Make.nss
#
# Indebted to BLFS:
# http://www.linuxfromscratch.org/blfs/view/svn/postlfs/nss.html

nss: zlib sqlite
	@echo Compiling nss
	mv $(BUILD)/nss $(BUILD)/nss.old || true
	( rm -rf $(BUILD)/nss.old ) &
	mkdir -p $(BUILD)/nss
	tar xjf $(ARCHIVE)/nss-* -C $(BUILD)/nss
	patch -d $(BUILD)/nss/* -p3 -F5 -z.old < patches/nss-3.13.5-jtl1.diff
	( cd $(BUILD)/nss/*/nspr \
                && ./configure --prefix=$(PREFIX) $(JTL_CONFIG) --enable-64bit --with-pthreads \
                && $(MAKE) \
                && $(REALLY) $(MAKE) install )
	( cd $(BUILD)/nss/*/nss \
                && $(MAKE) -j1 all \
                        USE_64=1 BUILD_OPT=1 USE_SYSTEM_ZLIB=1 ZLIB_LIBS=-lz \
                        NSS_USE_SYSTEM_SQLITE=1 \
                        NSPR_INCLUDE_DIR=/usr/include/nspr \
                && cd ../dist \
                && $(REALLY) install -v -m755 Linux*/lib/*.so /usr/lib \
                && $(REALLY) install -v -m755 Linux*/lib/{*.chk,libcrmf.a} /usr/lib \
                && $(REALLY) install -v -m755 -d /usr/include/nss \
                && $(REALLY) cp -v -RL {public,private}/nss/* /usr/include/nss \
                && $(REALLY) chmod 644 /usr/include/nss/* \
                && $(REALLY) install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin \
                && $(REALLY) install -v -m644 Linux*/lib/pkgconfig/nss.pc /usr/lib/pkgconfig )
	du -hs $(BUILD)/nss > $(MADE)/nss
	( rm -rf $(BUILD)/nss ; sync ) &
