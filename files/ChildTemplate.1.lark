import org.w3c.dom.Text;
import org.w3c.event.MouseEvent;
import org.w3c.event.MouseEventHandler;
import org.w3c.html.*;
import org.w3c.*;
/**
 * 
 * @author cym
 *
 */
public class ChildTemplate extends ItemTemplate {

	<div  className = "child">
		<span x:name = "item" className="hvr-fade"> <img src="img/expanded.gif" className="trrItemNode" onclick = "nodeClick" /> 
			<span onclick = "itemClick" className="treeItemTitle"> <Text data={Binding property="name" mode = "OneWay"} /> </span> </span>
		<div x:name = "children" className = "children" itemsConfig ={ItemsConfig path = "children" itemTemplate = "ChildTemplate"}>

		</div>
	</div>
	  
	private MouseEventHandler nodeClick = (MouseEvent event)->{
		if(children.style.display == "none"){
			children.style.display = "block";
		} else {
			children.style.display = "none";
		}
	};  
	
	private MouseEventHandler itemClick = (MouseEvent event)->{
		Person person = (Person) item.dataContext.dataItem;  
		person.selected = !person.selected;
		if(((HTMLElement)event.target).className == "treeItemTitle" && ((HTMLElement)event.target).style.backgroundColor == "blue"){
			((HTMLElement)event.target).style.removeProperty("background-color");
		} else {
			((HTMLElement)event.target).style.backgroundColor = "blue";
		}
	}; 
  
}
 