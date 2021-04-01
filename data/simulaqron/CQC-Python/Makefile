PYTHON        = python3
PIP           = pip3
CQC_DIR	      = cqc
EXAMPLES      = examples
TESTS         = tests

clean: _clear_pyc _clear_build

_clear_pyc:
	@find . -name '*.pyc' -delete

lint:
	@${PYTHON} -m flake8 ${CQC_DIR} ${EXAMPLES} ${TESTS}

python-deps:
	@${PIP} install -r requirements.txt

test-deps:
	@${PIP} install -r test_requirements.txt

_verified:
	@echo "CQC-Python is verified!"

tests:
	@${PYTHON} -m pytest ${TESTS}

verify: clean python-deps lint tests _verified

install: test-deps build
	@${PIP} install dist/*whl

_remove_build:
	@rm -f -r build

_remove_dist:
	@rm -f -r dist

_remove_egg_info:
	@rm -f -r cqc.egg-info

_clear_build: _remove_build _remove_dist _remove_egg_info

_build:
	@${PYTHON} setup.py sdist bdist_wheel

build: _clear_build _build

.PHONY: clean lint python-deps verify build tests
