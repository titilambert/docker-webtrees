VERSION=1.7.9

build:
	docker build -t webtrees .

run-it:
	docker run --rm --name webtrees -it --entrypoint bash webtrees

mysql:
	docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -d mysql

run:
	docker run --rm --name webtrees -p 80:80 --link=mysql:mysql webtrees 

push:
	docker tag webtrees titilambert/webtrees:latest
	docker tag webtrees titilambert/webtrees:$(VERSION)
	docker push titilambert/webtrees:latest
	docker push titilambert/webtrees:$(VERSION)
