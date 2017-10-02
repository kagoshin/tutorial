package com.example.domain.model;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;

public class BookTest {
	@Test
    public void testGetTitle() {
    	Book testee = new Book("Gradle徹底入門", "9784798199999");
        assertThat(testee.getTitle(), is("Gradle徹底入門"));
    }
}
