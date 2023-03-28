PIP = pip3
PYTHON = python3
VERSION := $(shell cat VERSION)
MVN = mvn
groupId = test.id
artifactId = demo_app

.PHONY: clean lint test
default: clean lint 

install_deps:
	$(PIP) install -r requirements.txt

test:
	$(PYTHON) setup.py pytest

lint:
	flake8 .
	@echo "Lint Complete!!"

version_nbr:
	@echo "$(VERSION)"

bump_version:
	git tag $(shell cat VERSION)
	git push origin --tags
	echo $(shell cat VERSION | python3 -c 'import sys; s=str(sys.stdin.readline()).split(".");print(".".join(s[:-1] + [str(int(s[-1].strip())+1)]))')  > VERSION
	git add VERSION && git commit -m "|REALEASE | VERSION update"
	git push

package:
	$(MAKE) clean
	$(PYTHON) setup.py bdist_wheel
	$(PIP) wheel -r requirements.txt --wheel-dir=dist
	tar czf $(artifactId)-$(VERSION)-dist.tar.gz dist

clean:
	@rm -rf **/*.pyc *.pyc **/__pycache__ __pychche__ dist *.egg-info build *.tar.gz *.zip **/*.tar.gz **/*.zip reports

################################################################################
# Uncomment following && fill in correct repository infor
################################################################################
# fetch-artifact:
# 	$(MVN) dependency:get -Darifact=$(groupID):$(artifactId):$(VERSION):tar.gz -Ddest=$(artifactId)-$(VERSION)-dist.tar.gz
# 
# publish:
# 	$(MVN) deploy:deploy-file -DartifactId=$(artifactId) -DgroupId=$(groupId) -Dversion=$(VERSION) -Dpackaing=tar.gz -Dfile=$(artifactId)-$(VERSION)-dist.tar.gz -DrepositoryId=xxx -Durl=xxxxx
# 
# publish-snapshot:
# 	$(MVN) deploy:deploy-file -DartifactId=$(artifactId) -DgroupId=$(groupId) -Dversion=$(VERSION)-SNAPSHOT -Dpackaing=tar.gz -Dfile=$(artifactId)-$(VERSION)-dist.tar.gz -DrepositoryId=xxx -Durl=xxxxx

