package com.yhlt.showcase.base.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * JSP权限验证标签
 * 
 * @author admin
 * 
 */
@SuppressWarnings("serial")
public class PermissControl extends TagSupport {
	private String authorization;

	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		return EVAL_BODY_INCLUDE;
		/*List<String> resourceNameList = new ArrayList<String>();
		List<UserRoleResourceDto> userRoleResourceEntityList = (List<UserRoleResourceDto>) pageContext
				.getSession().getAttribute(SessionSecurityConstants.KEY_USER_RESOURCES);
		for (UserRoleResourceDto userRoleResourceEntity : userRoleResourceEntityList) {
			if (userRoleResourceEntity.getType() == Constants.RESOURCE_TYPE_FCUNTION) {
				resourceNameList.add(userRoleResourceEntity.getDescription());
			}
		}
		
		// 处理前台权限
		List<UserRoleResourceDto> frontUserRoleResourceEntityList = (List<UserRoleResourceDto>) pageContext
				.getSession().getAttribute(SessionSecurityConstants.KEY_USER_FRONT_RESOURCES);
		for (UserRoleResourceDto userRoleResourceEntity : frontUserRoleResourceEntityList) {
			if (userRoleResourceEntity.getType() == Constants.RESOURCE_TYPE_FCUNTION) {
				resourceNameList.add(userRoleResourceEntity.getDescription());
			}
		}

		if (resourceNameList.size() == 0) {
			return SKIP_BODY;
		}
		for (String permiss : resourceNameList) {
			if (authorization.equals(permiss)) {
				return EVAL_BODY_INCLUDE;
			}
		}

		return SKIP_BODY;*/
		// return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {

		return EVAL_PAGE;
	}

	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}

}
