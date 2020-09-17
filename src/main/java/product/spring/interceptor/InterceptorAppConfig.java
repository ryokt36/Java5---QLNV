package product.spring.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SuppressWarnings("deprecation")
@Configuration
public class InterceptorAppConfig extends WebMvcConfigurerAdapter {

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(new Interceptor())//
		.addPathPatterns("/*")//
        .excludePathPatterns("/login");;
	}
}
