package java.lang.annotation;

import java.lang.String;
/**
 * 
 * @author cym
 *
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE}) 
@Repeatable(Requests.class)  
public @interface Request {
	String key() ;
	Class<?> type();
	boolean nullable();
}
