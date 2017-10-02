package com.example.web

import geb.spock.GebReportingSpec

import com.example.web.page.CreatePage

class BookRegistrationSpec extends GebReportingSpec {
	def "登録画面が表示されること" () {
		when:
		go 'http:localhost:8080/book-crud/book/createView'
		
		then:
		at CreatePage
	}
}
