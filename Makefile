# ░█▀▄░█▀█░█▀▀░█░█░█▀▀░█▀▄
# ░█░█░█░█░█░░░█▀▄░█▀▀░█▀▄
# ░▀▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀

docker-build:
	docker build . -t phoneme

docker-run: docker-build
	docker run -it \
		--name="phoneme"\
 		--env="PYTHONUNBUFFERED=TRUE"\
		phoneme
