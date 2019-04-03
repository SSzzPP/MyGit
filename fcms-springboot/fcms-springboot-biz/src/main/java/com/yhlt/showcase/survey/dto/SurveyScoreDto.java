package com.yhlt.showcase.survey.dto;


/**
 * 调查问卷实体类
 * @author stone
 * @date 2018-7-23
 *
 */
public class SurveyScoreDto {
//	@Excel(name = "用户ID", orderNum = "1")
	private Long userId;
//	@Excel(name = "用户得分", orderNum = "4")
	private String score;
//	@Excel(name = "用户名称", orderNum = "2")
	private String name;
//	@Excel(name = "用户手机号", orderNum = "3")
	private String mobile;
	private String loginName;
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
}
