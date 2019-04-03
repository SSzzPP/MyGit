package com.yhlt.showcase.system.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.system.entity.CompanyEntity;
import com.yhlt.showcase.system.service.CompanyService;

/**
 * 组织机构-公司
 * 
 * @author wj
 * @date 2014年12月25日20:23:27
 */
@Controller
@RequestMapping(value = "/admin/system/company")
@AccessRequired("公司管理")
public class CompanyController extends BaseController<CompanyEntity, CompanyService> {

	@Override
	public String index(Model model) {
		return "system/company/company_index";
	}

	/**
	 * 保存更新方法<br>
	 * 带验证
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(@ModelAttribute("T") CompanyEntity t, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			CompanyEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<CompanyEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = new HashMap<String, Object>();
		CompanyEntity companyEntity = service.save(t);
		Map<String, Object> searchParams1 = new HashMap<String, Object>();
		searchParams1.put("EQ_companyEntity.id", companyEntity.getId());

		result.put("success", true);
		result.put("obj", companyEntity);
		return result;
	}

	/**
	 * 查询公司树
	 * 
	 * @return
	 * @author wj
	 * @date 2014-11-19 下午3:02:15
	 */
	@RequestMapping(value = "/combotree")
	@ResponseBody
	public List<CompanyEntity> tree(HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		return service.findByParams(searchParams);
	}

	/**
	 * 查询公司树
	 * 
	 * @return
	 * @author wj
	 * @date 2014-11-19 下午3:02:15
	 */
	@RequestMapping(value = "/usercombotree")
	@ResponseBody
	public List<CompanyEntity> usercombotree(HttpServletRequest request, Model model) {
		List<CompanyEntity> list = new ArrayList<CompanyEntity>();
		CompanyEntity resource = new CompanyEntity();
		resource.setId(1000L);
		resource.setName("全部");
		list.add(resource);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		list.addAll(service.findByParams(searchParams,
				new Sort(new Order("desc".equals("asc") ? Direction.DESC : Direction.ASC, "sortNumber"))));
		return list;
	}

	@AccessRequired("管理员")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") long id, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CompanyEntity entity = service.findOne(id);
		Map<String, Object> result = new HashMap<String, Object>();
		if (entity.getChildren().isEmpty() && entity.getDepartmentEntities().isEmpty())
			return super.delete(id, model, request, response);
		else {
			result.put("msg", "删除失败，该公司包含子公司！");
			result.put("success", false);
		}
		return result;
	}

	/**
	 * 跳转到新增页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String toAddPage(Long companyId, HttpServletRequest request, Model model) {
		CompanyEntity company = new CompanyEntity();
		if (companyId != null) {
			company = service.findOne(companyId);
		}
		request.setAttribute("entity", company);
		request.setAttribute("id", companyId);
		request.setAttribute("companyId", companyId);
		return "system/company/company_add";
	}

}
