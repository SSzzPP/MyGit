package com.yhlt.showcase.survey.dto;

import java.io.Serializable;

/**
 * 多选，单选
 * @author GCK
 *
 */
public class QuestionTypeDto implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3634564783354166832L;
	private String name;
	private int value;

	public QuestionTypeDto(String name, int value) {
		super();
		this.name = name;
		this.value = value;
	}

	public QuestionTypeDto() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

}
