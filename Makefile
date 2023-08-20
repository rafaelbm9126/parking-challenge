.DEFAULT_GOAL := help

include .env
export  $(shell sed 's/=.*//' .env)

up: ## Start Service ~ Mode Local
	docker-compose up
