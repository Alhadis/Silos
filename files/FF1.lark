import org.w3c.html.*; 
import org.w3c.dom.*;
import org.summer.ui.*;
import org.w3c.event.Event;
import org.w3c.event.EventHandler;
import org.w3c.event.KeyboardEvent;

import java.util.*;
public class FF1 implements INotifyPropertyChanged{ 
	<html>    
		<head>  
		<meta httpEquiv="Content-Type" content="text/html;charset=utf-8" />
			<script > 
				   
			</script> 
			 
			<style type="text/css">   
				.item:hover {
				  animation: 1s rainbow infinite;
				}
			
				@keyframes rainbow {
				  0% { background-color: yellow; }
				  100% { background: blue; }
				} 
				
				.child {
					padding-left: 10px;
					border:thin solod red;
					font-size: 12px; 
					background-color: 
				}
			</style>      
		</head>  
		<body onclick = "test">  
		 
		<aside id="gallery">
		  <p className="photonav">
		    <a id="photonext" href="casey.html"> Next &gt; </a>
		    <a id="photoprev" href="adagio.html"> &lt; Previous </a>
		  </p>
		  <figure id="photo">
		    <img id="photoimg" src="gallery/1984-casey-500.jpg"
		            alt="Fer" width="500" height="375" />
		    <figcaption> Fer, 1972 </figcaption>
		  </figure> 
		</aside>
	
			  
			for dsddsd if do
				
		<p style.border = "5px solid red">
			asasasa
			<br />
			<Text data = {Binding property="style" mode = "OneWay"} />
		</p>
		<p style.border = {Binding property="style" mode = "OneWay"}>
			asasasa
			<br />
			<Text data = {Binding property="style" mode = "OneWay"} />
		</p>
		<table>
		 <caption>  </caption> 
		 <thead x:name = "_tttt1">
		    
		 </thead>
		 
		 <tbody>
		 
		 	<div itemsConfig ={ItemsConfig path = "child" itemTemplate = "SelectTemplate1"}>
	 		</div>
	 		
	 		<button onclick = "addChild"> add </button>
	 		<button onclick = "deleteChild"> delete </button>
		 
		 	<input value = "中华人民共和国1" id="1"/>
	 
		 	<tr template = "FirstTemplate">
		 	
		 	<td> <input id="2" value={Binding property="style" mode = "TwoWay" updateSourceTrigger="PropertyChanged"}  onkeydown = "returnNav" /> </td>  
		 	<td > 
			 	<select itemsConfig ={ItemsConfig path = "options" itemTemplate = "SelectTemplate"}>
			 		Test 
			 	</select>
		 	</td> 
		 	
		 	<td> 
			 	<div itemsConfig ={ItemsConfig path = "options" itemTemplate = "SelectTemplate1"}>
			 		Test
			 	</div>
		 	</td> 
		 	
		 	<button onclick="replaceChilds"> setup </button>
	 	
		 	</tr>
		 	<tr dataContext = {DataPath mode="Relative" property = "person"} >
		 	<td> <input id="3" value={Binding property="name" mode = "TwoWay" updateSourceTrigger="PropertyChanged"}  /> </td> 
		 	<td> <input id="4" value={Binding property="age" mode = "TwoWay" updateSourceTrigger="PropertyChanged"}  /> </td> 
		 	</tr>  
		 	<tr>
		 	</tr>
		 	<tr>
		 	</tr>
		 	<tr>
		 	<td> 
		 	
		 	<button value = "change" onclick = "click"> Test </button> 
		 	</td>  
		 	</tr> 
		 </tbody>
		</table> 
		
		<form > 0
			<input type="range" id="a" value="50" /> 100
	        + <input type="number" id="b" value="50" />
			=<output name="x" htmlFor="a b"></output>  
		</form> 
		
		
		<div className = "child" onclick = "select" dataContext = {DataPath mode="Relative" property = "root"}>
			<span x:name = "item" className="hvr-fade"> <img src="img/expanded.gif"/> <Text data={Binding property="name" mode = "OneWay"} /> </span>
			<div className = "children" itemsConfig ={ItemsConfig path = "children" itemTemplate = "ChildTemplate"}> 
	
			</div>
		</div>  
		</body> 
	</html>  
	
	private Object listeners= new Object();
	    
	public FF1(){ 
		String g = ("wqwqwq");  
		int i1 =10;
		this._options = new ArrayList<Person>();
		for(int i=0;i<3;i++){ 
			_options.add(new Person("Smith" + i, 98));
		}
		
		Collection coll = new ArrayList();
		for(Object o: coll) {
			for(Object o1: coll)  
				i1=g.length;
		}  
		
		for(Object o: coll){  
			 
		}
		
		Array<String> os = new Array<String>();
		for(String s : os){
			int ll = s.length; 
		}
		
		for(int i=0; i<10; i++){
			Person p = new Person("孩子" + i, i);
			this.root.children.add(p);
			for(int j=0;j<3;j++){
				if(j==2){
					p.children.add(sample = new Person("孙子"+ i +"_" +j, j));
				}
				p.children.add(new Person("孙子"+ i +"_" +j, j));
			}
		}
 	}
	
	EventHandler select = (Event event)->{
		if(((HTMLElement)event.target).className == "hvr-fade" && ((HTMLElement)event.target).style.backgroundColor == "blue"){
			((HTMLElement)event.target).style.removeProperty("background-color");
		} else {
			((HTMLElement)event.target).style.backgroundColor = "blue";
		}
	};
	
	private Person sample;
	   
	private int index = 0;
	
	private Person _person  = new Person("Smith", 98);
	public Person person{
		&{
			return this._person;
		}
	}
	
	private List<Person> _options;
	public List<Person> options{
		&{
			return this._options;
		}
	}
	
	private Person _root = new Person("root",10);
	private Person root {
		&{
			return this._root;
		}
	}
	
	public ObservableCollection<Person> _childs = new ObservableCollection<Person>();
	public ObservableCollection<Person> child{
		&{
			return this._childs;
		}
		+{
			ObservableCollection<Person> oldValue = this._childs;
			this._childs = value;
			if(oldValue != value){
				notify(this, new PropertyChangeEvent("child"));
			}
		}
	}
	
	public EventHandler addChild = (Event event)->{
		child.add(new Person("child1", 3));
		root.children.add(new Person("新增树节点!", 10));
		sample.children.add(new Person("KJKKKKKK", 10));
	};
	
	public EventHandler replaceChilds =  (Event event)->{
		ObservableCollection<Person> c1 = new ObservableCollection<Person>();
		c1.add(new Person("child11", 22));
		c1.add(new Person("child1", 3));
		child = c1;
	};
	 
	public EventHandler deleteChild =  (Event event)->{
		if(child.size > 0){ 
			child.removeAt(0);
		}
	};
	
	private String _style = "5px solid red";
	public String style{
		&{
			return this._style;
		}
		+{ 
			String oldValue = this._style;
			this._style = value;
			if(oldValue != value){
				notify(this, new PropertyChangeEvent("style"));
			}
		}  
	}
	 
	public EventHandler click = (Event event) ->{
		this.name = "tom" + index ++ ;
		alert(event.target.toString());
	};
	
	private String _name1 = "tom"; 
	public String name{
		&{
			return this._name1; 
		}
		+{ 
			String oldValue = this._name1;
			this._name1 = value;
			if(oldValue != value){
				notify(this, new PropertyChangeEvent("name"));
			}
		}  
	} 
	
	protected void notify(Object source, PropertyChangeEvent event){
		PropertyChange[] handlers = (PropertyChange[])listeners[event.propertyName];
		if(handlers != undefined){
			handlers.forEach((PropertyChange value, int index, Array<PropertyChange> array)->{
				value(source, event);
			});
		}
	}    
	
	EventHandler test = (Event event)->{
		if(event.target != ((HTMLDocument)document).body){
			return;
		}
//		alert(event.type);
		this.name = this.name + this.name;
//		ArrayList<String> l = new ArrayList<String>(10);
//		l.add("212121");
//		alert("sasasa");
	};
	
	void f(){

	}
	
	public EventHandler returnNav = (Event event)->{     
		KeyboardEvent keyEvt = (KeyboardEvent) event;
		if(keyEvt != undefined && keyEvt.target != undefined){ 
			HTMLElement srcEle=(HTMLElement) keyEvt.target; 
			if(keyEvt.keyCode == 13) {
				keyEvt.keyCode=keyEvt.charCode= 9; 
			}
		} 
	};

	public void addPropertyChangeListener(String propName, PropertyChange handler) {
		PropertyChange[] handlers = (PropertyChange[])listeners[propName];
		if(handlers == undefined){
			handlers = new Array<PropertyChange>();
			listeners[propName] = handlers;
		}
		handlers.push(handler);
	}

	public void removePropertyChangeListener(String propName, PropertyChange handler) {
		PropertyChange[] handlers = (PropertyChange[])listeners[propName];
		if(handlers != undefined){
			handlers.forEach((PropertyChange value, int index, Array<PropertyChange> array)->{
				if(value === handler){
					handlers.splice(index, 1);
				}
			});
		}
	}
}
 