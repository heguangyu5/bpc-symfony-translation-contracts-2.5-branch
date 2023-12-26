libsymfony-contracts-translation.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Symfony libsymfony-contracts-translation

libsymfony-contracts-translation:
	bpc -v \
		-c bpc.conf  \
		-l symfony-contracts-translation \
		--pseudo-class-list Symfony\\Component\\Translation\\Exception\\InvalidArgumentException \
		--input-file src.list

install-libsymfony-contracts-translation:
	cd Symfony && bpc -l symfony-contracts-translation --install
