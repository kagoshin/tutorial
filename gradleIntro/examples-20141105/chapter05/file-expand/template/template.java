package ${packageName};

/**
 * ${className}。
 * Gradleで自動生成しています。
 */
public class ${className} {
<% fields.each { type, fieldName -> %>
    private ${type} ${fieldName};<% } %>

    public void ${className}() {}
<% fields.each { type, fieldName ->
	String methodName = fieldName.capitalize() %>
    public ${type} get${methodName}() {
    	return ${fieldName};
    }
    public void set${methodName}(${type} ${fieldName}) {
    	this.${fieldName} = ${fieldName};
    }<% } %>    
}