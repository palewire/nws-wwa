lint:
	pipenv run flake8 ./

test:
	pipenv run coverage run test.py
	pipenv run coverage report -m

scrape:
	pipenv run nwswwa all > data/all.json
	pipenv run nwswwa hazards > data/hazards.json
	pipenv run nwswwa warnings > data/warnings.json

ship:
	rm -rf build/
	rm -rf dist/
	pipenv run python setup.py sdist bdist_wheel
	pipenv run twine upload dist/* --skip-existing

.PHONY: lint test scrape ship
