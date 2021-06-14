package poly.ass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import poly.ass.interceptor.AdminInterceptor;
import poly.ass.interceptor.AuthenticateInterceptor;
import poly.ass.interceptor.LogInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	AuthenticateInterceptor authInterceptor;
	
	@Autowired
	AdminInterceptor adminInterceptor;
	
	@Autowired
	LogInterceptor logInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(logInterceptor)
			.addPathPatterns("/**");

		registry.addInterceptor(authInterceptor)
			.addPathPatterns("/admin/**", "/cart/checkout")
			.excludePathPatterns("/login");

		registry.addInterceptor(adminInterceptor)
			.addPathPatterns("/admin/**")
			.excludePathPatterns("/hello");
	}
}
