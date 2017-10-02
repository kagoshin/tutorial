package com.example.web

import geb.spock.GebReportingSpec

import com.example.web.page.ListPage

class BookListSpec extends GebReportingSpec {
	
	def "リスト画面が表示されること" () {
		when:
		go 'http:localhost:8080/book-crud/'
		
		then:
		at ListPage
	}
}
