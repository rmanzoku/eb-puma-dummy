NAME = sample-rackup

S3_BUCKET = s3bucket
S3_KEY = $(NAME).zip
CURRENT_REVISION = $(shell git rev-parse HEAD)

all: setup build pack

.PHONY: setup build pack upload

setup:
	mkdir -p dist
	rbenv install --skip-existing
	gem install bundler

build:
	echo $(CURRENT_REVISION) > REVISION
	bundle package --all
	bundle install --jobs=4 --local --path .bundle --without development test

pack:
	rsync . dist \
	--recursive \
	--exclude=".git" \
	--exclude=".direnv" \
	--exclude=".bundle" \
	--exclude="tmp/*" \
	--exclude="run/*" \
	--exclude="dist" \
	--exclude=$(NAME).zip \
	--delete

	zip -r $(NAME).zip dist

upload: $(NAME).zip
	ls -l $(NAME).zip
	cat REVISION
	aws s3 --quiet cp $(NAME).zip s3://$(S3_BUCKET)/$(S3_KEY)
