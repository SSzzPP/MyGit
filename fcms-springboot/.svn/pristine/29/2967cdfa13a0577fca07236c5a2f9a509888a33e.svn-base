package com.yhlt.showcase.survey.dto;

import java.io.Serializable;


/**
 * 问卷题库
 * 
 * @author stone
 * 
 */
public class ExcelSurveyQuestionDto implements Serializable {
	/**
	 * 0单选,1多选
	 */
	private Integer questionType;

//	@Excel(name = "*题型", orderNum = "1")
	private String questionTypeStr;

	/**
	 * *题干
	 */
//	@Excel(name = "*题干", orderNum = "2")
	// @Size(min = 1, max = 1000, message = "名称长度限制1-1000位")
	private String title;
	/**
	 * 拼接options各个选项
	 */
	private String options;
	/**
	 * 选项个数
	 */
	private int optionsNums;
//	@Excel(name = "答案", orderNum = "3")
	private String answer;
//	@Excel(name = "*选项A", orderNum = "4")
	private String options1;
//	@Excel(name = "*选项B", orderNum = "5")
	private String options2;
//	@Excel(name = "选项C", orderNum = "6")
	private String options3;
//	@Excel(name = "选项D", orderNum = "7")
	private String options4;
//	@Excel(name = "选项E", orderNum = "8")
	private String options5;
//	@Excel(name = "选项F", orderNum = "9")
	private String options6;
//	@Excel(name = "选项G", orderNum = "10")
	private String options7;
//	@Excel(name = "选项H", orderNum = "11")
	private String options8;
//	@Excel(name = "选项I", orderNum = "12")
	private String options9;
//	@Excel(name = "选项J", orderNum = "13")
	private String options10;
//	@Excel(name = "选项K", orderNum = "14")
	private String options11;
//	@Excel(name = "选项L", orderNum = "15")
	private String options12;

	public Integer getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Integer questionType) {
		this.questionType = questionType;
	}

	public String getQuestionTypeStr() {
		if (this.questionType == null)
			return this.questionTypeStr;
		else if (this.questionType == 0)
			return "单选";
		else if (this.questionType == 1)
			return "多选";
		else if (this.questionType == 2)
			return "判断";
		else
			return "-";
	}

	public void setQuestionTypeStr(String questionTypeStr) {
		this.questionTypeStr = questionTypeStr;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getOptions1() {
		return options1;
	}

	public void setOptions1(String options1) {
		this.options1 = options1;
	}

	public String getOptions2() {
		return options2;
	}

	public void setOptions2(String options2) {
		this.options2 = options2;
	}

	public String getOptions3() {
		return options3;
	}

	public void setOptions3(String options3) {
		this.options3 = options3;
	}

	public String getOptions4() {
		return options4;
	}

	public void setOptions4(String options4) {
		this.options4 = options4;
	}

	public String getOptions5() {
		return options5;
	}

	public void setOptions5(String options5) {
		this.options5 = options5;
	}

	public String getOptions6() {
		return options6;
	}

	public void setOptions6(String options6) {
		this.options6 = options6;
	}

	public String getOptions7() {
		return options7;
	}

	public void setOptions7(String options7) {
		this.options7 = options7;
	}

	public String getOptions8() {
		return options8;
	}

	public void setOptions8(String options8) {
		this.options8 = options8;
	}

	public String getOptions9() {
		return options9;
	}

	public void setOptions9(String options9) {
		this.options9 = options9;
	}

	public String getOptions10() {
		return options10;
	}

	public void setOptions10(String options10) {
		this.options10 = options10;
	}

	public String getOptions11() {
		return options11;
	}

	public void setOptions11(String options11) {
		this.options11 = options11;
	}

	public String getOptions12() {
		return options12;
	}

	public void setOptions12(String options12) {
		this.options12 = options12;
	}

	public String getOptions() {
		options1.replace(";", "；");
		options2.replace(";", "；");
		options = options1 + ";" + options2;
		if (options3 != null && !"".equals(options3)) {
			options3.replace(";", "；");
			options = options + ";" + options3;
		} else {
			optionsNums = 2;
			return options;
		}
		if (options4 != null && !"".equals(options4)) {
			options4.replace(";", "；");
			options = options + ";" + options4;
		} else {
			optionsNums = 3;
			return options;
		}
		if (options5 != null && !"".equals(options5)) {
			options5.replace(";", "；");
			options = options + ";" + options5;
		} else {
			optionsNums = 4;
			return options;
		}
		if (options6 != null && !"".equals(options6)) {
			options6.replace(";", "；");
			options = options + ";" + options6;
		} else {
			optionsNums = 5;
			return options;
		}
		if (options7 != null && !"".equals(options7)) {
			options7.replace(";", "；");
			options = options + ";" + options7;
		} else {
			optionsNums = 6;
			return options;
		}
		if (options8 != null && !"".equals(options8)) {
			options8.replace(";", "；");
			options = options + ";" + options8;
		} else {
			optionsNums = 7;
			return options;
		}
		if (options9 != null && !"".equals(options9)) {
			options9.replace(";", "；");
			options = options + ";" + options9;
		} else {
			optionsNums = 8;
			return options;
		}
		if (options10 != null && !"".equals(options10)) {
			options10.replace(";", "；");
			options = options + ";" + options10;
		} else {
			optionsNums = 9;
			return options;
		}
		if (options11 != null && !"".equals(options11)) {
			options11.replace(";", "；");
			options = options + ";" + options11;
		} else {
			optionsNums = 10;
			return options;
		}
		if (options12 != null && !"".equals(options12)) {
			options12.replace(";", "；");
			options = options + ";" + options12;
		} else {
			optionsNums = 11;
			return options;
		}

		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public int getOptionsNums() {
		return optionsNums;
	}

	public void setOptionsNums(int optionsNums) {
		this.optionsNums = optionsNums;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
