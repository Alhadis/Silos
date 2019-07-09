package vcompiler
{
  "version": "0.0.1"
}

namespace v {

	class argument_info
	{
	  public property type : class_info;
	  public property name : string;
	}

	class statement_info
	{

	}

	class foreach_statement : statement_info
	{

	}

	class method_info
	{
		public property arguments : argument_info[];
		public property statements : statement_info[];
	}

	class property_info
	{
	  public property type : class_info;
	  public property name : string;
	}

	class namespace_info
	{
	  public property name : string;

	  public property classes : class_info[];
	}

	class class_info
	{
		public property ns : namespace_info;
		public property name : string;

		public property methods : method_info[];
		public property properties : property_info[];
	}

	class c_field
	{
	  public property type : class_info;
	  public property name : string;
	}

	class c_struct
	{
		public property name : string;
		public property fields : c_field[];
		public property methods : c_method[];

		public c_struct(name : string){
			this.name = name;
		}

		public external create_field(type: class_info, name: string) : c_field;

		public create_method(name: string, type : class_info) : c_method {
			return new c_method(name: name, type : type);
		}
	}

	class c_expression
	{
	}

	class c_statement
	{
	}

	class c_method
	{
		public property name: string;
		public property type : class_info;
		public property statements : c_statement[];

		public c_method(name: string, type : class_info) {
			this.name = name;
			this.type = type;
		}

		public add_argument(type: class_info, name: string) {
		}

		public add(statement: c_statement){
		}
	}

	class c_writer
	{
	
		public struct_name(cls : class_info) : string {
			return cls.ns.name + "_" + cls.name;
		}

		public creare_struct(name : string) : c_struct {
			return new c_struct(name: name);
		}
	}

	class c_return : c_statement
	{
		public c_return(expression: c_expression){
		}
	}

	class c_get_field : c_expression
	{
		public c_get_field(owner: c_expression, name: string){
		}
	}

	class c_type_reference : c_expression
	{
		public c_type_reference(type: c_struct){
		}
	}

	class c_assign : c_statement
	{
		public c_assign(left: c_expression, right : c_expression){
		}
	}

	class c_argument : c_expression
	{
		public c_argument(name: string){
		}
	}

	class c_generator
	{
		public static generate(writer : c_writer, namespaces: namespace_info[])
		{
			foreach(var ns in namespaces){
				foreach(var cls in ns.classes){
					var str = writer.creare_struct(name: writer.struct_name(cls: cls));

					foreach(var prop in cls.properties){
						var f = str.create_field(type: prop.type, name: prop.name);
						var get_prop = str.create_method(
							name: "get_" + prop.name,
							type: prop.type
						);
						get_prop.add(
							statement: new c_return(
								expression: new c_get_field(
									owner: new c_type_reference(type: str),
									field_name: f.name
								)));

						var set_prop = str.create_method(
							name: "set_" + prop.name
						);
						set_prop.add_argument(type: prop.type, name: "new_value");
						set_prop.add(
							statement: new c_assign(
								left: new c_get_field(
									owner: new c_type_reference(type: str),
									field_name: f.name
								),
								right: new c_argument(
									name: "new_value"
								)));
					}

					foreach(var m in cls.methods){
						var method = str.create_method(
							name: m.name,
							type: m.return_type
						);

						foreach(var arg in m.arguments){
							method.add_argument(type: arg.type, name: arg.name);
						}

						foreach(var st in m.statements){
							method.add(statement:
							 this.compile_statement(
							    statement: st));
						}
					}
				}
			}
		}

		public compile_statement(statement: statement_info) : c_statement {
		    switch(typeof(statement)){
		    case foreach_statement:

		        break;

		    }

		}
	}
}