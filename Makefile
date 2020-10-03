help:  ## This help
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[1m%-15s\033[0m %s\n", $$1, $$2}'

clean:  ## Remove cached files and dirs from workspace
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete
	@find . -type f -name "*.DS_Store" -delete
	@rm -f .coverage coverage.xml
	@rm -rf htmlcov

install:  ## Install dependencies
	@pip install -r requirements.txt

start:  ## Start the server
	@DEBUG=True python manage.py runserver 0.0.0.0:8000

test:  ## Run tests
	@coverage run --source users manage.py test && coverage report --fail-under=20 && coverage xml

.PHONY: help clean start test
